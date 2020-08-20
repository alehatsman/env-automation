if runo#should_abort('fugitive')
    finish
endif

hi! link fugitiveHeader RunoComment
hi! link fugitiveStagedHeading RunoComment
hi! link fugitiveStagedModifier RunoFg
hi! link fugitiveUnStagedHeading RunoComment
