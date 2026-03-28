return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "変更ファイル一覧（diff）" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "現在ファイルの履歴" },
  },
  opts = {},
}
