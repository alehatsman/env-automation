let g:ale_fixers = {'javascript': ['importjs', 'standard']}
let g:ale_linters = {'javascript': ['importjs', 'standard', 'flow']}

let g:javascript_plugin_flow = 1

augroup filetype_golang
    autocmd!
    autocmd FileType go setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup END
