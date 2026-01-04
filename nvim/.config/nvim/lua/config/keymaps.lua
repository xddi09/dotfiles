local map = vim.keymap.set

-- General
map("n", "<esc>", "<CMD>noh<CR>", { desc = "Clear hightlight" })

-- Files
map("n", "<leader>fs", "<CMD>w<CR><ESC>", { desc = "Save file" })
map("n", "<leader>fn", "<CMD>enew<CR>", { desc = "New file" })

-- Buffers
map("n", "<leader>[", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>]", "<CMD>bnext<CR>", { desc = "Next buffer" })

-- Windows
map("n", "<leader>wQ", "<CMD>qa<CR>", { desc = "Quit all windows" })

-- Lsp
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
