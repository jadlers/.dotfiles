alias dfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias zr='source $ZDOTDIR/.zshrc'

# Ask if it might overwrite anything
alias cp='cp -vi'
alias mv='mv -vi'
alias ln='ln -vi'
alias rm='rm -vI'

# ls
alias ll='ls -l'
alias la='ls -lA'

# Git
alias ga='git add'
alias gapa='git add --patch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gst='git status'
alias gupa='git pull --rebase --autostash'
alias cb='git branch --sort=-committerdate | fzf --header Checkout | xargs git checkout'

# You know why...
alias :q=exit
