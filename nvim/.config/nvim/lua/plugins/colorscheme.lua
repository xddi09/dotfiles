return {
  {
    "catppuccin/nvim",
    lazy = true,
    opts = {
      flavor = "mocha",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      cache = false,
      on_highlights = function(hl, colors)
        print(hl.WinSeparator)
        hl.WinSeparator = { fg = colors.blue }
      end,
    },
  },
}
