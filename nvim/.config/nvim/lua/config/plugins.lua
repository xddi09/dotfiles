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
  require("plugins.colorscheme"),
  require("plugins.snacks"),
  require("plugins.flash"),
  require("plugins.which-key"),
  require("plugins.lualine"),
  require("plugins.treesitter"),
  require("plugins.mason"),
  require("plugins.autopairs"),
  require("plugins.autotag"),
  require("plugins.conform"),
  require("plugins.blink-cmp"),
  -- require("plugins.lspconfig"),
  -- require("plugins.cmp"),
  require("plugins.comment"),
  require("plugins.surround"),
})
