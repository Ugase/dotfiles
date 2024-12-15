if [[ -n "$(git status --short)" ]]
then
  ping -c 1 github.com
  INTERNET=$?
  cd dotfiles
  stow --adopt --no-folding .
  git add . && git commit -m "$(git status --short)"
  
  if [[ $INTERNET -eq 0 ]]
  then
    git push origin master
  else
    printf "\033[31mWarning: no internet connection avalible\033[0m"
  fi
else
  printf "nothing to do\n"
fi
