local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
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

function M.config()
  local map = vim.keymap.set
  local fzf = require("fzf-lua")

  fzf.setup({
    fzf_colors = true,
    winopts = {
      backdrop = 100,
      border = M.border("FloatBorder"),
      preview = {
        border = M.border("FloatBorder"),
      },
    },
  })

  map("n", "<leader>ld", function()
    fzf.diagnostics_document()
  end, { desc = "Document diagnostics" })

  map("n", "<leader>lq", function()
    fzf.quickfix()
  end, { desc = "Quickfix list" })

  map("n", "<leader>fr", function()
    fzf.oldfiles({ cwd_only = true, stat_file = true })
  end, { desc = "Show recent files" })

  map("n", "<leader>ff", function()
    fzf.files()
  end, { desc = "Find files" })

  map("n", "<leader>fb", function()
    fzf.buffers({ sort_mru = true, sort_lastused = true })
  end, { desc = "Find files" })

  map("n", "<leader>gc", function()
    fzf.git_commits()
  end, { desc = "Git commits" })

  map("n", "<leader>gs", function()
    fzf.git_status()
  end, { desc = "Git status" })

  map("n", "<leader>lD", function()
    fzf.diagnostics_workspace()
  end, { desc = "Workspace diagnostics" })

  map("n", "<leader>sr", function()
    fzf.registers()
  end, { desc = "Registers" })

  map("n", "<leader>sa", function()
    fzf.autocmds()
  end, { desc = "Auto commands" })

  map("n", "<leader>sc", function()
    fzf.command_history()
  end, { desc = "Command history" })

  map("n", "<leader>sr", function()
    fzf.live_grep()
  end, { desc = "Live grep" })
end

return M
