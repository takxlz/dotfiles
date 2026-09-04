return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- LSP ログの肥大化を防ぐ。
    -- 言語サーバーの stderr は Neovim 側で ERROR として無条件に記録されるため、
    -- ログレベルを下げても止められない（rust-analyzer のパニックループで 21GB まで膨らんだ実績あり）。
    -- 直近のログは残しつつ上限を設けるため、起動時にサイズを見て切り詰める。
    local log_path = vim.lsp.get_log_path()
    local max_log_bytes = 50 * 1024 * 1024
    local stat = vim.uv.fs_stat(log_path)
    if stat and stat.size > max_log_bytes then
      vim.uv.fs_open(log_path, "w", 420, function(err, fd)
        if not err and fd then
          vim.uv.fs_close(fd)
        end
      end)
    end

    -- 全サーバー共通の設定
    vim.lsp.config("*", {
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })

    -- 使用する言語サーバーを有効化
    vim.lsp.enable({
      "lua_ls",
      "ts_ls",
      "pyright",
      "rust_analyzer",
      "jdtls",
      "jsonls",
      "html",
      "cssls",
    })

    -- LSP接続時のキーマップ・診断設定
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr }

        -- 定義・参照ジャンプ
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        -- ドキュメント・シグネチャ
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        -- コードアクション・リネーム
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cr", function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end, { buffer = bufnr, expr = true })

        -- インレイヒント切替
        vim.keymap.set("n", "<leader>ch", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
        end, opts)

        -- 診断ジャンプ
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
      end,
    })

    -- 診断表示の設定
    vim.diagnostic.config({
      underline = true,
      signs = true,
      update_in_insert = false,
      severity_sort = true,
      virtual_text = { spacing = 4, prefix = "●" },
      float = {
        border = "rounded",
        source = true,
      },
    })
  end,
}
