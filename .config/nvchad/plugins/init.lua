return {
  ["NvChad/nvterm"] = false,
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
  -- nvim-lspconfig not sufficient. ex. annotations are not generated without nvim-jdtls
	["mfussenegger/nvim-jdtls"] = {
    config = function()
      require("custom.plugins.config.nvim-jdtls")
    end,
    ft = { "java" }
  },
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" , "typescriptreact"},
    after = "nvim-treesitter",
    config = function()
      local present, autotag = pcall(require, "nvim-ts-autotag")

      if present then
        autotag.setup()
      end
    end,
  },
}
