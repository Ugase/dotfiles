# mkcd
# stolen from: https://github.com/td2sk/zshrc/blob/master/module/mkcd.zsh
mkcd(){
    if [[ -d $1 ]]; then
        echo "It already exists! cd to the directory."
        cd $1
    else
        mkdir -p $1 && cd $1
    fi
}

ipypkg(){
    ping -c 1 pypi.org > /dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        printf "\033[1;3;31mfatal: No internet\033[0m\n"
        return 1
    fi
    pacman -Ss python-$1
    AVALIABLE_ON_ARCH_REPO=$?
    if [[ $AVALIABLE_ON_ARCH_REPO -ne 0 ]]; then
        printf "\033[3;33mNot avaliable on the arch repos\nDownloading from pip using --break-system-packages\nif you don't want this you have 5 seconds to exit this program\033[0m\n"
        sleep 5
        pip install $1 --break-system-packages
    else
        echo "Installing from the arch repos"
        sudo pacman -S python-$1
    fi
}

cncd(){
    cargo new --vcs=git $1 && cd $1
    git add *
    git commit -m "Initial commit"
}

cncdl(){
    cargo new --vcs=git $1 --lib && cd $1
    git add *
    git commit -m "Initial commit"
}

edit_nvim(){
    PREV_CWD=$PWD
    cd ~/.config/nvim && nvim
    cd $PREV_CWD
}

machine(){
    bash -c "grep -Eo \"^[01]+\" $1 | fold -w8 | while read -r byte; do /bin/printf '\\\\x%02x' \"\$((2#\$byte))\"; done | /bin/echo -ne \"\$(cat)\" > $1.bin"
}

get_font(){
    FONT=$(find_font)
    printf "Font size: " >&2
    read -r SIZE
    printf "font=$(echo $FONT):size=$(echo $SIZE)\n"
}

copy_symlink(){
    TMP_DIR="tmp_$(date +%s)"
    mkdir $TMP_DIR
    cp -L $1 $TMP_DIR
    rm $1
    mv $TMP_DIR/$1 .
    rm -rf $TMP_DIR
}
