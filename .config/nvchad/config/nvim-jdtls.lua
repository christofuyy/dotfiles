if vim.fn.has("mac") == 1 then
	OS_NAME = "mac"
elseif vim.fn.has("unix") == 1 then
	OS_NAME = "linux"
else
	OS_NAME = "win"
end

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local eclipse_jar_path = jdtls_path .. "/plugins/org.eclipse.equinox.launcher_<VERSION>.jar"

if eclipse_jar_path == jdtls_path .. "/plugins/org.eclipse.equinox.launcher_<VERSION>.jar" then
	vim.notify("Eclipse .jar not set", vim.log.levels.ERROR, { title = "nvim-jdtls" })
end

local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-javaagent:" .. jdtls_path .. "/lombok.jar",

		"-jar",
    eclipse_jar_path,

		"-configuration",
		jdtls_path .. "/config_" .. OS_NAME,

		"-data",
		vim.fn.getenv("HOME") .. "/.cache/jdtls/workspace",
	},

	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

	settings = {
		java = {},
	},

	init_options = {
		bundles = {},
	},
}

require("jdtls").start_or_attach(config)
-- disable semantic highlighting from lsp for java files
-- https://github.com/simrat39/rust-tools.nvim/issues/365
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	vim.api.nvim_set_hl(0, group, {})
end
