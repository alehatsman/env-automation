if runo#should_abort('json')
    finish
endif

hi! link jsonQuote		  RunoString
hi! link jsonKeyword      RunoFg
hi! link jsonKeywordMatch RunoFg
