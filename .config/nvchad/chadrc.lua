local M = {}

M.ui = {
	theme = "onedark",

	statusline = {
		theme = "minimal",
		separator_style = "round",
	},
	hl_override = {
		DiffAdd = { bg = { "blue", -50 } },
		DiffDelete = { bg = { "red", -50 } },
	},
}

M.mappings = require("custom.mappings")

M.plugins = "custom.plugins"

return M
