return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "次のTODOへジャンプ" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "前のTODOへジャンプ" },
    { "<leader>ft", "<cmd>TodoFzfLua<cr>", desc = "TODO一覧検索" },
  },
  opts = {},
}
