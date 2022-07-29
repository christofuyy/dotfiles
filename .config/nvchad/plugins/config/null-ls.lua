local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  -- python
  null_ls.builtins.formatting.black,

  -- Web dev
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
  b.formatting.deno_fmt,

  -- Java
  b.formatting.google_java_format,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,
  }
end

return M
