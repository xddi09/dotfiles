local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
}

function M.config()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    ensure_installed = {
      "typescript",
      "javascript",
      "tsx",
      "python",
      "lua",
      "go",
    },
    sync_install = true,
    auto_install = true,
    highlight = {
      enable = true,
    },
  })
end

return M
