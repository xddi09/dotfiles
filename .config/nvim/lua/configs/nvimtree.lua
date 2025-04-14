local nvimtree = require("nvim-tree")
local defaults = require("nvchad.configs.nvimtree")

defaults.view.width = "100%"
defaults.view.adaptive_size = true

defaults.actions = {
	open_file = {
		quit_on_open = true,
	},
}

defaults.on_attach = function(bufnr)
	local map = vim.keymap.set
	local nomap = vim.keymap.del
	local api = require("nvim-tree.api")

	api.config.mappings.default_on_attach(bufnr)

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	nomap("n", "<C-v>", { buffer = bufnr, noremap = true })
	nomap("n", "<C-x>", { buffer = bufnr, noremap = true })

	map("n", "|", api.node.open.vertical, opts("Open: Vertical split"))
	map("n", "\\", api.node.open.horizontal, opts("Open: Horizontal split"))
end
