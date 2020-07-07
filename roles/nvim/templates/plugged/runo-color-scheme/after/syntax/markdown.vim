if runo#should_abort('markdown', 'mkd')
    finish
endif

if b:current_syntax ==# 'mkd'
" plasticboy/vim-markdown
  hi! link htmlBold       RunoOrangeBold
  hi! link htmlBoldItalic RunoOrangeBoldItalic
  hi! link htmlH1         RunoGlobalDef
  hi! link htmlItalic     RunoYellowItalic
  hi! link mkdBlockquote  RunoYellowItalic
  hi! link mkdBold        RunoOrangeBold
  hi! link mkdBoldItalic  RunoOrangeBoldItalic
  hi! link mkdCode        RunoString
  hi! link mkdCodeEnd     RunoString
  hi! link mkdCodeStart   RunoString
  hi! link mkdHeading     RunoGlobalDef
  hi! link mkdInlineUrl   RunoLink
  hi! link mkdItalic      RunoYellowItalic
  hi! link mkdLink        RunoFg
  hi! link mkdListItem    RunoFg
  hi! link mkdRule        RunoFg
  hi! link mkdUrl         RunoFg

elseif b:current_syntax ==# 'markdown'
  hi! link markdownBlockquote        RunoPink
  hi! link markdownBold              RunoOrangeBold
  hi! link markdownBoldItalic        RunoOrangeBoldItalic
  hi! link markdownCodeBlock         RunoString
  hi! link markdownCode              RunoString
  hi! link markdownCodeDelimiter     RunoString
  hi! link markdownH1                RunoGlobalDef
  hi! link markdownH2                markdownH1
  hi! link markdownH3                markdownH1
  hi! link markdownH4                markdownH1
  hi! link markdownH5                markdownH1
  hi! link markdownH6                markdownH1
  hi! link markdownHeadingDelimiter  markdownH1
  hi! link markdownHeadingRule       markdownH1
  hi! link markdownItalic            RunoYellowItalic
  hi! link markdownLinkText          RunoGlobalDef
  hi! link markdownListMarker        RunoFg
  hi! link markdownOrderedListMarker RunoFg
  hi! link markdownRule              RunoFg
  hi! link markdownUrl               RunoFg
  hi! link markdownIdDeclaration     RunoGlobalDef
endif

" vim: fdm=marker ts=2 sts=2 sw=2:
