if runo#should_abort('clojure')
    finish
endif

hi! link clojureFunc Normal
hi! link clojureSymbol Normal
hi! link clojureDefineName RunoGlobalDef
hi! link clojureKeyword RunoConstant
