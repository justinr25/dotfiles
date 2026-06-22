#!/usr/bin/env sh

# Create config directories if they don't exist
mkdir -p ~/.config
mkdir -p ~/.config/aerospace
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/sketchybar
mkdir -p ~/.config/nvim

# Stow home directory configs
stow -t ~ zsh

# Stow app-specific config directories
stow -t ~/.config/aerospace aerospace
stow -t ~/.config/ghostty ghostty
stow -t ~/.config/sketchybar sketchybar
stow -t ~/.config/nvim nvim

# Stow general config directory configs
stow -t ~/.config starship

echo "Dotfiles successfully stowed!"
