## Defaults
export TERM=xterm-256color
export EDITOR=vim
export BROWSER=firefox
[ $(uname -s) = "Linux" ] && export TERMINAL=alacritty

## My own scripts
export PATH=$PATH:$HOME/bin

export PATH=$PATH:$HOME/.local/bin

## Enable wayland support for firefox in sway
[ -S "$SWAYSOCK" ] && export MOZ_ENABLE_WAYLAND=1

# Mac specifics
## Homebrew
[ $(uname -s) = "Darwin" ] && export PATH=$PATH:/usr/local/sbin
[ $(uname -s) = "Darwin" ] && export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Spaceship prompt
[ $(uname -s) = "Darwin" ] && export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# Go environment
if [ -d $HOME/code/Go ]; then
  export GOPATH=$HOME/code/Go
  export PATH=$PATH:$GOPATH/bin
fi

# Language
export LANG=en_GB.UTF-8
export LC_CTYPE=sv_SE.UTF-8

## WARNING Always make this the last alteration, can compromise security
export PATH=$PATH:./node_modules/.bin
