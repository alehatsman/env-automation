set nocompatible

"---------------------------------------------
"  Plugins
"---------------------------------------------

call plug#begin('{{ plug_path }}')

Plug '~/.config/nvim/plugged/runo-color-scheme'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'vim-scripts/LargeFile'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}

" File explorer and tabs
Plug 'scrooloose/nerdtree'

Plug 'preservim/nerdcommenter'

Plug 'Yggdroot/indentLine'

" Git
Plug 'tpope/vim-fugitive' " git commands
Plug 'junegunn/gv.vim' " git commit browser
Plug 'airblade/vim-gitgutter' " git diff sign

" Linters / Formatters
Plug 'w0rp/ale'

" Status line and Tabs
Plug 'bling/vim-airline'

" Search and Navigation
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'

" Autocomplete
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !python3 ./install.py --clang-completer --go-completer --ts-completer 
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" Plug 'neovim/nvim-lsp'

" Quoting / Parenthesizing
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Repeating
Plug 'tpope/vim-repeat'

Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

call plug#end()

"---------------------------------------------
" Basic options 
"---------------------------------------------
filetype indent plugin on " detect ft, load ftpfile and indent
syntax on " syntax highlighting on

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

set termguicolors " use gui 24-bit colors, gui attrs instead of cterm
set t_Co=256
set background=light
silent! colorscheme runo
let g:runo_colorterm=0
silent! color runo

set cursorline " highlight current line

let g:vim_jsx_pretty_enable_jsx_highlight=0

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

let g:yats_host_keyword = 0

" Autocomplete
set completeopt=menuone,preview
autocmd CompleteDone * pclose

set conceallevel=0 " don't hide syntax elements (quotes in json for example

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

" Ale
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
set signcolumn="yes:[1]"
nmap <buffer> <S-k> :ALEHover<cr>
nmap <buffer> <C-]> :ALEGoToDefinition<cr>

" Fzf
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-f> :Rg<cr>

command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=never --smart-case '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 showtabline=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showtabline=1 showmode ruler

" Nvim colorizer
lua require'colorizer'.setup()

" Autopair
let g:AutoPairsShortcutToggle = ''

" Git
set updatetime=500 " update time for git gutter

" Clojure
let g:clojure_highlight_local_vars = 0

"---------------------------------------------
" Mappings 
"---------------------------------------------
" set <leader> to space
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

nnoremap <leader>cfn :call g:CopyFilenameToClipboard()<CR>
nnoremap <leader>cfp :call g:CopyFilepathToClipboard()<CR>

" Autocomplete

" Remap ctrl-x ctrl-o to ctrl space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Nerd tree
" open / close nerd tree
nnoremap <leader>fe :NERDTreeToggle<cr>
" find current file in nerdtree
nnoremap <leader>ff :NERDTreeFind<cr>

" Splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-\> <c-w>w
" close all splits except focused one
nnoremap <c-w>o <c-w><c-o>

" Tabs mappings 
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

" Splits resizing 
map <silent> <A-h> <C-w>>
map <silent> <A-j> <C-W>+
map <silent> <A-k> <C-W>-
map <silent> <A-l> <C-w><

" Git mappings 
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gpr :Gpull -r<CR>
nnoremap <leader>gl :GV!<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>

" Linting / Formatting
nnoremap <leader>al :ALELint<cr>
nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>ad :ALEDetail<cr>
nnoremap <leader>ar :ALERename<cr>

" Navigation
" go to the beginning of the line
nnoremap H ^
" go to the end of the line
nnoremap L g_

" Visual
vnoremap <silent> <leader>s :'<,'>sort<cr>

"syntax
map <leader>sx :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


nnoremap <leader>u :UndotreeShow<CR> 

"---------------------------------------------
"  Autocommands
"---------------------------------------------
autocmd BufRead,BufNewFile *.mdx set filetype=markdown
