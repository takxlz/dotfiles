return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "ファイル検索" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "grep検索" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "バッファ一覧" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "ヘルプ検索" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "最近開いたファイル" },
    { "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "診断一覧" },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "シンボル検索" },
  },
  opts = {
    winopts = {
      border = "rounded",
      preview = { layout = "vertical" },
    },
  },
}
