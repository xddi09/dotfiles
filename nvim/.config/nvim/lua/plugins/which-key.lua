return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Which key",
    },
  },
  opts = {},
  config = function()
    local wk = require("which-key")

    wk.add({
      { "gs", group = "surround" },
      { "gc", group = "comment" },
      { "gr", group = "lsp" },
      { "<leader>w", proxy = "<C-w>", group = "windows" },
      { "<leader>f", group = "files" },
      { "<leader>b", group = "buffers" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "lsp" },
    })
  end,
}
