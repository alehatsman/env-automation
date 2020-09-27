" Go into using fireplace
" nmap <buffer> <C-]> ]<C-D>

let g:clojure_syntax_without_core_keywords = 1
let g:conjure#mapping#def_word="<C-]>"
let g:conjure#log#wrap=v:true

nmap <localleader>cc :ConjureConnect<cr>
nmap <localleader>f <cmd>!clj -A:cljfmt fix %<cr>
