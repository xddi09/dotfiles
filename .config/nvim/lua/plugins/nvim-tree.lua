local M = {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  local map = vim.keymap.set

  map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "Open tree" })

  require("nvim-tree").setup({
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local bufmap = function(mode, lhs, rhs, desc)
        local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = desc }
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      api.config.mappings.default_on_attach(bufnr)

      bufmap("n", "|", api.node.open.vertical, "Open file with vertical split")
      bufmap("n", "\\", api.node.open.horizontal, "Open file with horizontal split")
      bufmap("n", "l", api.node.open.edit, "Open file")
    end,
  })
end

return M
