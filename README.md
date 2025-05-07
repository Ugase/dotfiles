## Install with one (massive) command:
```sh
PWD="$(pwd)" && sudo pacman -S --noconfirm --needed fd neovim alacritty stow tmux zsh git foot && cd ~ && git clone https://github.com/Ugase/dotfiles && cd dotfiles && sudo pacman -S --needed --noconfirm base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay && yay -S --noconfirm --needed oh-my-posh fastfetch-git && rm -rf .git ~/dotfiles/crontabs/dot.sh && stow --adopt --no-folding . && cd $PWD
```
