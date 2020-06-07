if runo#should_abort('yaml')
    finish
endif

hi! link yamlAlias           RunoGreenItalicUnderline
hi! link yamlAnchor          RunoPinkItalic
hi! link yamlBlockMappingKey RunoFg
hi! link yamlFlowCollection  RunoPink
hi! link yamlFlowIndicator   Delimiter
hi! link yamlNodeTag         RunoPink
hi! link yamlPlainScalar     RunoString
hi! link yamlFlowMappingKey  RunoFg