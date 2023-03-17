#!/bin/bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && 
  ln -s ~/.dotfiles/.config/nvchad/ ~/.config/nvim/lua/custom
mkdir -p ~/.config/nvim/ftplugin
ln -s ~/.dotfiles/.config/nvchad/config/nvim-jdtls.lua ~/.config/nvim/ftplugin/java.lua
