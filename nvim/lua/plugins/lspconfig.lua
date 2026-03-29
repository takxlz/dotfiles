return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
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
