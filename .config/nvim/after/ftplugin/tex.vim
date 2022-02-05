setlocal wrap
setlocal textwidth=80
setlocal conceallevel=2
" Got warnings that 'ctermfg=color' is not a valid color
hi! Conceal guifg=color " ctermfg=color

" Save (if needed) and build main
nmap <localleader>m :up<CR>:!latexmk main<CR>
" Format current paragraph to fit within `textwidth`
nnoremap <localleader>f gwip
vnoremap <localleader>f gw
inoremap <C-f> <Esc>gwipa
