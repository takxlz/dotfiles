return {
  "stevearc/aerial.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<cr>", desc = "シンボル一覧の表示切替" },
  },
  opts = {
    layout = {
      min_width = 30,
    },
  },
}
