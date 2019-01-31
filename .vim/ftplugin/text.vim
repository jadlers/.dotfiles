" Load my text mode settings
if filereadable($HOME . "/.vim/scripts/text_mode.vim")
  source $HOME/.vim/scripts/text_mode.vim
else
  echo "Could not find text_mode configuration file"
endif
