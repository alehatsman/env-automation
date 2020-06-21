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

" Comments
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

" Golang
Plug 'fatih/vim-go', { 'for': 'go' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescriptreact'] }
" Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescript' }
" Plug 'styled-components/vim-styled-components', { 'branch': 'main',
"   \ 'for': ['typescript', 'typescriptreact'] }
Plug 'posva/vim-vue', { 'for': 'javascript' }
Plug 'jxnblk/vim-mdx-js', { 'for': 'markdown.mdx' }
Plug 'jparise/vim-graphql'

" Clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
" Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }

Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Devops
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'jvirtanen/vim-hcl', { 'for': 'hcl' }

call plug#end()
