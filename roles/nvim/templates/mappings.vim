"---------------------------------------------
" Mappings 
"---------------------------------------------
" set <leader> to space
let mapleader="\<space>"
let maplocalleader="\<space>"

"---------------------------------------------
" File test
"---------------------------------------------
function! g:CopyFilepathToClipboard()
  let path = expand("%")
  let @+ = path
  echo path
endfunction

function! g:CopyFilenameToClipboard()
  let path = expand("%:t")
  let @+ = path
  echo path
endfunction

nnoremap <leader>cfn :call g:CopyFilenameToClipboard()<CR>
nnoremap <leader>cfp :call g:CopyFilepathToClipboard()<CR>


"---------------------------------------------
" Autocomplete
"---------------------------------------------

" Remap ctrl-x ctrl-o to ctrl space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>


"---------------------------------------------
" Nerd tree
"---------------------------------------------
" open / close nerd tree
nnoremap <leader>fe :NERDTreeToggle<cr>
" find current file in nerdtree
nnoremap <leader>ff :NERDTreeFind<cr>


"---------------------------------------------
" Splits
"---------------------------------------------
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-\> <c-w>w

" close all splits except focused one
nnoremap <c-w>o <c-w><c-o>


"---------------------------------------------
" Tabs mappings 
"---------------------------------------------
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>to :tabonly<CR>

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

"---------------------------------------------
" Splits resizing 
"---------------------------------------------
map <silent> <A-h> <C-w>>
map <silent> <A-j> <C-W>+
map <silent> <A-k> <C-W>-
map <silent> <A-l> <C-w><


"---------------------------------------------
" Git mappings 
"---------------------------------------------
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gpr :Gpull -r<CR>
nnoremap <leader>gl :GV!<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>


"---------------------------------------------
" Linting / Formatting
"---------------------------------------------
nnoremap <leader>al :ALELint<cr>
nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>ad :ALEDetail<cr>

"---------------------------------------------
" Navigation
"---------------------------------------------
" go to the beginning of the line
nnoremap H ^
" go to the end of the line
nnoremap L g_
