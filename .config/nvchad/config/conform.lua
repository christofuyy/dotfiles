local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		java = { "google-java-format" },
		gdscript = { "gdformat" },
	},
}

return options
