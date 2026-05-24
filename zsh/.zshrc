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

# --- Tovy Design Prompt (Gradient Focus) ---
# Colors sampled from the 'Y' gradient
TOVY_WHITE="#ffffff"
TOVY_BLUE="#4a6cf7"    # Bright start of the Y
TOVY_MID="#7d72f0"     # Middle of the gradient
TOVY_PURPLE="#b579f2"  # Soft purple end of the Y

# Design: [user] in blue -> [host] in mid -> [path] in purple
# This creates a "horizontal gradient" across your command line
PROMPT="%F{$TOVY_BLUE}%n%f@%F{$TOVY_MID}%m%f %F{$TOVY_PURPLE}%1~%f %# "

# Enable syntax highlighting if available
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
