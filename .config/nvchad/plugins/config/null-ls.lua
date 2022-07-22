local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  null_ls.builtins.formatting.black,

  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
  b.formatting.deno_fmt,

  b.formatting.google_java_format,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,
  }
end

return M
