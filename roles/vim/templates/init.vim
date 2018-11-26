set nocompatible

source {{ config_path }}/plugins.vim
source {{ config_path }}/options.vim

" Dracula theme settings
let g:dracula_colorterm=0
colorscheme dracula
color dracula

let NERDTreeShowHidden=1

" Vim gitgutter
set updatetime=100

" Deoplete
set completeopt=menu,preview
autocmd CompleteDone * pclose

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}

let g:python_host_prog = "{{ python_venv_path | expanduser }}/bin/python"
let g:python3_host_prog = "{{ python3_venv_path | expanduser }}/bin/python"
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Ale
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 500

source {{ config_path }}/mappings.vim
