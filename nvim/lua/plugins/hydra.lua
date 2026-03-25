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
        { ">", "3<C-w>>", { desc = "wider" } },
        { "<", "3<C-w><", { desc = "narrower" } },
        { "+", "3<C-w>+", { desc = "taller" } },
        { "-", "3<C-w>-", { desc = "shorter" } },
        { "=", "<C-w>=", { desc = "equal" } },
        { "<Esc>", nil, { exit = true } },
      },
      config = {
        hint = { type = "statusline" },
      },
    })
  end,
}