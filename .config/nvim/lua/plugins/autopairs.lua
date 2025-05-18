local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
}

function M.config()
  local autopairs = require("nvim-autopairs")

  autopairs.setup({
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "string", "template_string" },
      typescript = { "string", "template_string" },
      python = { "string", "template_string" },
    },
  })
end

return M
