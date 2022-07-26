local M = {}

M.ui = {
  theme = "onedark",
}

M.mappings = require('custom.mappings')

M.plugins = {
  remove = {
    "NvChad/nvterm"
  },
  user = require('custom.plugins'),
}

return M
