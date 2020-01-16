syntax enable
"Color scheme"
colorscheme monokai
" Set related configurations
set shortmess+=c "https://stackoverflow.com/questions/19580157/to-hide-user-defined-completion-message-at-vim
set tabstop=4
set softtabstop=4
set expandtab
set path+=**
set cursorline
set wildmenu
set showmatch
set hlsearch
set shiftwidth=4 "https://vi.stackexchange.com/questions/7975/how-can-i-change-the-indent-size"
set nofixendofline
set number " show the current line's number
set relativenumber " As https://www.youtube.com/watch?v=wlR5gYd6um0 suggests
set hidden "allow unsaved hidden buffers"
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null
" ctags (from https://www.youtube.com/watch?v=XA2WjJbmmoM&feature=youtu.be&t=937)
command! MakeTags !ctags -R .
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
set encoding=utf-8
filetype off                  " required
set foldmethod=syntax " https://vim.fandom.com/wiki/Folding
" https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
au BufWinEnter * normal zR 
" https://stackoverflow.com/questions/597687/changing-variable-names-in-vim
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
" https://shapeshed.com/vim-netrw/
let g:netrw_liststyle = 3
" Search without moving cursor https://stackoverflow.com/questions/23695727/vim-highlight-a-word-with-without-moving-cursor
nnoremap * *``

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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-system-copy'
Plugin 'Yggdroot/indentLine'
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

" Vim minimap (like sublime)
Plugin 'severin-lemaignan/vim-minimap'
" NERD tree
Plugin 'scrooloose/nerdtree'
" Vim powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" tabline setting(see :h setting-tabline)
" https://stackoverflow.com/questions/11366390/how-to-enumerate-tabs-in-vim

"fu! MyTabLabel(n)
"    let buflist = tabpagebuflist(a:n)
"    let winnr = tabpagewinnr(a:n)
"    let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
"    return empty(string) ? '[unnamed]' : string
"endfu

"fu! MyTabLine()
"    let s = ''
"    for i in range(tabpagenr('$'))
"    " select the highlighting
"        " get buffer names and statuses (from https://stackoverflow.com/a/17416477 answers code)
"        let n = ''      "temp string for buffer names while we loop and check buftype
"        let m = 0       " &modified counter
"        let bc = len(tabpagebuflist(i + 1))     "counter to avoid last ' '
"        " loop through each buffer in a tab
"        for b in tabpagebuflist(i + 1)
"                " buffer types: quickfix gets a [Q], help gets [H]{base fname}
"                " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
"                if getbufvar( b, "&buftype" ) == 'help'
"                        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
"                elseif getbufvar( b, "&buftype" ) == 'quickfix'
"                        let n .= '[Q]'
"                else
"                        let n .= pathshorten(bufname(b))
"                endif
"                " check and ++ tab's &modified count
"                if getbufvar( b, "&modified" )
"                        let m += 1
"                endif
"                " no final ' ' added...formatting looks better done later
"                if bc > 1
"                        let n .= ' '
"                endif
"                let bc -= 1
"        endfor
"        if i + 1 == tabpagenr()
"            let s .= '%#TabLineSel#'
"        else
"            let s .= '%#TabLine#'
"        endif
"        " add modified label [n+] where n pages in tab are modified
"        if m > 0
"                let s .= '[' . m . '+]'
"        endif

"        " set the tab page number (for mouse clicks)
"        "let s .= '%' . (i + 1) . 'T'
"        " display tabnumber (for use with <count>gt, etc)
"        let s .= ' '. (i+1) . ' ' 

"        " the label is made by MyTabLabel()
"        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

"        if i+1 < tabpagenr('$')
"            let s .= ' |'
"        endif
"    endfor
"    return s
"endfu
"set tabline=%!MyTabLine()

" Preserve the buffer position when switching them
" https://stackoverflow.com/questions/4251533/vim-keep-window-position-when-switching-buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" https://github.com/Yggdroot/indentLine color customization
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
" Git Gutter
let g:gitgutter_max_signs = 3000
" Code Snippets
nnoremap <leader>py :-1read $HOME/.vim/snippets/.python-main.py<CR>jwzR
nnoremap <leader>pyc :-1read $HOME/.vim/snippets/.python-class.py<CR>w
nnoremap <leader>cc :-1read $HOME/.vim/snippets/.cpp-main.cc<CR>3jzR

" Search related
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
