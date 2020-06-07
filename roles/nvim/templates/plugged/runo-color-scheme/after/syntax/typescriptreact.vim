if runo#should_abort('typescriptreact')
    finish
endif

runtime! syntax/typescript.vim

hi! link tsxAttrib           RunoFg
hi! link tsxEqual            RunoFg
hi! link tsxIntrinsicTagName RunoFg
hi! link tsxTag              RunoFg
hi! link tsxTagName          RunoFg
hi! link htmlTag             RunoFg
hi! link jsxTagName          RunoFg
