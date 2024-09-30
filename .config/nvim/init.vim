" Plugins with vim-plug
  " The default path for 'data' is: $XDG_DATA_HOME/nvim
  call plug#begin(stdpath('data') . '/plugged')

    " Generic
    Plug 'airblade/vim-gitgutter'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim' " Adds :Rg :Files etc.
    Plug 'folke/zen-mode.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dadbod'
      " Improved dadbod ui
      Plug 'kristijanhusak/vim-dadbod-ui'
      Plug 'kristijanhusak/vim-dadbod-completion'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'wincent/loupe'

      " File explorer
      Plug 'kyazdani42/nvim-web-devicons' " for file icons
      Plug 'kyazdani42/nvim-tree.lua'

    " Language server protocol
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
      " Plugin plugins
      Plug 'hrsh7th/cmp-nvim-lsp'
      Plug 'hrsh7th/cmp-buffer'
      Plug 'hrsh7th/cmp-path'
      Plug 'hrsh7th/cmp-vsnip'

    " Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Zig
    Plug 'ziglang/zig.vim'

    " JavaScript/TypeScript
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'jxnblk/vim-mdx-js'
      " JSX & TSX
      Plug 'yuezk/vim-js'
      Plug 'HerringtonDarkholme/yats.vim'
      Plug 'maxmellon/vim-jsx-pretty'

    " LaTeX
    Plug 'lervag/vimtex'

    " Markdown
    Plug 'SidOfc/mkdx' " Swiss knife of markdown
    Plug 'godlygeek/tabular'

    " Syntax
      " Treesitter (improves sytax highlighting for many languages)
      Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
      Plug 'nvim-treesitter/playground'
      Plug 'baskerville/vim-sxhkdrc'    " sxhkd

      " Colorschemes
      Plug 'ayu-theme/ayu-vim' " You need to set ayucolor
      Plug 'folke/tokyonight.nvim'

  call plug#end()

" General config
  set termguicolors
  set mouse=a

  " Set colorscheme
  "   Current favourites in order are:
  "   nord, auy, evening, desert
  " let ayucolor = "mirage" " light, mirage, or dark
  " colorscheme ayu
  " day, storm, moon, night
  colorscheme tokyonight-night

  set shiftwidth=2    " Number of spaces for each indent
  set tabstop=2       " Number of spaces a <Tab> stands for
  set expandtab       " Always insert spaces instead of tabs
  set splitbelow      " Vertical splits open below
  set splitright      " Horizontal splits open to the right
  set scrolloff=3     " Always show 3 lines below/under cursor
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

  " Store undo information
  set undodir=$XDG_DATA_HOME/nvim/undo  " Default location explicitly set
  set undofile                          " Store undo information

  " Don't store undo history for temporary files
  au BufWritePre /tmp/* setlocal noundofile

" Source lua configuration files
  lua require('nvim-cmp')
  lua require('nvim-lsp')
  lua require('treesitter_conf')
  lua require('colorizer').setup()
  lua require('nvim-tree-config')

" Plugin setup

  " dadbod
    autocmd FileType dbout setlocal nofoldenable

  " Prettier
    let g:prettier#autoformat_config_present = 1 " Require config to auto-format
    let g:prettier#autoformat_require_pragma = 0
    " It's not certain that a `package.json` include prettier configuration
    let g:prettier#autoformat_config_files = ['.prettierrc', '.prettierrc.yaml', '.prettierrc.json']

  " vim-go
    " I'm using LSP for this
    let g:go_def_mapping_enabled = 0

" Keybindings
  " Close quickfix list
  nnoremap <localleader>c :cclose<CR>

  " Sort items
  vmap <localleader>s :!sort<CR>

  " Quick spell-correction
  nnoremap <localleader>q 1z= 

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
  nmap <C-l> :Rg<cr>

  " Open links with xdg-open
  nnoremap <silent> gx :!xdg-open <cWORD><cr>

  " nvim-tree
  nmap <leader>t :NvimTreeToggle<CR>

  " Yank to clipboard
  nmap <leader>y "+y
  vmap <leader>y "+y

  " ZenMode
  nmap <leader>g :ZenMode<CR>

  " Quick-select first spelling correction
  noremap <leader>s 1z=

" Completion
  set completeopt=menu,menuone,noselect " Don't automatically insert

" Snippets
  " Set up location of snippets
  let g:vsnip_snippet_dir = expand('$XDG_CONFIG_HOME') .'/nvim/snippets'

  " Jump forward or backward
  imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'
  smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'
  imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
  smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

"""
""" Autocommands
"""

  " journal-wiki specific
  augroup journal-wiki
    autocmd!
    au BufNewFile,BufRead $HOME/Nextcloud/journal/**.md setlocal colorcolumn=81 spelllang=sv,en
  augroup END

  " Restore cursor position when returning to a file
  " https://vi.stackexchange.com/questions/28774/can-vim-remember-cursor-position-as-well-as-lines-displayed
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
