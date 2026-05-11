return {
  "nvimtools/hydra.nvim",
  keys = { { "s<Space>", desc = "Window resize mode" } },
  config = function()
    local Hydra = require("hydra")

    Hydra({
      name = "Window resize",
      mode = "n",
      body = "s<Space>",
      heads = {
        { "l", "3<C-w>>", { desc = "wider" } },
        { "h", "3<C-w><", { desc = "narrower" } },
        { "k", "3<C-w>+", { desc = "taller" } },
        { "j", "3<C-w>-", { desc = "shorter" } },
        { "=", "<C-w>=", { desc = "equal" } },
        { "<Esc>", nil, { exit = true } },
      },
      config = {
        hint = { type = "statusline" },
      },
    })
  end,
}