" Detect lex file
" See ':help exists()' and '$VIMRUNTIME/filetype.vim' for more information
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.flex setfiletype lex
  " OpenCL https://www.vim.org/scripts/script.php?script_id=3157
  au BufNewFile,BufRead *.cl setf opencl
augroup END


