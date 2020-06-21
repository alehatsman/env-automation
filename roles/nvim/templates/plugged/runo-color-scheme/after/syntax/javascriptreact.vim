if runo#should_abort('javascriptreact')
    finish
endif

runtime! syntax/javascript.vim

hi! link jsxTagName RunoFg
hi! link jsxOpenPunct RunoFg 
hi! link jsxComponentName RunoFg
