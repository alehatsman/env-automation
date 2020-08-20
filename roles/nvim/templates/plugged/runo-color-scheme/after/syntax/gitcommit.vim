if runo#should_abort('gitcommit')
    finish
endif

" The following two are misnomers. Colors are correct.
hi! link diffFile    RunoDiffAdd
hi! link diffNewFile RunoDiffDelete

hi! link diffAdded   RunoDiffAdd
hi! link diffLine    RunoPinkItalic
hi! link diffRemoved RunoDiffDelete

hi! link gitcommitBranch RunoGlobalDef
hi! link gitcommitHeader RunoComment
hi! link gitcommitSelectedType RunoComment
hi! link gitcommitSelectedFile RunoComment
