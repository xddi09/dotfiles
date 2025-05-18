local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  local lualine = require("lualine")

  lualine.setup({
    options = {
      section_separators = {
        left = "",
        right = "",
      },
      component_separators = {
        left = "",
        right = "",
      },
      globalstatus = true,
    },
  })
end

return M
