let g:ale_linters = {'typescript': ['tslint', 'tsserver']}
let g:ale_fixers = {'typescript': ['tslint', ]}

setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

nnoremap <buffer> <S-k> :ALEHover<cr>
nnoremap <buffer> <C-]> :ALEGoToDefinition<cr>
