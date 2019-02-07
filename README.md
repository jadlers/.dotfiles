# jadlers dotfiles

I manage my dotfiles in a bare repo, the idea originated (read is copied) from
[this](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
article.

You're free to take any inspiration you might find, I'd just be happy to help
you out! Although, to be realistic I'm probably the only one reading this
readme...

## Installation

I've made an installation script to ease getting a new system up and running as
I want it. The script takes care of all. Should you have files conflicting with
any of my files they are moved to _$HOME/.dotfiles.bak_ (default setting which
you can change). The script is quite verbose and tries to log all steps taken to
`stdout`.

The bare git repository will be placed at _$HOME/.dotfiles_.

The installation script is _.config/jadlers-dotfiles/install.sh_. You can copy
the contents of that file and run it with `bash <name of file you created>`. It
should also work by simply typing: **NOTE THIS HAS NOT BEEN TESTED YET**

`bash <(curl -fsSL
https://github.com/jadlers/.dotfiles/raw/master/.config/jadlers-dotfiles/install.sh)`

