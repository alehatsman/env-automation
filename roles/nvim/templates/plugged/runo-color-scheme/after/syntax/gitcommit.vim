if runo#should_abort('gitcommit')
    finish
endif

" The following two are misnomers. Colors are correct.
hi! link diffFile    RunoGreen
hi! link diffNewFile RunoRed

hi! link diffAdded   RunoGreen
hi! link diffLine    RunoPinkItalic
hi! link diffRemoved RunoRed

