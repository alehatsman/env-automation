let g:ale_lint_on_text_changed = 0
let g:ale_lint_delay = 1000
let g:ale_python_auto_pipenv = 1
let g:ale_fix_on_save = 1

nmap <buffer> <S-k> :ALEHover<cr>
nmap <buffer> <C-]> :ALEGoToDefinition<cr>
