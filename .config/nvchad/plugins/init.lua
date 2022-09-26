return {
	["goolord/alpha-nvim"] = {
		disable = false,
	},
	["hrsh7th/nvim-cmp"] = {
		config = function()
			require("custom.plugins.config.cmp")
		end,
	},
	["tpope/vim-fugitive"] = { cmd = "G" },
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.config.null-ls").setup()
		end,
	},
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.config.lsp")
		end,
	},
	["iamcco/markdown-preview.nvim"] = {
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
