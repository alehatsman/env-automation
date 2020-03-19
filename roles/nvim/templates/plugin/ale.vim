let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 0
let g:ale_lint_on_filetype_changed = 0

let g:ale_python_auto_pipenv = 1
let g:ale_lint_delay = 0

let g:ale_open_list = 0
let g:ale_set_highlights = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '•'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '•'

set signcolumn="yes:[1]"

nmap <buffer> <S-k> :ALEHover<cr>
nmap <buffer> <C-]> :ALEGoToDefinition<cr>
