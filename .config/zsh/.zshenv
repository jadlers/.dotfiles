## Defaults
export TERM=tmux-256color
export EDITOR=nvim
export BROWSER=firefox
[ $(uname -s) = "Linux" ] && export TERMINAL=alacritty

## IRC
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat

## My own scripts
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

## Enable wayland support for firefox in sway
[ -S "$SWAYSOCK" ] && export MOZ_ENABLE_WAYLAND=1

# Mac specifics
if [ $(uname -s) = "Darwin" ]; then
  ## Homebrew
  export PATH=$PATH:/usr/local/sbin
  export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

  # Spaceship prompt
  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
fi

# Go environment
if [ -d $HOME/code/Go ]; then
  export GOPATH=$HOME/code/Go
  export PATH=$PATH:$GOPATH/bin
fi

# Rust
if [ -d $HOME/.cargo ]; then
  export PATH=$PATH:$HOME/.cargo/bin
fi

# Language
export LANG=en_GB.UTF-8
export LC_CTYPE=sv_SE.UTF-8

# Add node packages to path
export PATH=$PATH:$HOME/.yarn/bin
## WARNING Always make this the last alteration, can compromise security
export PATH=$PATH:./node_modules/.bin
