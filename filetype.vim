" Detect lex file
" See ':help exists()' and '$VIMRUNTIME/filetype.vim' for more information
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.flex setfiletype lex
augroup END

