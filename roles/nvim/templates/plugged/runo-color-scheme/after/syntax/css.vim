if runo#should_abort('css')
    finish
endif

hi! link cssAttrComma         Delimiter
hi! link cssAttrRegion        RunoPink
hi! link cssAttributeSelector RunoGreenItalic
hi! link cssBraces            Delimiter
hi! link cssFunctionComma     Delimiter
hi! link cssNoise             RunoFg
hi! link cssProp              RunoFg
hi! link cssFontProp 		  RunoFg
hi! link cssPseudoClass       RunoFg
hi! link cssPseudoClassId     RunoGreenItalic
hi! link cssUnitDecorators    RunoFg
hi! link cssVendor            RunoGreenItalic
hi! link cssFunctionName	  RunoFg
hi! link cssBackgroundAttr    RunoFg