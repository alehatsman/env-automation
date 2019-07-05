nnoremap <c-P> :Files<cr>
nnoremap <c-p> :GFiles<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-f> :Ag<cr>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
