" Markdown specific config

setlocal wrap
setlocal breakindentopt=sbr,shift:1  " shift is number of spaces
nnoremap j gj
nnoremap k gk

setlocal textwidth=80
setlocal spell
setlocal nonumber norelativenumber
setlocal nolist

" Format paragraph by making text hard-wrap on textwidth
nmap <localleader>f mmvipgq`m
