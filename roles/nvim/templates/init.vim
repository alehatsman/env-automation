syntax on 
filetype indent plugin on

set nocompatible
set fileformat=unix
set langmenu=en_US
set hidden " be able to switch buffers without file save
set showcmd " shows command in the last line
set nostartofline " some command move to the first non-blank line
set number " line number on
set clipboard=unnamedplus " allow copy paste system <-> nvim
set exrc " enable project specific .nvimrc files
set secure " disable write/shell commands in those files
set splitbelow " put the new window below the current one
set splitright " put the new window right of the current one
set incsearch
set cursorline " highlight current line
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set updatetime=50
" Disable backup files
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
" Terminal colors
set termguicolors " use gui 24-bit colors, gui attrs instead of cterm
set t_Co=256
set background=light
silent! colorscheme runo
let g:runo_colorterm=0
" Identation
set autoindent " copy indent from current line when starting a new line
set smarttab " <Tab> in front of a line inserts blanks according to 'shiftwidth'
set expandtab " spaces instead of tabs
set softtabstop=2 " the number of spaces to use when expanding tabs
set shiftwidth=2 " the number of spaces to use when indenting -- or de-indenting -- a line
set tabstop=2 " the number of spaces that a tab equates to
let g:indentLine_color_gui = '{{ colors.gray.0 }}' " set color of identation symbols |
" Folding
set foldmethod=syntax " fold is defined by syntax
set foldcolumn=1 " width of fold column
set foldlevelstart=99 " don't close folds

call plug#begin('{{ plug_path }}')
Plug '~/.config/nvim/plugged/runo-color-scheme'
Plug 'atsman/vim-clojure-static', { 'for': 'clojure' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/LargeFile'
Plug '~/.config/nvim/plugged/runo-color-scheme'
Plug 'dense-analysis/ale'
call plug#end()

" ->> Ale
let g:ale_linters = {
\   'typescript': ['eslint', 'tsserver'], 
\   'python': ['pyls', 'black', 'mypy'],
\   'yaml': ['yamllint'],
\}


let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'json': ['jq'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1
let g:ale_open_list = 0
let g:ale_set_highlights = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '•'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '•'
let g:ale_python_auto_pipenv = 1
let g:ale_completion_tsserver_autoimport = 1
set signcolumn="yes:[1]"

silent! color runo

" ->> Autocomplete
autocmd CompleteDone * pclose

"---------------------------------------------
" Python provider
"---------------------------------------------
let g:python_host_prog = '{{ python_venv_path | expanduser }}/bin/python'
let g:python3_host_prog = '{{ python3_venv_path | expanduser }}/bin/python'
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Nerd tree
let NERDTreeShowHidden=1 " show hidden files
let g:NERDTreeAutoDeleteBuffer = 1 " delete buffer when delete file

" Airline options for tabs
let g:airline_section_c = '%t'
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_close_button = 0

" Fzf
nmap <c-p> :Files<cr>
nmap <c-b> :Buffers<cr>
nmap <c-f> :Rg<cr>

command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=never --smart-case '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 showtabline=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showtabline=1 showmode ruler

" Nvim colorizer
lua require'colorizer'.setup()

let g:polyglot_disabled=['clojure']
let g:AutoPairsShortcutToggle = ''
let g:clojure_highlight_local_vars = 0
let g:yats_host_keyword = 0
let g:vim_jsx_pretty_enable_jsx_highlight=0

"---------------------------------------------
" Mappings 
"---------------------------------------------
let mapleader="\<space>"
let maplocalleader="\<space>"

" File test
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

nmap <leader>cfn :call g:CopyFilenameToClipboard()<CR>
nmap <leader>cfp :call g:CopyFilepathToClipboard()<CR>

" Autocomplete

" Remap ctrl-x ctrl-o to ctrl space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Nerd tree
let NERDTreeMinimalUI=1

" open / close nerd tree
nmap <leader>fe :NERDTreeToggle<cr>
" find current file in nerdtree
nmap <leader>ff :NERDTreeFind<cr>

" Splits
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-\> <c-w>w
" close all splits except focused one
nmap <c-w>o <c-w><c-o>

" Tabs mappings 
nmap <leader>tt :tabnew<CR>
nmap <leader>tp :tabprev<CR>
nmap <leader>tn :tabnext<CR>
nmap <leader>to :tabonly<CR>

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

" Splits resizing 
map <silent> <A-h> <C-w>>
map <silent> <A-j> <C-W>+
map <silent> <A-k> <C-W>-
map <silent> <A-l> <C-w><

" Git mappings 
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gpr :Gpull -r<CR>
nmap <leader>gl :GV!<CR>
nmap <leader>gd :Gvdiffsplit<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" Linting / Formatting
nmap <C-]> <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>cr :CocRestart<CR>

nmap <leader>pws :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nmap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Navigation
" go to the beginning of the line
nmap H ^
" go to the end of the line
nmap L g_

vnoremap <silent> <leader>s :'<,'>sort<cr>

" Dispay syntax tree
map <leader>sx :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nmap <leader>u :UndotreeShow<CR> 

autocmd BufRead,BufNewFile *.mdx set filetype=markdown
