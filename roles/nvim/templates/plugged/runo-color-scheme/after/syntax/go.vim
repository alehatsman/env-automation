if runo#should_abort('go')
    finish
endif

syn clear goPackage
syn keyword goPackage     package nextgroup=goPackageName skipwhite
syn match   goPackageName /\w\+/  contained skipwhite
hi! link goPackageName Identifier

hi! link goTypeName RunoGlobalDef
