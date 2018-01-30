" Start Pathogen plugin manager
execute pathogen#infect() 

set nocompatible " vim won't try to be vi
set smartindent " Make the indentation smarter (autoindent alternative)
set ruler " Display info on location inside open file

" Open new split panes to right and bottom
set splitbelow
set splitright

filetype plugin on  " vim's own plugin for Filebrowsing
set wildmenu        " Show matching files on tab complete
" set path+=**      " search down subfolders for tab complete

:syntax on " Looks for the fileextension to determine syntax

" Make the linenumbers relative when in normal mode
" and normal for other editors than current
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Tabs are 2 spaces, if a tab is inserted it's 2 chars long
set shiftwidth=2 softtabstop=2 expandtab

let s:system = system("echo -n \"$(uname)\"")
if s:system == "Darwin" " Mac specific settings
  " Change cursor shape between insert and normal mode in iTerm2.app
  if $TERM_PROGRAM =~ "iTerm.app"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
      let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
      let &t_SR = "\<esc>]50;CursorShape=2\x7" " Underline in replace mode
  endif

  " Sets formatting style and enables auto formatting on save for c/c++ files
  let g:clang_format#code_style = "google"
  let g:clang_format#style_options = {
    \ "AllowShortFunctionsOnASingleLine": "Empty" }
  autocmd FileType c,cpp,h ClangFormatAutoEnable
endif
