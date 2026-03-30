return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    cmdline = {
      enabled = true,
      keymap = {
        -- 候補が選択されていれば確定、なければコマンド実行
        ["<CR>"] = { "accept_and_enter", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
      },
      completion = {
        list = { selection = { preselect = false, auto_insert = false } },
        menu = { auto_show = true },
      },
    },
    completion = {
      list = { selection = { preselect = false, auto_insert = false } },
      menu = { border = "rounded" },
      documentation = { auto_show = true, window = { border = "rounded" } },
    },
  },
}
