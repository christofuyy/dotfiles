local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require('lspconfig')
  local servers = { "pyright", 'clangd', 'tsserver', 'r_language_server', 'jdtls' }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities
    }
  end
end

return M
