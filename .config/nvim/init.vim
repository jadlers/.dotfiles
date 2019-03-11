" General settings
  set mouse=a         " Give vim access to mouse input

  set nocompatible    " vim won't try to be vi
  set smartindent     " Make the indentation smarter (auto indent alternative)
  set ruler           " Display info on location inside open file
  set colorcolumn=81  " Display a column marking past where text should go

  set shiftwidth=2    " Number of spaces for each indent
  set tabstop=2       " Number of spaces a <Tab> stands for
  set expandtab       " Always insert spaces instead of tabs

  set splitbelow      " Open new split panes to
  set splitright      " the right and bottom

  set number          " Use normal numbers together with
  set relativenumber  " relative numbers as default

  set nowrap          " Don't wrap by default
  set nospell         " Spell checking turned off

  set noesckeys       " Remove delay pressing <Shift><o> immediately after <Esc>
                      " It also disables cursor keys while in insert mode

  filetype indent plugin on " Automatic, language-dependent indentation,
  syntax on                 " syntax coloring and other functionality.

  " Reload files, helps when modifying files externally (e.g. git)
  au FocusGained,BufEnter * :silent! !

  let mapleader="\<Space>"
  let maplocalleader="\\"

" Dynamic line numbers: relative for current in normal otherwise normal
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

" Remapping keys
  nnoremap <C-H> <C-w>h;
  nnoremap <C-J> <C-w>j;
  nnoremap <C-K> <C-w>k;
  nnoremap <C-L> <C-w>l;

  " Adds newline over/under current line
  nnoremap <Leader>ij mmo<Esc>`m
  nnoremap <Leader>ik mmO<Esc>`m

  " Closes all other splits
  nnoremap <LocalLeader>o :only<CR>

  " Spell toggle
  map <F8> :setlocal spell!<CR>
