" Mappings
let mapleader="\<space>"
let maplocalleader="\<space>"

" uppercase current word
nnoremap <leader><c-u> viwU
" open vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" wrap current word in \"
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" wrap current word in '
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" wrap selection in "
vnoremap <leader>" xi"<esc>pa"<esc>
" wrap selection in '
vnoremap <leader>' xi'<esc>pa'<esc>

" go to the start of line
nnoremap <leader>H ^

" go to the end of line
nnoremap <leader>L $

" open NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>

inoremap <esc> <nop>
inoremap <c-[> <esc>

" Abbreviations
iabbrev @@ aleh.atsman@gmail.com
iabbrev ccopy Copyright 2018 Aleh Atsman, all rights reserved.
