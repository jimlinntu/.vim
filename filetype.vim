" Detect lex file
" See ':help exists()' and '$VIMRUNTIME/filetype.vim' for more information
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.flex setfiletype lex
  " OpenCL https://www.vim.org/scripts/script.php?script_id=3157
  au BufNewFile,BufRead *.cl setf opencl
  " Ejs syntax support : https://stackoverflow.com/questions/4597721/syntax-highlight-for-ejs-files-in-vim
  au BufNewFile,BufRead *.ejs set filetype=html
augroup END


