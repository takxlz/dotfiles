-- ノーマルモード復帰時にIMEを自動でオフにするプラグイン
return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  opts = {
    -- macism を使用してIMEを切り替える
    default_im_select = "com.apple.keylayout.ABC",
    default_command = "macism",
    set_previous_events = {},
  },
}
