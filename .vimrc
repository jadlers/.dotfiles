" Start Pathogen plugin manager
execute pathogen#infect() 

" Looks for the fileextension to determine syntax
:syntax on

" Make the linenumbers relative when in normal mode
" and normal for other editors than current
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Tabs are 2 spaces, if a tab is inserted it's 2 chars long
:set shiftwidth=2 softtabstop=2 expandtab

" Make the indentation smarter (more experimental than autoindent)
:set smartindent

" Enables autoformatting on buffer write
autocmd FileType c,cpp,h ClangFormatAutoEnable
