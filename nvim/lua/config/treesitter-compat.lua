-- nvim-treesitter（master ブランチ）と Neovim 0.12 の互換レイヤ。
--
-- 0.12 で query.add_directive / add_predicate の `all` オプションが廃止され、
-- ハンドラに渡る match[capture_id] が常にノードの配列になった。
-- master の nvim-treesitter は `{ all = false }` を渡して単一ノード前提のままなので、
-- `#downcase!` などが配列を TSNode として扱い node:range() で落ちる
-- （例: markdown の ```bash フェンス内に heredoc があると発生）。
--
-- ここでは nvim-treesitter のハンドラを登録し直し、渡す直前に配列を単一ノードへ
-- 畳むラッパを挟む。ハンドラは適用時に名前で引かれるので、登録済みのクエリにも
-- 即座に効く。
--
-- nvim-treesitter を main ブランチへ移行したらこのファイルごと削除してよい。

local M = {}

--- 配列になった match を、単一ノード前提のハンドラ向けに畳む。
--- 0.11 以前の `all = false` と同じく末尾のノードを採る。
---@param match table<integer, TSNode[]>
---@return table<integer, TSNode>
local function fold(match)
  local single = {}
  for id, nodes in pairs(match) do
    single[id] = type(nodes) == "table" and nodes[#nodes] or nodes
  end
  return single
end

---@param register fun(name: string, handler: function, opts: any)
---@return fun(name: string, handler: function, opts: any)
local function wrap(register)
  return function(name, handler, opts)
    register(name, function(match, ...)
      return handler(fold(match), ...)
    end, opts)
  end
end

function M.setup()
  local query = require("vim.treesitter.query")
  local add_directive, add_predicate = query.add_directive, query.add_predicate

  query.add_directive = wrap(add_directive)
  query.add_predicate = wrap(add_predicate)

  -- query_predicates は require 時に一括登録する。読み込み済みなら破棄して読み直す。
  local ok, err = pcall(function()
    package.loaded["nvim-treesitter.query_predicates"] = nil
    require("nvim-treesitter.query_predicates")
  end)

  query.add_directive = add_directive
  query.add_predicate = add_predicate

  if not ok then
    vim.notify("treesitter-compat: 再登録に失敗しました: " .. tostring(err), vim.log.levels.WARN)
  end
end

return M
