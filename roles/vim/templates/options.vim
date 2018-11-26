filetype indent plugin on
syntax on

set langmenu=en_US
set hidden " be able to switch buffers without file save
set showcmd " shows command in the last line
set nostartofline " some command move to the first non-blank line
set number
set clipboard=unnamed

set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

set exrc " enable project specific .nvimrc files
set secure " disable write/shell commands in those files

set splitbelow
set splitright

" Dracula theme settings
let g:dracula_colorterm=0
colorscheme dracula
color dracula
