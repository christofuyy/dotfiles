return {
  ["goolord/alpha-nvim"] = {
    disable = false
  },
  ["hrsh7th/nvim-cmp"] = {
    config = function()
      require('custom.plugins.config.cmp')
    end
  },
  ["tpope/vim-fugitive"] = { cmd = 'G' }
}
