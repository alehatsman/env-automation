if runo#should_abort('json')
    finish
endif

hi! link jsonQuote		    RunoString
hi! link jsonKeyword      RunoString
hi! link jsonKeywordMatch RunoFg
