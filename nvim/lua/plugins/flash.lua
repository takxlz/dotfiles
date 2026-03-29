-- 画面内の任意の場所に高速ジャンプ
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = { enabled = false },
      search = { enabled = false },
    },
  },
  keys = {
    { "gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
