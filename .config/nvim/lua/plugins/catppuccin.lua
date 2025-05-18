local M = {
  "catppuccin/nvim",
  lazy = false,
}

function M.config()
  local catppuccin = require("catppuccin")

  catppuccin.setup({
    highlight_overrides = {
      all = function(colors)
        return {
          CursorLine = { bg = colors.surface0 },
          NormalFloat = { bg = colors.crust, fg = colors.text },
          FloatBorder = { bg = colors.crust, fg = colors.blue },
          FzfLuaNormal = { bg = colors.crust, fg = colors.text },
        }
      end,
    },
    integrations = {
      fzf = true,
    },
  })
end

return M
