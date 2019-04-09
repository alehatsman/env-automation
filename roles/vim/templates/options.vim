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
