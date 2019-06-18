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
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
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

filetype plugin indent on    " required

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py.1'
let g:ycm_confirm_extra_conf = 0

" tabline setting(see :h setting-tabline)
" https://stackoverflow.com/questions/11366390/how-to-enumerate-tabs-in-vim

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
        " get buffer names and statuses (from https://stackoverflow.com/a/17416477 answers code)
        let n = ''      "temp string for buffer names while we loop and check buftype
        let m = 0       " &modified counter
        let bc = len(tabpagebuflist(i + 1))     "counter to avoid last ' '
        " loop through each buffer in a tab
        for b in tabpagebuflist(i + 1)
                " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                if getbufvar( b, "&buftype" ) == 'help'
                        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                elseif getbufvar( b, "&buftype" ) == 'quickfix'
                        let n .= '[Q]'
                else
                        let n .= pathshorten(bufname(b))
                endif
                " check and ++ tab's &modified count
                if getbufvar( b, "&modified" )
                        let m += 1
                endif
                " no final ' ' added...formatting looks better done later
                if bc > 1
                        let n .= ' '
                endif
                let bc -= 1
        endfor
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " add modified label [n+] where n pages in tab are modified
        if m > 0
                let s .= '[' . m . '+]'
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
