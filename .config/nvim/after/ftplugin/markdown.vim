" Markdown specific config

setlocal wrap
setlocal breakindentopt=sbr,shift:1  " shift is number of spaces
nnoremap j gj
nnoremap k gk

setlocal shiftwidth=2
setlocal tabstop=2
setlocal textwidth=80
setlocal spell
setlocal nonumber norelativenumber
setlocal nolist
setlocal conceallevel=2

" Format paragraph by making text hard-wrap on textwidth
nnoremap <localleader>f mmvipgq`m
