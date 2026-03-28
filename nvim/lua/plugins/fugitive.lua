return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gdiffsplit", "Gvdiffsplit" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "git status" },
    { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "git diff（縦分割）" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "git blame" },
    { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "git log" },
  },
}
