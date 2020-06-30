let b:ale_linters = ['eslint', 'tsserver']
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_tsserver_autoimport = 1

setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

nmap <buffer> <S-k> :ALEHover<cr>
nmap <buffer> <C-]> :ALEGoToDefinition<cr>

nmap <buffer> <leader>p :ALEFix prettier<cr>
nmap <buffer> <leader>e :ALEFix eslint<cr>
