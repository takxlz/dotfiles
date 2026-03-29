-- スクロール時に関数名・クラス名を画面上部に固定表示
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  opts = {
    max_lines = 3,
  },
}
