if runo#should_abort('make')
    finish
endif

hi! link makeTarget   RunoGlobalDef
hi! link makeCommands RunoString
hi! link makeIdent    None