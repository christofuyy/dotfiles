return {
	{
		"NvChad/nvterm",
		enabled = false,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			return require("custom.config.cmp")
		end,
	},
	{ "tpope/vim-fugitive", cmd = "G" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("custom.config.null-ls").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.config.lsp")
		end,
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	-- nvim-lspconfig not sufficient. ex. annotations are not generated without nvim-jdtls
	{
		"mfussenegger/nvim-jdtls",
		-- nvim-jdtls does not work with this lazy config; only works by putting nvim-jdtls config
		-- in ~/.config/nvim/ftplugin
		--
		-- config = function()
		--   require("custom.config.nvim-jdtls")
		-- end,
		ft = { "java" },
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascriptreact", "typescriptreact" },
		config = function()
			local present, autotag = pcall(require, "nvim-ts-autotag")

			if present then
				autotag.setup()
			end
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("custom.config.copilot").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua
				"lua-language-server",
				"stylua",

				-- rust
				"rust-analyzer",
				"rustfmt",

				-- python
				"pyright",
				"black",

				-- java
				"jdtls",

				-- javascript / typescript
				"typescript-language-server",
				"prettierd",

				-- cpp
				"clangd",
				"clang-format",

				-- sql
				"sqlls",
				"sql-formatter",

				-- haskell
				"haskell-language-server",

				-- latex
				"ltex-ls",
				"latexindent",

				-- docker
				"dockerfile-language-server",

				-- yaml
				"yaml-language-server",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			require("custom.config.treesitter")
		end,
	},
}
