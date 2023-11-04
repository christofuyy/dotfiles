local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
	-- python
	null_ls.builtins.formatting.black,

	-- Web dev
	b.formatting.prettierd,

	-- Lua
	b.formatting.stylua,

	-- Shell
	b.formatting.shfmt,

	-- LaTeX
	b.formatting.latexindent,

	-- Haskell
	b.formatting.stylish_haskell,

	-- Rust
	b.formatting.rustfmt,

	-- SQL
	b.formatting.sql_formatter,
	-- b.formatting.sqlfluff.with({
	--   extra_args={"--dialect","sqlite"}
	-- })

	-- C++
	b.formatting.clang_format.with({
		filetypes = { "c", "cpp", "h", "hpp" },
	}),

	-- Java
	b.formatting.google_java_format,
}

local M = {}

M.setup = function()
	null_ls.setup({
		debug = true,
		sources = sources,
	})
end

return M
