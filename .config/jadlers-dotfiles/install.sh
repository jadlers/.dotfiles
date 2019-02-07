#!/bin/bash
if [ -z $BACKUP_DIR ]; then
  BACKUP_DIR=$HOME/.dotfiles.bak
fi;

# Check the requirements
if [ -z $(which zsh) ]; then
  echo "You need to have zsh installed prior to executing this script"
  exit 1
fi;

# Check if oh my zsh is installed
if [ ! -d $HOME/.oh-my-zsh ]; then
  sh <(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | awk '!/env zsh/')
  rm $HOME/.zshrc # Remove the file the install script creates
fi;

# Back up if the user previously had a .zshrc file
if [ -f $HOME/.zshrc.pre-oh-my-zsh ]; then
  mkdir -p $BACKUP_DIR
  mv $HOME/.zshrc.pre-oh-my-zsh $BACKUP_DIR
  echo "The file .zshrc.pre-oh-my-zsh has been moved to ${BACKUP_DIR}"
fi;

# Clone the repository
git clone --bare https://github.com/jadlers/.dotfiles $HOME/.dotfiles

# dfiles will be aliased to this command in install
function dfiles {
	git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

dfiles checkout
if [ $? = 0 ]; then
  echo "Checked out all files without problem"
else
  echo "Moving conflicting configuration files to:" $BACKUP_DIR
  mkdir -p $BACKUP_DIR
  dfiles checkout 2>&1 \
    | egrep "\s+\." \
    | awk {'print $1'} \
    | xargs -I{} sh -c "\
	mkdir -p ${BACKUP_DIR}/{};\
	rmdir ${BACKUP_DIR}/{};\
	mv {} ${BACKUP_DIR}/{};"

  # Try checking out all files again
  dfiles checkout
  if [ $? = 0 ]; then
    echo "Checked out all files without problem"
  else
    echo "Could not check out files correctly, exiting"
    exit
  fi;
fi;

dfiles config status.showUntrackedFiles no

# Install all submodules
dfiles submodule init
dfiles submodule update

# Remove and untrack the README since they don't want it in $HOME
rm $HOME/README.md
dfiles update-index --assume-unchanged $HOME/README.md

# Finishing notes
echo
echo "Installation script finished! You'll need to log out before the \
changes your default shell takes place. Also, check if there are exceptions \
for your system which will need additional tweaking in the README at:
https://github.com/jadlers/.dotfiles"
