local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("plugins.catppuccin"),
  require("plugins.treesitter"),
  require("plugins.nvim-tree"),
  require("plugins.which-key"),
  require("plugins.lspconfig"),
  require("plugins.mason"),
  require("plugins.nvim-cmp"),
  require("plugins.trouble"),
  require("plugins.conform"),
  require("plugins.comment"),
  require("plugins.autopairs"),
  require("plugins.autotag"),
  require("plugins.surround"),
  require("plugins.lualine"),
  require("plugins.fzf"),
  require("plugins.flash"),
  require("plugins.harpoon"),
  require("plugins.noice"),
  require("plugins.zen"),
  require("plugins.blankline"),
})
