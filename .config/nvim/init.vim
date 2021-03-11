" Plugins with vim-plug
  " The default path for 'data' is: $XDG_DATA_HOME/nvim
  call plug#begin(stdpath('data') . '/plugged')

    " Generic
    Plug 'junegunn/fzf'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-dadbod' " Query DB in quickfix buffer
    Plug 'wincent/loupe'

    " Language server protocol
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'

    " Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Markdown
    Plug 'tpope/vim-markdown'

    " Colors
    Plug 'crispgm/nord-vim'
    Plug 'ayu-theme/ayu-vim' " You need to set ayucolor

  call plug#end()

" General config
  set termguicolors
  set mouse=a

  " Set colorscheme
  "   Current favourites in order are:
  "   nord, auy, evening, desert
  let ayucolor = "mirage" " light, mirage, or dark
  colorscheme nord

  set shiftwidth=2    " Number of spaces for each indent
  set tabstop=2       " Number of spaces a <Tab> stands for
  set expandtab       " Always insert spaces instead of tabs
  set splitbelow      " Vertical splits open below
  set splitright      " Horizontal splits open to the right
  set scrolloff=3     " Always show 5 lines below/under cursor

  set listchars=tab:>-,trail:·,eol:¬ " Show trailing spaces and tabs
  set list                           " Show by default


" Keybindings

	" Navigate quickfix list
	nnoremap ]q :cnext<CR>
	nnoremap [q :cprev<CR>
	nnoremap <C-j> :cnext<CR>
	nnoremap <C-k> :cprev<CR>

  " Toggle showing listchars
  nmap <F7> :setlocal list!<cr>
  nmap <F8> :setlocal spell!<cr>

  " Easily search through project
  nmap <C-t> :FZF<cr>

  " Markdown specific (move to ftplugin dir)
  nmap <localleader>f mmvipgq`m

  " Open links with xdg-open
  nnoremap <silent> gx :!xdg-open <cWORD><cr>

" Completion
  set completeopt=menuone,noinsert,noselect " Don't automatically insert
  let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

"""
""" Autocommands
"""

  " journal-wiki specific
  augroup journal-wiki
    autocmd!
    au BufNewFile,BufRead $HOME/Nextcloud/journal/**.md setlocal colorcolumn=81
  augroup END

