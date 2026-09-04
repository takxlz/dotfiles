return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "ファイルツリー表示切替" },
  },
  opts = {
    filesystem = {
      -- OS のファイル監視で外部からのファイル変更をツリーに自動反映する。
      -- false のままだと nvim 内で保存したときしか更新されない。
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
      },
    },
  },
}
