" Golang specific config

set shiftwidth=4
set tabstop=4
set noexpandtab
set colorcolumn=81,101
set spell

" Change default tags transform from snakecase -> camelcase
let g:go_addtags_transform = 'camelcase'

nnoremap <space>pb :GoBuild<CR>
nnoremap <leader>tt :GoTest<CR>
nnoremap <leader>tf :GoTestFunc<CR>
nnoremap <leader>rr :GoRun<CR>
