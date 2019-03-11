# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

HISTFILE=$ZDOTDIR/zsh_history

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"


# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-d"

# Which plugins would you like to load? (They're all in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions
)

# On Linux
if [[ $(uname -s) = "Linux" ]]; then
  plugins+=( sudo )
fi

# Default theme
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes for themes
export ZSH_THEME="avit"

# iTerm specific
if [ "$TERM_PROGRAM" = iTerm.app ]; then
  source $ZDOTDIR/colors
fi

# Emacs specific settings
if [ -n "$INSIDE_EMACS" ]; then
  export ZSH_THEME="clean"
fi

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias weather='curl https://wttr.in\?FMn'
alias dfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
