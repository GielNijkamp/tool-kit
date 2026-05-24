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

# --- Tovy UI/UX Theme Configuration ---
TOVY_BLUE="#4a6cf7"
TOVY_MID="#7d72f0"
TOVY_PURPLE="#b579f2"
TOVY_WHITE="#ffffff"
TOVY_BG="#05080f"

# 1. Completion Menu UX
# High-end tab completion with Tovy colors
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{$TOVY_PURPLE}── %d ──%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{#ff6e6e}── %d (errors: %e) ──%f'
zstyle ':completion:*' list-colors "=(#b) #([0-9]*) *=0=38;5;0;48;5;4" # Matches Ghostty selection
autoload -Uz compinit && compinit

# 2. Git Integration (Enhanced)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats ' %F{#bfbfbf}on%f %F{#ff6e6e} %b%f%u%c'
zstyle ':vcs_info:git:*' actionformats ' %F{#bfbfbf}on%f %F{#ff6e6e} %b%f %F{yellow}(%a)%f'

# 3. Command Execution Timing
# Shows how long a command took if > 1s
zmodload zsh/datetime
preexec() {
  timer=$EPOCHREALTIME
}
precmd() {
  if [[ -n $timer ]]; then
    local now=$EPOCHREALTIME
    local elapsed=$(( now - timer ))
    if (( elapsed > 1 )); then
      export RPROMPT="%F{#bfbfbf}took $(printf "%.2fs" $elapsed)%f"
    else
      export RPROMPT=""
    fi
    unset timer
  fi
}

# 4. Final Prompt Design (The Cockpit)
# Line 1: ╭─ [User/Host Icon] [Path Icon] [Git Branch]
# Line 2: ╰─ [Action Icon]
PROMPT=$'\n'"%F{$TOVY_BLUE}╭─%f %F{$TOVY_BLUE} %n%f%F{$TOVY_WHITE}@%f%F{$TOVY_MID}󰒋 %m%f %F{$TOVY_WHITE}in%f %F{$TOVY_PURPLE} %~%f\${vcs_info_msg_0_}"$'\n'"%F{$TOVY_BLUE}╰─❯%f "

# Enable syntax highlighting (sampled from Homebrew)
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
