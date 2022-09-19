return {
  ["goolord/alpha-nvim"] = {
    disable = false
  },
  ["hrsh7th/nvim-cmp"] = {
    config = function()
      require('custom.plugins.config.cmp')
    end
  },
  ["tpope/vim-fugitive"] = { cmd = 'G' },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.config.null-ls").setup()
    end,
  },
  ['neovim/nvim-lspconfig'] = {
     config = function ()
      require "plugins.configs.lspconfig"
      require "custom.plugins.config.lsp"
     end
  },
  ['frabjous/knap'] = {
    ft = 'tex',
    config = function ()
      local knap = require('knap')
      local kmap = vim.keymap.set

      -- F5 processes the document once, and refreshes the view
      kmap('i','<F5>', function() knap.process_once() end)
      kmap('v','<F5>', function() knap.process_once() end)
      kmap('n','<F5>', function() knap.process_once() end)

      -- F6 closes the viewer application, and allows settings to be reset
      kmap('i','<F6>', function() knap.close_viewer() end)
      kmap('v','<F6>', function() knap.close_viewer() end)
      kmap('n','<F6>', function() knap.close_viewer() end)

      -- F7 toggles the auto-processing on and off
      kmap('i','<F7>', function() knap.toggle_autopreviewing() end)
      kmap('v','<F7>', function() knap.toggle_autopreviewing() end)
      kmap('n','<F7>', function() knap.toggle_autopreviewing() end)

      -- F8 invokes a SyncTeX forward search, or similar, where appropriate
      kmap('i','<F8>', function() knap.forward_jump() end)
      kmap('v','<F8>', function() knap.forward_jump() end)
      kmap('n','<F8>', function() knap.forward_jump() end)
    end
  }
}
