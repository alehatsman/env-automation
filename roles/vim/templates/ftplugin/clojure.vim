let g:ale_linters = {'clojure': ['clj-kondo', 'joker']}

autocmd FileType clojure nmap <buffer> <C-]> ]<C-D>
