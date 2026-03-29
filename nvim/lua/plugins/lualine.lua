return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "tokyonight",
      section_separators = { left = "\u{e0b0}", right = "\u{e0b2}" },
      component_separators = { left = "\u{e0b1}", right = "\u{e0b3}" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = {
        {
          "searchcount",
          maxcount = 999,
        },
        {
          function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then return "" end
            local names = {}
            for _, client in ipairs(clients) do
              table.insert(names, client.name)
            end
            return " " .. table.concat(names, ", ")
          end,
        },
        "filetype",
      },
      lualine_y = {
        { "encoding", fmt = string.upper },
        { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
        "progress",
      },
      lualine_z = { "location" },
    },
  },
}
