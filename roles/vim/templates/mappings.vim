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

inoremap <esc> <nop>
inoremap <c-[> <esc>

" open command promp
nnoremap <Leader>vp :VimuxPromptCommand<CR>

nnoremap <Leader>p :echo @%<CR>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>tp :tabprev<CR>
nnoremap <Leader>tn :tabnext<CR>

nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gpr :Gpull -r<CR>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
