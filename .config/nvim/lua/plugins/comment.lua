local M = {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
}

function M.config()
  local comment = require("Comment")
  comment.setup({})
end

return M
