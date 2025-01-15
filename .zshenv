export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTDUP=erase

export PATH="$HOME/.local/bin:$HOME/.cargo/bin/:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
. "$HOME/.cargo/env"
