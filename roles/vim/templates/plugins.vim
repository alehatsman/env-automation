call plug#begin('{{ plug_path }}')
" General
Plug 'editorconfig/editorconfig-vim'
Plug 'dracula/vim'
Plug 'junegunn/goyo.vim'

Plug 'christoomey/vim-tmux-navigator'

" Run commands from vim in tmux
Plug 'benmills/vimux'

" File explorer and tabs
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax / Linter
Plug 'w0rp/ale'

" Status bar
Plug 'bling/vim-airline'

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemovePlugins' }

" Quoting/Parenthesizing
Plug 'tpope/vim-surround'

" Golang
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'for': 'go' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': 'javascript' }
Plug 'wokalski/autocomplete-flow', { 'for': 'javascript' }
Plug 'Shougo/neosnippet', { 'for': 'javascript' }
Plug 'Shougo/neosnippet-snippets', { 'for': 'javascript' }

" TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }

" Python
Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'ensime/ensime-vim', { 'for': 'scala' }
call plug#end()
