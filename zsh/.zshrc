# --- Path Config ---
export DOTFILES_PATH="$(dirname $(readlink ~/.zshrc))"
[[ "$DOTFILES_PATH" == "." ]] && export DOTFILES_PATH="$HOME/repos/dotfiles"

export PATH="$DOTFILES_PATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# --- System ---
if command -v fnm &> /dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh

# --- Theme ---
TOVY_BLUE="#4a6cf7"
TOVY_MID="#7d72f0"
TOVY_PURPLE="#b579f2"
TOVY_WHITE="#ffffff"
TOVY_BG="#05080f"

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{$TOVY_PURPLE}── %d ──%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{#ff6e6e}── %d (errors: %e) ──%f'
zstyle ':completion:*' list-colors "=(#b) #([0-9]*) *=0=38;5;0;48;5;4"
autoload -Uz compinit && compinit

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats ' %F{#bfbfbf}on%f %F{#ff6e6e} %b%f%u%c'
zstyle ':vcs_info:git:*' actionformats ' %F{#bfbfbf}on%f %F{#ff6e6e} %b%f %F{yellow}(%a)%f'

# Timer
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

# Prompt
PROMPT=$'\n'"%F{$TOVY_BLUE}╭─%f %F{$TOVY_BLUE} %n%f%F{$TOVY_WHITE}@%f%F{$TOVY_MID}󰒋 %m%f %F{$TOVY_WHITE}in%f %F{$TOVY_PURPLE} %~%f\${vcs_info_msg_0_}"$'\n'"%F{$TOVY_BLUE}╰─❯%f "

[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
