call plug#begin('{{ plug_path }}')
" General
Plug 'editorconfig/editorconfig-vim'
Plug 'dracula/vim'
Plug 'junegunn/goyo.vim'

Plug 'vim-scripts/LargeFile'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux' " Run commands from vim in tmux

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
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'

" Python

" Autocomplete
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --go-completer --ts-completer 
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Quoting / Parenthesizing
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Golang
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
" Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'typescript'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': 'javascript' }
Plug 'wokalski/autocomplete-flow', { 'for': 'javascript' }
Plug 'Shougo/neosnippet', { 'for': 'javascript' }
Plug 'Shougo/neosnippet-snippets', { 'for': 'javascript' }
Plug 'jxnblk/vim-mdx-js', { 'for': 'markdown.mdx' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
" Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'ensime/ensime-vim', { 'for': 'scala' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()
