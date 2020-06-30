"---------------------------------------------
" Base64
"---------------------------------------------
vnoremap <silent> <leader>atob :<c-u>call encoding#base64_v_atob()<cr>
vnoremap <silent> <leader>btoa :<c-u>call encoding#base64_v_btoa()<cr>

"---------------------------------------------
" Url
"---------------------------------------------
vnoremap <silent> <leader>utos :<c-u>call encoding#url_v_utos()<cr>
vnoremap <silent> <leader>stou :<c-u>call encoding#url_v_stou()<cr>
