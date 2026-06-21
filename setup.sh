#!/usr/bin/env sh

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Stow home directory configs
stow -t ~ zsh

# Stow .config directory configs
stow -t ~/.config aerospace ghostty sketchybar

echo "Dotfiles successfully stowed!"
