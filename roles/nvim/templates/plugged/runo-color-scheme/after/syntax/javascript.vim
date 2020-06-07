if runo#should_abort('javascript', 'javascriptreact')
    finish
endif

hi! link javaScriptBraces   Delimiter
hi! link javaScriptNumber   Constant
hi! link javaScriptNull     Constant
hi! link javaScriptFunction Keyword

" pangloss/vim-javascript

hi! link jsArrowFunction           Operator
hi! link jsClassMethodType         Keyword
hi! link jsDestructuringAssignment RunoOrangeItalic
hi! link jsDocParam                RunoOrangeItalic
hi! link jsDocTags                 Keyword
hi! link jsDocType                 Type
hi! link jsDocTypeBrackets         RunoPink
hi! link jsFuncArgOperator         Operator
hi! link jsFunction                Keyword
hi! link jsTemplateBraces          Special 
hi! link jsFuncCall 			   RunoFg
hi! link jsGlobalNodeObjects       RunoFg
hi! link jsGlobalObjects           RunoFg

" vim: fdm=marker ts=2 sts=2 sw=2:
