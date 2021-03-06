" Plugins with vim-plug
  " The default path for 'data' is: $XDG_DATA_HOME/nvim
  call plug#begin(stdpath('data') . '/plugged')

    " Generic
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim' " Adds :Rg :Files etc.
    Plug 'junegunn/goyo.vim'
    Plug 'tpope/vim-commentary'
    " Plug 'tpope/vim-dadbod' " Query DB in quickfix buffer
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'wincent/loupe'

    " Language server protocol
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    " Plug 'nvim-lua/completion-nvim'

    " Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " JavaScript/TypeScript
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'jxnblk/vim-mdx-js'

    " Markdown
    Plug 'SidOfc/mkdx' " Swiss knife of markdown

    " Syntax
      " Treesitter (improves sytax highlighting for many languages)
      Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
      Plug 'nvim-treesitter/playground'

      " Colorschemes
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
  colorscheme ayu

  set shiftwidth=2    " Number of spaces for each indent
  set tabstop=2       " Number of spaces a <Tab> stands for
  set expandtab       " Always insert spaces instead of tabs
  set splitbelow      " Vertical splits open below
  set splitright      " Horizontal splits open to the right
  set scrolloff=3     " Always show 5 lines below/under cursor
  set number          " Show the absolute line number for current line
  set relativenumber  " Show relative numbers for all other lines
  set nowrap          " Don't wrap lines by default
  set nohlsearch      " Don't keep search highlighting after search completed
  set ignorecase      " Ignore casing for searches by default
  set smartcase       " If search includes upper case letter, it's case sensitive
  set noswapfile      " Don't create swapfiles, I don't want them
  set incsearch       " Highlight as you search, works with regex as well!
  set hidden          " Allow leaving unsaved buffers in the background
  set signcolumn=yes  " Always show column on the leftmost part for linting etc.
  set updatetime=400  " Shorter update times for CursorHold & CursorHoldI

  " Horizontal scrolling
  set breakindent                 " Don't indent less than leftmost char on line
  set breakindentopt=sbr,shift:4  " shift is number of spaces
  set showbreak=↪                 " Show unicode char to indicate wrapped line
  set sidescroll=1                " Scroll horizontally when close to the edge

  set listchars=tab:»—,trail:·,eol:¬  " Show trailing spaces and tabs
  set listchars+=extends:>,precedes:< " Hint long lines
  set list                            " Show by default

" Source lua configuration files
  lua require('nvim-lsp')
  lua require('nvim-compe')
  lua require('treesitter_conf')

" Plugin setup

  " Prettier
    let g:prettier#autoformat = 1
    let g:prettier#autoformat_require_pragma = 0

  " vim-go
    " I'm using LSP for this
    let g:go_def_mapping_enabled = 0

" Keybindings

	" Navigate quickfix list
	nnoremap ]q :cnext<CR>
	nnoremap [q :cprev<CR>
	nnoremap <C-j> :cnext<CR>
	nnoremap <C-k> :cprev<CR>

  " Navigate local list
	nnoremap <A-j> :lnext<CR>
	nnoremap <A-k> :lprev<CR>

  " Toggle showing listchars
  nmap <F7> :setlocal list!<cr>
  nmap <F8> :setlocal spell!<cr>

  " Easily search through project
  nmap <C-t> :Files<cr>

  " Open links with xdg-open
  nnoremap <silent> gx :!xdg-open <cWORD><cr>

" Completion
  set completeopt=menuone,noinsert,noselect " Don't automatically insert
  let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

  inoremap <silent><expr> <C-Space> compe#complete()
  inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"""
""" Autocommands
"""

  " journal-wiki specific
  augroup journal-wiki
    autocmd!
    au BufNewFile,BufRead $HOME/Nextcloud/journal/**.md setlocal colorcolumn=81
  augroup END

