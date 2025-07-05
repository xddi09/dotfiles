local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
}

function M.config()
  local noice = require("noice")

  noice.setup({
    cmdline = {
      enabled = true,
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
      },
    },
    -- notify = {
    --   enabled = false,
    -- },
    -- messages = {
    --   enabled = false,
    -- },
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
        auto_open = {
          enabled = false,
          trigger = true,
        }
      },
    },
  })
end

return M
