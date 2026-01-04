return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "string", "template_string" },
      typescript = { "string", "template_string" },
      python = { "string", "template_string" },
    },
  },
}
