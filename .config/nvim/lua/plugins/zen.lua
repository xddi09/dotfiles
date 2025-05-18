local M = {
  "folke/zen-mode.nvim",
  event = "BufReadPre",
}

function M.config()
  local map = vim.keymap.set
  local zenmode = require("zen-mode")

  zenmode.setup({})

  map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen mode" })
end

return M
