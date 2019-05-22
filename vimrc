syntax enable
"Color scheme"
colorscheme monokai
set tabstop=4
set softtabstop=4
set expandtab
set number
set path+=**
set cursorline
set wildmenu
set showmatch
set hlsearch
set shiftwidth=4 "https://vi.stackexchange.com/questions/7975/how-can-i-change-the-indent-size"
" Enable backspace feature
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start
"https://github.com/Valloric/YouCompleteMe#c-family-semantic-completion"
let g:ycm_use_clangd = 0 
let mapleader="," 
"https://dougblack.io/words/a-good-vimrc.html"
nnoremap <leader><space> :nohlsearch<CR>
" close preview"
nnoremap <leader>p :pc<CR>
set nocompatible              " be iMproved, required
filetype off                  " required
set foldmethod=syntax " https://vim.fandom.com/wiki/Folding
" https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
au BufWinEnter * normal zR 
" https://stackoverflow.com/questions/597687/changing-variable-names-in-vim
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

filetype plugin indent on    " required

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py.1'
let g:ycm_confirm_extra_conf = 0


