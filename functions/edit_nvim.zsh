edit_nvim(){
  PREV_PWD=$PWD
  cd ~/.config/nvim
  nvim
  cd $PREV_PWD
}
