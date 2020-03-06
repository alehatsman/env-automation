let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 0
let g:ale_lint_on_filetype_changed = 0

let g:ale_python_auto_pipenv = 1
let g:ale_lint_delay = 0

nmap <buffer> <S-k> :ALEHover<cr>
nmap <buffer> <C-]> :ALEGoToDefinition<cr>
