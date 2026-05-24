# --- User Configuration ---
# Change this to your main project directory
export MAIN_PROJECT_PATH="$HOME/repos/tovy"
# --------------------------

# Jump to your main project and activate virtual environment
alias tovy="cd $MAIN_PROJECT_PATH && source .venv/bin/activate"

# Data Engineering Utilities
alias inspect="quick-db"

# System Sync
alias reload-dots="cd $DOTFILES_PATH && ./install.sh && source ~/.zshrc"
