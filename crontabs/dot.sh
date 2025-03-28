if [[ $1 != "--debug" ]]; then
  if [[ -n "$(git status --short)" ]]; then
    ping -c 1 github.com > /dev/null 2>&1
    INTERNET=$?
    cd ~/dotfiles
    stow --adopt --verbose .
    printf "Message: "
    read message
    git add . && git commit -m "$message"
    if [[ $INTERNET -eq 0 ]]; then
      git push origin master
    else
      printf "\033[33mWarning: no internet connection avalible\n\033[0m"
    fi
  else
    printf "nothing to do\n"
  fi
else
  if [[ -n "$(git status --short)" ]]; then
    FILE_PATH="$HOME/logs/$(date +%s).log"
    touch "${FILE_PATH}"
    echo "Made ${FILE_PATH}"
    ping -c 1 github.com >>"${FILE_PATH}"
    INTERNET=$?
    echo "Error code of ping: ${INTERNET}" >>"${FILE_PATH}"
    cd ~/dotfiles
    echo "changed directory to ~/dotfiles" >>$FILE_PATH
    stow --adopt --verbose=3 . >>$FILE_PATH 2>&1
    printf "Message: "
    read message
    git add . >>$FILE_PATH && git commit -m "$message" >>$FILE_PATH
    if [[ $INTERNET -eq 0 ]]; then
      git push origin master >>$FILE_PATH 2>&1
    else
      printf "\033[33mWarning: no internet connection avalible\n\033[0m" >>$FILE_PATH
    fi
  else
    printf "nothing to do\n" >>$FILE_PATH
  fi
fi
