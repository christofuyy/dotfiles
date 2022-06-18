-- Bootstrap Packer (Nvim package manager)

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Load plugins

return require('packer').startup(function(use)
  use {'lewis6991/impatient.nvim'}
  use {'wbthomason/packer.nvim', event = "VimEnter"}
  use {
    'norcalli/nvim-base16.lua',
    config = function()
      local base16 = require('base16')
      base16.themes['onedark'] = {
        base00 = "1e222a";
        base01 = "1e222a";
        base02 = "3e4451";
        base03 = "545862";
        base04 = "565c64";
        base05 = "abb2bf";
        base06 = "b6bdca";
        base07 = "c8ccd4";
        base08 = "e06c75";
        base09 = "d19a66";
        base0A = "e5c07b";
        base0B = "98c379";
        base0C = "56b6c2";
        base0D = "61afef";
        base0E = "c678dd";
        base0F = "be5046";
      }
      base16(base16.themes['onedark'],true)
    end
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      event = 'BufRead',
      config = function()
          require('nvim-treesitter.configs').setup {
              ensure_installed = 'all',
              highlight = {enable = true, use_languagetree = true},
              -- TODO: Autotags not working; have to use nvim-ts-autotag plugin
              autotag = {enable = true},
              indent = {enable = true}
          }
      end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
