let g:ale_lint_on_text_changed = 0
let g:ale_lint_delay = 1000
let g:ale_python_auto_pipenv = 1

nnoremap <leader>al :ALELint<cr>
nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>ad :ALEDetail<cr>

let g:ale_linters = {
      \ 'clojure': ['clj-kondo', 'joker'],
      \ 'typescript': ['eslint', 'tsserver'],
      \ 'typescriptreact': ['eslint', 'tsserver'],
      \ 'javascript': ['eslint', 'tsserver'],
      \ 'rust': ['rls'],
      \ 'yaml': ['yamllint'],
      \ 'python': ['flake8', 'pyls']}

let g:ale_fixers = {
      \ 'typescript': ['prettier', 'eslint'],
      \ 'typescriptreact': ['prettier', 'eslint'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'json': ['jq'],
      \ 'rust': ['rustfmt'],
      \ 'scss': ['prettier'],
      \ 'python': ['autopep8', 'yapf']}
