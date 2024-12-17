ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# omz plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::man

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

eval "$(oh-my-posh init zsh --config $HOME/.config/omp/config.toml)"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt globdots

# Completion styling
eval "$(dircolors)"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls="eza -a --group-directories-first"
alias cls='clear'
alias c='clear'
alias nv='nvim'
alias edit_zsh="nvim ~/.zshrc && source ~/.zshrc"
alias edit_alacritty="nvim ~/.config/alacritty/alacritty.toml"
alias vn="fd --type f --hidden --exclude .git | fzf-tmux -w 60% -h 60% -p --reverse | xargs nvim"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -w 60% -h 60% -p --reverse"

# Shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Source some functions
source ~/functions/*

# Variables: 
NVIM_CFG="$HOME/.config/nvim"
