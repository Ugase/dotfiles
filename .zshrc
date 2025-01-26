ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# echo "Zinit home"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# echo "After if clause"

source "${ZINIT_HOME}/zinit.zsh"
# echo "Sourced zinit"

# zsh plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice blockf
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# echo "defined plugins"

# omz plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::man
# echo "Snippets"

fpath+=~/.zfunc
# echo $fpath

# Load completions
autoload -U compinit && compinit
# echo "Completion loaded?"

zinit cdreplay -q
# echo "cdreplay"
# typeset -A ZSH_HIGHLIGHT_STYLES
#
# ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
# ZSH_HIGHLIGHT_STYLES[path]='bold'

# Prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/omp/config.toml)"
# echo "prompt"
# Like one autosuggest option here
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Keybinds
bindkey -e
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# echo "keys"

# History options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt globdots
# echo "History options"
# Completion styling
eval "$(dircolors)"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# echo "Completion styling"
# Source some functions
source ~/funcs.zsh
# echo "Sourced funcs.zsh"
# Aliases
source ~/alias.zsh
# echo "Sourced alias.zsh"
export MANPAGER='nvim +Man!'
# echo "man"
# Shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# echo "fzf and zoxide"
# Variables: 
NVIM_CFG="$HOME/.config/nvim"
# echo $NVIM_CFG
