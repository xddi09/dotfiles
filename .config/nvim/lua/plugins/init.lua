return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			require("configs.nvimtree")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
			},
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("configs.autotag")
		end,
	},

	{
		"folke/flash.nvim",
		event = "BufReadPre",
		config = function()
			require("configs.flash")
		end,
	},

	{
		"ThePrimeagen/harpoon",
		event = "BufReadPre",
		config = function()
			require("configs.harpoon")
		end,
	},

	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		event = "VeryLazy",
		config = function()
			require("configs.noice")
		end,
	},

	{
		"folke/zen-mode.nvim",
		event = "BufReadPre",
		config = function()
			require("configs.zen")
		end,
	},

	-- Integrations

	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		config = function()
			require("configs.tmux")
		end,
	},

	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = {
			"KittyScrollbackGenerateKittens",
			"KittyScrollbackCheckHealth",
			"KittyScrollbackGenerateCommandLineEditing",
		},
		event = { "User KittyScrollbackLaunch" },
		-- version = '*', -- latest stable version, may have breaking changes if major version changed
		-- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
		config = function()
			require("kitty-scrollback").setup()
		end,
	},
}
