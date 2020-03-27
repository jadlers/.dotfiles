## Defaults
export TERM=xterm-256color
export EDITOR=vim

# Move to `.zshenv.linux` ?
[ $(uname) = "Linux" ] && export TERMINAL=alacritty
# Enable wayland support for firefox in sway
[ -S "$SWAYSOCK" ] && export MOZ_ENABLE_WAYLAND=1

## My own scripts
export PATH=$PATH:$HOME/bin

## Local packages path
export PATH=$PATH:$HOME/.local/bin

## Go environment
export GOPATH=$HOME/code/Go
export PATH=$PATH:$GOPATH/bin

## Language
export LANG=en_GB.UTF-8
export LC_CTYPE=sv_SE.UTF-8

## WARNING Always make this the last alteration, can compromise security
export PATH=$PATH:./node_modules/.bin
