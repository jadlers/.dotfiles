function s:CheckColorScheme()
  " echoerr 'running CheckColorScheme func'
  
  if !has('termguicolors')
    let g:base16colorspace=256
  endif

  let s:config_file = expand('$ZDOTDIR/.base16')

  if filereadable(s:config_file)
   " Use the info in the file to set color
   let s:config = readfile(s:config_file, '', 2)
   if s:config[1] =~# '^dark\|light$'
     execute 'set background=' . s:config[1]
   else
     echoerr 'Bad Background ' . s:config[1] . ' in ' . s:config_file
   endif

   let s:base16_colors = '~/.vim/pack/bundle/start/base16-vim/colors/'
   if filereadable(expand(s:base16_colors . 'base16-' . s:config[0] . '.vim'))
     execute 'color base16-' . s:config[0] 
   else
     echoerr 'Could not find a base16 color scheme named ' . s:config[0]
   endif

  else " default
    echoerr "Could not open color configuration. Setting: tomorrow-night"
    set background=dark
    color base16-tomorrow-night
  endif 

  " doautocmd ColorScheme
endfunction

" Only source when in iTerm
if $TERM_PROGRAM == "iTerm.app"
  call s:CheckColorScheme()
endif
