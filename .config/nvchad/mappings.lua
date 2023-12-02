local M = {}

M.disabled = {
	n = {
		["<leader>ls"] = "",
		["<leader>x"] = "",
		["<leader>n"] = "",
		["<leader>fm"] = "",
		["<leader>fa"] = "",
		["<leader>fb"] = "",
		["<leader>ff"] = "",
		["<leader>fh"] = "",
		["<leader>fo"] = "",
		["<leader>fw"] = "",
		["<leader>ra"] = "",
		["<leader>gt"] = "",
	},
}

M.general = {
	n = {
		["<leader>l"] = { "<cmd> :wincmd l<CR>", "change window right" },
		["<leader>h"] = { "<cmd> :wincmd h<CR>", "change window left" },
		["<leader>j"] = { "<cmd> :wincmd j<CR>", "change window down" },
		["<leader>k"] = { "<cmd> :wincmd k<CR>", "change window up" },
		["<leader>v"] = { "<cmd> :vsplit <CR>", "create vertical split" },
		["<leader>b"] = { "<cmd> :split <CR>", "create horizontal split" },
		["<leader>="] = { "<cmd> :vertical resize +5 <CR>", "increase window width" },
		["<leader>-"] = { "<cmd> :vertical resize -5 <CR>", "decrease window width" },
	},
}

M.nvimtree = {
	n = {
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvim tree" },
	},
}

M.telescope = {
	n = {
		["<C-n>"] = { "<cmd> :Telescope buffers <CR>", "Search file in buffers" },
		["<C-g>"] = { "<cmd> :Telescope git_files <CR>", "Search file in git" },
		["<C-p>"] = { "<cmd> :Telescope find_files <CR>", "Search file in current directory" },
		["<C-s>"] = { "<cmd> :Telescope live_grep <CR>", "Search for string" },
	},
}

M.lsp = {
	n = {
		["[d"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"Go to prev diagnostic",
		},
		["]d"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"Go to next diagnostic",
		},
		["<leader>f"] = {
			function()
				vim.lsp.buf.format({ async = true }) -- update from deprecated
			end,
			"lsp formatting",
		},
		["<leader>rn"] = {
			function()
				require("nvchad.renamer").open()
			end,
			"lsp rename",
		},
		-- Restating defaults because lsp mappings don't load with nvim-jdtls for some reason
		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"lsp definition",
		},
		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"lsp hover",
		},
		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"lsp code_action",
		},
		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"lsp references",
		},
	},
}

M.git = {
	n = {
		["<leader>gs"] = { "<cmd> :above G<CR>", "git status" },
    ["<leader>gl"] = { "<cmd> :G log --oneline<CR>", "git log" },
    ["<leader>dv"] = { "<cmd> :DiffviewOpen<CR>", "diffview" },
	},
}

M.copilot = {
	n = {
		["<leader>cp"] = {
			function()
				require("copilot.panel").open({ "bot", 0.3 })
			end,
		},
	},
	i = {
		["<C-f>"] = {
			function()
				require("copilot.suggestion").accept()
			end,
			"accept Copilot suggestion",
		},
		["<C-j>"] = {
			function()
				require("copilot.suggestion").next()
			end,
		},
		["<C-k>"] = {
			function()
				require("copilot.suggestion").prev()
			end,
		},
	},
}

return M
