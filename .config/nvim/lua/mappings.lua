require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Unset

nomap("n", "<C-C>")
nomap("n", "<C-N>")
nomap("n", "<C-S>")
nomap("n", "<M-h>")
nomap("n", "<M-i>")
nomap("n", "<M-v>")
nomap("n", "<S-Tab>")

-- Common

map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "U", "<C-r>", { desc = "Redo operation" })
map("n", "<leader>h", "<cmd> nohlsearch <CR>", { desc = "Disable highlight" })
map("n", "|", "<cmd> vsplit<CR>", { desc = "Split vertically" })
map("n", "\\", "<cmd> split<CR>", { desc = "Split horizontally" })

map("n", "<Tab>", "<C-w>", { desc = "Window" })
map("n", "<leader>w", "<cmd> w <CR>", { desc = "File save" })
map("n", "<leader>q", "<C-w><C-q>", { desc = "File close" })
map("n", "<leader>n", "<cmd> enew <CR>", { desc = "File new" })

-- Harpoon

map("n", "<leader>h", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon add file" })

map("n", "<leader>`", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon toggle menu" })

map("n", "<leader>1", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon go to 1 file" })

map("n", "<leader>2", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "Harpoon go to 2 file" })

map("n", "<leader>3", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "Harpoon go to 3 file" })

map("n", "<leader>4", function()
  require("harpoon.ui").nav_file(4)
end, { desc = "Harpoon go to 4 file" })

-- Flash

map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash jump" })

map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter selection" })

-- Tmux navigation

map("n", "<C-h>", function()
  require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
end, { desc = "Navigate left tmux pane" })

map("n", "<C-j>", function()
  require("nvim-tmux-navigation").NvimTmuxNavigateDown()
end, { desc = "Navigate down tmux pane" })

map("n", "<C-k>", function()
  require("nvim-tmux-navigation").NvimTmuxNavigateUp()
end, { desc = "Navigate up tmux pane" })

map("n", "<C-l>", function()
  require("nvim-tmux-navigation").NvimTmuxNavigateRight()
end, { desc = "Navigate right tmux pane" })

-- Zen

map("n", "<leader>z", "<cmd> ZenMode <CR>", { desc = "Zen mode toggle" })
