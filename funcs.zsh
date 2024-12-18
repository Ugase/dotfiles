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
