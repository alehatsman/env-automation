filetype indent plugin on
syntax on

set langmenu=en_US
set hidden " be able to switch buffers without file save
set showcmd " shows command in the last line
set nostartofline " some command move to the first non-blank line
set number
set clipboard=unnamed

set exrc " enable project specific .nvimrc files
set secure " disable write/shell commands in those files

set splitbelow " put the new window below the current one
set splitright " put the new window right of the current one

" Dracula theme settings
let g:dracula_colorterm=0
colorscheme dracula
color dracula

set autoindent " copy indent from current line when starting a new line
set smarttab " <Tab> in front of a line inserts blanks according to 'shiftwidth'
set expandtab " spaces instead of tabs
set softtabstop=2 " the number of spaces to use when expanding tabs
set shiftwidth=2 " the number of spaces to use when indenting -- or de-indenting -- a line
set tabstop=2 " the number of spaces that a tab equates to

" Folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=99

" Autocomplete
set completeopt=menu,preview
autocmd CompleteDone * pclose

let g:jsx_ext_required = 0

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
