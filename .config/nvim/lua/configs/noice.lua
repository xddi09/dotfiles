local noice = require "noice"

noice.setup {
  cmdline = {
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
    },
  },
  notify = {
    enabled = false,
  },
  messages = {
    enabled = false,
  },
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },
}
