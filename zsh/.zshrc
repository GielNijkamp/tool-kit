# --- System Environment ---
# FNM (Node Manager)
eval "$(fnm env --use-on-cd)"

# Google Cloud SDK
if [ -f '/Users/nijkampg/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nijkampg/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/nijkampg/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nijkampg/google-cloud-sdk/completion.zsh.inc'; fi

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# OrbStack
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# --- Dotfiles Configuration ---
export DOTFILES_PATH="$HOME/repos/dotfiles"
export PATH="$DOTFILES_PATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Load aliases
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh

# --- Tovy Design Prompt ---
# Colors from Tovy logo
TOVY_WHITE="#ffffff"
TOVY_BLUE="#5e6df2"
TOVY_PURPLE="#a175d1"

# Design: [user@host] [path] [accent]
# Use double quotes to allow variable expansion
PROMPT="%F{$TOVY_WHITE}%n%f@%F{$TOVY_WHITE}%m%f %F{$TOVY_BLUE}%1~%f %F{$TOVY_PURPLE}❯%f "

# Enable syntax highlighting if available
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
