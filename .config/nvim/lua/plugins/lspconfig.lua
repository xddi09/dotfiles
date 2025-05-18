local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "smjonas/inc-rename.nvim",
  },
}

function M.border(hl_name)
  return {
    { "┌", hl_name },
    { "─", hl_name },
    { "┐", hl_name },
    { "│", hl_name },
    { "┘", hl_name },
    { "─", hl_name },
    { "└", hl_name },
    { "│", hl_name },
  }
end

M.config = function()
  local map = vim.keymap.set
  local lspconfig = require("lspconfig")
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  require("neodev").setup({})
  require("inc_rename").setup({})

  local open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or M.border("FloatBorder")
    return open_floating_preview(contents, syntax, opts, ...)
  end

  lspconfig.lua_ls.setup({ capabilities = capabilities, handlers = handlers })

  map("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, { desc = "Previous diagnostic" })
  map("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, { desc = "Next diagnostic" })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      local bufmap = function(mode, lhs, rhs, desc)
        local opts = { buffer = ev.buf, desc = desc }
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      bufmap("i", "<C-Space>", "<C-x><C-o>", "Complete code")
      bufmap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
      bufmap("n", "K", vim.lsp.buf.hover, "Show documentation")
      bufmap("n", "gd", vim.lsp.buf.definition, "Jump to definition")
      bufmap("n", "gD", vim.lsp.buf.declaration, "Jump to declaration")
      bufmap("n", "gi", vim.lsp.buf.implementation, "Jump to implementation")
      bufmap("n", "gr", vim.lsp.buf.references, "Jump to implementation")
      bufmap("n", "<leader>lr", ":IncRename ", "Rename")
      bufmap("n", "<leader>la", vim.lsp.buf.code_action, "Code actions")
      bufmap("n", "<leader>lf", function()
        -- vim.lsp.buf.format({ async = true })
        require("conform").format({
          lsp_fallback = true,
          timeout_ms = 500,
        })
      end, "Format")
    end,
  })
end

return M
