return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  settings = {},
  on_attach = function(client, bufnr)
    local map = vim.keymap.set

    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   buffer = bufnr,
    --   callback = function()
    --     vim.lsp.buf.code_action({
    --       context = { only = { "source.organizeImports" } },
    --       apply = true,
    --     })
    --     vim.wait(100)
    --   end,
    -- })
  end,
}
