# Path to your dotfiles repository
export DOTFILES_PATH="$HOME/repos/dotfiles"

export PATH="$DOTFILES_PATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Load aliases
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
