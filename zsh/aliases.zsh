# --- User Configuration ---
# Change this to your primary data workspace
export MAIN_PROJECT_PATH="$HOME/repos/data-lab"
# --------------------------

# Jump to your lab and activate virtual environment
alias lab="cd $MAIN_PROJECT_PATH && source .venv/bin/activate"

# Data Engineering Utilities
alias inspect="quick-db"

# System Sync
alias reload-dots="cd $DOTFILES_PATH && ./install.sh && source ~/.zshrc"

# Load local overrides (not committed to git)
# Use this for personal aliases like 'tovy'
[ -f "$DOTFILES_PATH/zsh/aliases.local.zsh" ] && source "$DOTFILES_PATH/zsh/aliases.local.zsh"
