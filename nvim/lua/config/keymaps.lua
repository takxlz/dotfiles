local map = vim.keymap.set

-- インサートモードを抜ける
map("i", "jj", "<Esc>")
map("i", "っｊ", "<Esc>")

-- 検索ハイライト解除
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- s をプレフィックスとして使う（デフォルトの s を無効化）
map("n", "s", "<Nop>")

-- ウィンドウ分割
map("n", "sv", "<cmd>vsplit<cr>")
map("n", "ss", "<cmd>split<cr>")

-- ウィンドウ移動
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")

-- ウィンドウ閉じる
map("n", "sq", "<cmd>close<cr>")

-- タブ操作
map("n", "st", "<cmd>tabnew<cr>")
map("n", "sn", "<cmd>tabnext<cr>")
map("n", "sp", "<cmd>tabprevious<cr>")

-- バッファ移動
map("n", "[b", "<cmd>bprevious<cr>")
map("n", "]b", "<cmd>bnext<cr>")

-- 行移動（ビジュアルモードで選択行を上下に動かす）
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

-- ヤンクを上書きしない貼り付け
map("x", "<leader>p", '"_dP')

-- 保存
map("n", "<leader>w", "<cmd>w<cr>")

-- カーソル下の単語をハイライト（複数単語を同時にハイライト可能）
vim.api.nvim_set_hl(0, "WordHighlight1", { fg = "#000000", bg = "#e8a040" }) -- オレンジ
vim.api.nvim_set_hl(0, "WordHighlight2", { fg = "#000000", bg = "#40a0e8" }) -- 青
vim.api.nvim_set_hl(0, "WordHighlight3", { fg = "#000000", bg = "#60c060" }) -- 緑
vim.api.nvim_set_hl(0, "WordHighlight4", { fg = "#000000", bg = "#e06080" }) -- 赤
vim.api.nvim_set_hl(0, "WordHighlight5", { fg = "#000000", bg = "#c080e0" }) -- 紫
vim.api.nvim_set_hl(0, "WordHighlight6", { fg = "#000000", bg = "#e0d060" }) -- 黄
local highlight_colors = { "WordHighlight1", "WordHighlight2", "WordHighlight3", "WordHighlight4", "WordHighlight5", "WordHighlight6" }
local highlight_index = 0
map("n", "<leader><Space>", function()
  local word = vim.fn.expand("<cword>")
  if word == "" then
    return
  end
  highlight_index = (highlight_index % #highlight_colors) + 1
  vim.fn.matchadd(highlight_colors[highlight_index], "\\<" .. vim.fn.escape(word, "\\") .. "\\>")
end)

-- チートシートをフロートウィンドウで表示
map("n", "<leader>?", function()
  local path = vim.fn.stdpath("config") .. "/CHEATSHEET.md"
  local lines = vim.fn.readfile(path)

  -- ウィンドウサイズ（画面の80%）
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].modifiable = false

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " CHEATSHEET ",
    title_pos = "center",
  })

  -- Esc2回で閉じる
  vim.keymap.set("n", "<Esc><Esc>", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })
end)

-- ハイライトをすべてクリア
map("n", "<Esc>", function()
  vim.cmd("nohlsearch")
  vim.fn.clearmatches()
  highlight_index = 0
end)