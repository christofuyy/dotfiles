local M = {}

M.ui = {
	theme = "onedark",

	statusline = {
		theme = "minimal",
		separator_style = "round",
	},
  hl_add = {
		DiffviewDiffAdd = { bg = { "green", -50 }, fg = "green" },
		DiffviewDiffDelete = { bg = { "red", -50 } },
		DiffviewDiffText = { bg = { "blue", -25}, fg = {"blue", 20} },
		DiffviewDiffChange = { bg = { "blue", -50 }, fg = "blue" },
  }
}

M.mappings = require("custom.mappings")

M.plugins = "custom.plugins"

return M
