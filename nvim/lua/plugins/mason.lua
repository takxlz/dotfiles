return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  event = "VeryLazy",
  cmd = "Mason",
  opts = {
    ensure_installed = {
      -- LSP
      "lua-language-server",
      "typescript-language-server",
      "pyright",
      "rust-analyzer",
      "jdtls",
      "json-lsp",
      "html-lsp",
      "css-lsp",
      -- フォーマッター
      "stylua",
      "prettier",
      "black",
      -- リンター
      "eslint_d",
      "ruff",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)

    -- ensure_installed のパッケージを自動インストール
    local registry = require("mason-registry")
    registry.refresh(function()
      for _, name in ipairs(opts.ensure_installed) do
        local pkg = registry.get_package(name)
        if not pkg:is_installed() then
          pkg:install()
        end
      end
    end)
  end,
}
