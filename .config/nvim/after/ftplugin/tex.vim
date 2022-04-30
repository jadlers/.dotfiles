setlocal wrap
setlocal textwidth=80
setlocal colorcolumn=81
setlocal conceallevel=2
" Got warnings that 'ctermfg=color' is not a valid color
hi! Conceal guifg=color " ctermfg=color

" Use just for building
setlocal makeprg=just

" Save (if needed) and build main
nmap <localleader>m :up<CR>:make<CR>
" Format current paragraph to fit within `textwidth`
nnoremap <localleader>f gwip
vnoremap <localleader>f gw
inoremap <A-f> <Esc>gwipa
