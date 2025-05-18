local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
}

function M.config()
  local blankline = require("ibl")
  blankline.setup({})
end

return M
