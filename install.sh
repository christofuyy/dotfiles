#!/bin/bash

# text editor
~/.dotfiles/.config/nvchad/install.sh 

# shell
mkdir -p ~/.config/omf
ln -s ~/.dotfiles/.config/omf/init.fish ~/.config/omf/init.fish

# window manager
mkdir -p ~/.config/yabai
ln -s ~/.dotfiles/.config/yabai/yabairc ~/.config/yabai/yabairc
