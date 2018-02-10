" Don't use linting for c++
let g:ale_linters = {
      \'cpp': [],
      \}
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'cpp': ['clang-format'],
      \}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_c_clangformat_options = "-style='{
      \ BasedOnStyle: Google,
      \ AllowShortFunctionsOnASingleLine: Empty
      \}'"
