local M = {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
}

function M.config()
  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "ruff",
      "basedpyright",
    },
  })
end

return M
