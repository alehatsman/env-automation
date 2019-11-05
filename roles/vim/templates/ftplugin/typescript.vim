let g:ale_linters = {'typescript': ['eslint', 'tsserver']}
let g:ale_fixers = {'typescript': ['prettier', 'eslint']}

setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

nnoremap <buffer> <S-k> :ALEHover<cr>
nnoremap <buffer> <C-]> :ALEGoToDefinition<cr>
