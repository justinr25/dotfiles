# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Environment variables & Path setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Antigravity Paths
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"

# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

# Terminal Preferences
export TERM=xterm-256color
export EDITOR="nvim"
export VISUAL="nvim"

# Zinit Plugin Manager Initialization
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Add Zsh plugins (load syntax highlighting last)
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Configure autosuggestions to ignore Vi-mode end-of-line and append movements
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(vi-add-eol vi-change-eol vi-end-of-line)

# Load Zsh completion system
autoload -Uz compinit && compinit
zmodload zsh/complist

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Theme (Oh My Posh)
#if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#  eval "$(oh-my-posh init zsh --config ~/ZSHThemes.json)"
#fi

# Shell History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Vi Editing Mode
bindkey -v
export KEYTIMEOUT=1 # Reduces delay for switching out of insert mode to 10ms (default 400ms)

# Custom Keybindings in Vi Mode
# (Must be defined after 'bindkey -v' or they will be overridden)
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^[[Z' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M viins '^f' autosuggest-accept

# Bind Cmd+Backspace (sends Ctrl+U) to delete line backward in both Vi modes
bindkey -M viins '^U' backward-kill-line
bindkey -M vicmd '^U' backward-kill-line

# Bind Shift+_ (underscore) to go to first non-blank character of the line (Vim behavior)
bindkey -M vicmd '_' vi-first-non-blank

# Dynamic cursor shapes: Block in Vi command mode, Beam in Vi insert mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[2 q' # Solid Block
  else
    echo -ne '\e[6 q' # Solid Beam
  fi
}
zle -N zle-keymap-select

# Ensure cursor shape resets to Beam when starting a new prompt line
function zle-line-init {
  echo -ne '\e[6 q'
}
zle -N zle-line-init

# General Aliases
# alias ls='ls --color'
# alias vim='nvim'
alias ls='eza --icons' # better ls
alias ll='eza -lh --icons --git' # detailed listing
alias la='eza -lah --icons --git' # detailed listing including hidden files
alias tree='eza --tree --icons' # tree view
compdef eza=ls # reuse ls completions for eza (avoids defining a separate completion function)
alias cat='bat' # better cat

# Shell Integrations
eval "$(fzf --zsh)" # Set up fzf keybindings and fuzzy completion
eval "$(zoxide init --cmd cd zsh)" # Initialize zoxide smart jumping (aliased to cd)
eval "$(starship init zsh)" # Initialize Starship prompt
