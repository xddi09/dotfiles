local M = {
  "folke/flash.nvim",
  event = "BufReadPre",
}

function M.config()
  local map = vim.keymap.set
  local flash = require("flash")

  flash.setup({})

  map({ "n", "x", "o" }, "s", flash.jump, { desc = "Jump line" })
  map({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Jump line (Treesitter)" })
end

return M
