#!/bin/bash
DOTFILES_DIR="$(pwd)"
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/zsh/aliases.zsh" ~/.aliases.zsh
mkdir -p ~/.config/ghostty
ln -sf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config
echo "Environment synchronized."
