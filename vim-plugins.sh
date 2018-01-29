#!/bin/sh
# Clone all plugins I use to the bundle dir used by Pathogen

declare -a plugins=(
  "git://github.com/tpope/vim-surround.git" # vim surround
  "https://github.com/rhysd/vim-clang-format.git" # C family formatter
  "https://github.com/tomtom/tlib_vim.git" # for snippets
  "https://github.com/MarcWeber/vim-addon-mw-utils.git"
  "https://github.com/garbas/vim-snipmate.git"
  "https://github.com/honza/vim-snippets.git"
  "https://github.com/JamshedVesuna/vim-markdown-preview.git" # MD-preview
)

cd ~/.vim/bundle

## clone all repos to the bundle dir
for i in "${plugins[@]}"
do
   git clone "$i"
done
