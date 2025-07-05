local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
  },
}

M.kind_icons = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Snippet = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
  Copilot = "",
}

M.source_names = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  luasnip = "[LuaSnip]",
  nvim_lua = "[Lua]",
  latex_symbols = "[LaTeX]",
  copilot = "[Copilot]",
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
  local cmp = require("cmp")

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
        vim.snippet.expand(args.body)
      end,
    },
    window = {
      completion = {
        border = M.border("FloatBorder"),
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      },
      documentation = {
        border = M.border("FloatBorder"),
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-1),
      ["<C-f>"] = cmp.mapping.scroll_docs(1),
      ["<C-y>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "vsnip" }, -- For vsnip users.
    }, {
      { name = "buffer" },
      { name = "nvim_lsp_signature_help" },
    }),
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, item)
        item.kind = string.format("%s %s", M.kind_icons[item.kind], item.kind)
        item.menu = M.source_names[entry.source.name]
        return item
      end,
    },
  })
end

return M
