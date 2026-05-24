#!/bin/bash

# Get the absolute path to the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Deploying dotfiles from $DOTFILES_DIR..."

# Create necessary directories
mkdir -p ~/.config/ghostty

# Symlink configurations
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/zsh/aliases.zsh" ~/.aliases.zsh
ln -sf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config

# Create a template for local overrides if it doesn't exist
if [ ! -f "$DOTFILES_DIR/zsh/aliases.local.zsh" ]; then
    echo "# Personal Overrides" > "$DOTFILES_DIR/zsh/aliases.local.zsh"
    echo "# This file is git-ignored. Use it for private aliases and paths." >> "$DOTFILES_DIR/zsh/aliases.local.zsh"
    echo "Creating local overrides template..."
fi

echo "Environment synchronized."
echo "Please restart your terminal or run: source ~/.zshrc"
