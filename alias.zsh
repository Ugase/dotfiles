alias ls="eza -a --group-directories-first"
alias cls='clear'
alias c='clear'
alias nv='nvim'
alias edit_zsh="nvim ~/.zshrc && source ~/.zshrc"
alias edit_alacritty="nvim ~/.config/alacritty/alacritty.toml"
alias edit_foot="nvim ~/.config/foot/foot.ini"
alias vn="fd --type f --hidden --exclude .git --follow | fzf-tmux -w 60% -h 60% -p --reverse | xargs nvim"
alias v="fd --type f --hidden --exclude .git --follow | fzf-tmux -w 60% -h 60% -p --reverse"
alias cb="brightnessctl -d 'acpi_video0' set"
alias runrs="cargo run"
alias cdcn="cncd"
alias cdcnl="cncdl"
alias sync_dotfiles="~/dotfiles/crontabs/dot.sh"
# from https://codeberg.org/dnkl/foot/src/branch/master/completions/zsh/_foot
alias find_font="fc-list : family | sed 's/,/\n/g' | sort | uniq | fzf --cycle | xargs wl-copy"

