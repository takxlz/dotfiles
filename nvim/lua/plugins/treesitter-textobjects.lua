return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "関数全体" },
            ["if"] = { query = "@function.inner", desc = "関数内部" },
            ["ac"] = { query = "@class.outer", desc = "クラス全体" },
            ["ic"] = { query = "@class.inner", desc = "クラス内部" },
            ["aa"] = { query = "@parameter.outer", desc = "引数全体" },
            ["ia"] = { query = "@parameter.inner", desc = "引数内部" },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "次の関数" },
            ["]c"] = { query = "@class.outer", desc = "次のクラス" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "前の関数" },
            ["[c"] = { query = "@class.outer", desc = "前のクラス" },
          },
        },
      },
    })
  end,
}
