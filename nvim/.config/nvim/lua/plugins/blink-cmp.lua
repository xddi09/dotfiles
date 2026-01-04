return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  version = "1.*",
  opts = {
    completion = {
      list = {
        selection = {
          auto_insert = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        window = {
          border = "single",
          max_height = 20,
          max_width = 50,
        },
      },
      menu = {
        auto_show = true,
        border = "single",
        draw = {
          columns = {
            { "kind_icon", gap = 1 },
            { "label", "label_description" },
            { "kind" },
          },
          treesitter = { "lsp" },
        },
      },
    },
    sources = {
      default = { "buffer", "lsp", "snippets" },
    },
    keymap = {
      ["<tab>"] = { "select_and_accept", "fallback" },
      ["<c-n>"] = { "select_next", "show", "fallback" },
      ["<c-p>"] = { "select_prev", "show", "fallback" },
    },
  },
}
