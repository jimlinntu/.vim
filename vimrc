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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"For Code Completion"
Plugin 'Valloric/YouCompleteMe'
"For git changes highlighting "
Plugin 'airblade/vim-gitgutter' 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py.1'
let g:ycm_confirm_extra_conf = 0

" tabline setting(see :h setting-tabline)
" https://superuser.com/questions/132029/how-do-you-reload-your-vimrc-file-without-restarting-vim
fu! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
    return empty(string) ? '[unnamed]' : string
endfu
fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' ' 

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()
