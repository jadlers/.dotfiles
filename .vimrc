" Start Pathogen plugin manager
execute pathogen#infect() 

set nocompatible " vim won't try to be vi

" Open new split panes to right and bottom
set splitbelow
set splitright

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

set smartindent " Make the indentation smarter (autoindent alternative)

" Enables autoformatting on buffer write
autocmd FileType c,cpp,h ClangFormatAutoEnable
