local M = {}

M.ui = {
  theme = "onedark",
}

M.options = {
  user = function()
    require('custom.options')
  end
}

M.mappings = require('custom.mappings')

M.plugins = {
  remove = {
    "NvChad/nvterm"
  },
  user = require('custom.plugins'),
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.config.lsp"
    }
  }
}

return M
