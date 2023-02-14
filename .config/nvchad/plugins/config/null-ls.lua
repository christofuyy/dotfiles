local null_ls = require "null-ls"
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
  b.formatting.rustfmt
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,
  }
end

return M
