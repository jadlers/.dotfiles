# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=50000
SAVEHIST=10000
HISTFILE=$ZDOTDIR/zsh_history
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist

# URL paste fix
autoload -Uz url-quote-magic bracketed-paste-magic 
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

# History traversal matching typed command
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

# Load zsh-z plugin
[ -f "$ZDOTDIR"/zsh-z/zsh-z.plugin.zsh ] && source "$ZDOTDIR"/zsh-z/zsh-z.plugin.zsh

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
bindkey -M menuselect '^[[Z' reverse-menu-complete
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-v:
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# iTerm specific
if [ "$TERM_PROGRAM" = iTerm.app ]; then
  source $ZDOTDIR/colors
fi

# Sourcing my aliases
[ -f "$ZDOTDIR"/aliases.zsh ] && source "$ZDOTDIR"/aliases.zsh
[ -f "$ZDOTDIR"/aliases.local.zsh ] && source "$ZDOTDIR"/aliases.local.zsh

# Config specific to single machines
[ -f "$ZDOTDIR"/local.zsh ] && source "$ZDOTDIR"/local.zsh

# Load zsh-syntax-highlighting; should be last.
# Move to local.zsh on linux
[ $(uname -s) = "Darwin" ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load fzf functions
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh

# Completion initiation
compinit
_comp_options+=(globdots)		# Include hidden files.

# Load starship prompt
eval "$(starship init zsh)"
