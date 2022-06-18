#!/bin/bash

# text editor
~/.dotfiles/.config/nvchad/install.sh 

# shell
mkdir -p ~/.config/omf
ln -s ~/.dotfiles/.config/omf/init.fish ~/.config/omf/init.fish

# terminal emulator
mkdir -p ~/.config/kitty
ln -s ~/.dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# window manager
mkdir -p ~/.config/yabai
ln -s ~/.dotfiles/.config/yabai/yabairc ~/.config/yabai/yabairc
