if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:runo_gui_italic")
    let g:runo_gui_italic = 0
endif

if ! exists("g:runo_term_italic")
    let g:runo_term_italic = 0
endif

let g:runo_termcolors = 256 " does not support 16 color term right now.

set background=light
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "runo"

function! s:h(group, style)
  "let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    "let s:guiformat = a:style.format
  endif
  "if g:runo_term_italic == 0
    "let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    "let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    "let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  "if
  if g:runo_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  "if g:runo_termcolors == 16
    "let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    "let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  "else
    "let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    "let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  "
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    "\ "ctermfg=" . l:ctermfg
    "\ "ctermbg=" . l:ctermbg
    "\ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------
let s:grey0      = { "gui": "#e4e5e5" }
let s:grey1      = { "gui": "#eeefef" }
let s:grey       = { "gui": "#f8f9f9" }
let s:grey3      = { "gui": "#eeefef" }
let s:grey4      = { "gui": "#ffffff" }

let s:black1     = { "gui": "#272828" }
let s:black2     = { "gui": "#313232" }
let s:black      = { "gui": "#313232" }
let s:black4     = { "gui": "#888989" }

let s:blue0      = { "gui": "#566D89" }
let s:blue2      = { "gui": "#b6cde9" }
let s:blue3      = { "gui": "#B4D8FD" }
let s:blue4      = { "gui": "#DBF1FF" }

let s:pink2      = { "gui": "#d84c8d" }
let s:pink4      = { "gui": "#F9E0FF" }

let s:green      = { "gui": "#accda4" }
let s:green2     = { "gui": "#accda4" }
let s:green3     = { "gui": "#b6d7ae" }
let s:green4     = { "gui": "#F1FADF" }

let s:red2        = { "gui": "#e7bcbb" }
let s:red3       = { "gui": "#f1c6c5" }
let s:red4       = { "gui": "#FFE0E0" }

let s:yellow0    = { "gui": "#FFBC5D" }
let s:yellow2    = { "gui": "#FFFABC" }

"" Highlighting
"" ------------

" editor
call s:h("Normal",        { "fg": s:black,      "bg": s:grey })
call s:h("ColorColumn",   {                     "bg": s:grey1 })
"call s:h("Cursor",        { "fg": s:black,      "bg": s:white })
call s:h("CursorColumn",  {                     "bg": s:grey1 })
call s:h("CursorLine",    {                     "bg": s:grey1 })
call s:h("NonText",       { "fg": s:grey4 })
call s:h("Visual",        {                     "bg": s:blue3 })
call s:h("Search",        { "fg": s:black2,     "bg": s:yellow0,  "format": "inverse" })
call s:h("MatchParen",    { "fg": s:black2,     "bg": s:green2,   "format": "underline" })
call s:h("Question",      { "fg": s:black2,     "format": "bold" })
"call s:h("ModeMsg",       { "fg": s:yellow })
call s:h("MoreMsg",       { "fg": s:black2,     "format": "bold" })
call s:h("ErrorMsg",      { "fg": s:black2,     "bg": s:red2 })
call s:h("WarningMsg",    { "fg": s:black2,     "bg": s:yellow0 })
call s:h("VertSplit",     { "fg": s:blue0  })
call s:h("LineNr",        { "fg": s:black4,     "bg": s:grey1 })
call s:h("CursorLineNr",  { "fg": s:black2 })
call s:h("SignColumn",    { "fg": s:blue2 })

" statusline
call s:h("StatusLine",    { "bg": s:grey4 })
call s:h("StatusLineNC",  { "bg": s:grey3 })
call s:h("TabLine",       { "fg": s:black,      "bg": s:grey })
call s:h("TabLineSel",    { "fg": s:black,      "bg": s:grey })
call s:h("TabLineFill",   { "bg": s:grey0 })
"call s:h("User1",         { "fg": s:yellow,     "bg": s:lightgrey,    "format": "bold" })
"call s:h("User2",         { "fg": s:orange,     "bg": s:lightgrey,    "format": "bold" })
"call s:h("User3",         { "fg": s:purple,     "bg": s:lightgrey,    "format": "bold" })
"call s:h("User4",         { "fg": s:aqua,       "bg": s:lightgrey,    "format": "bold" })

" spell
call s:h("SpellBad",      { "bg": s:red2,         "format": "underline" })
call s:h("SpellCap",      { "bg": s:green2,      "format": "underline" })
call s:h("SpellRare",     { "bg": s:red4,        "format": "underline" })
call s:h("SpellLocal",    { "bg": s:red4,        "format": "underline" })

" misc
call s:h("SpecialKey",    { "fg": s:red4 })
call s:h("Title",         { "bg": s:blue4 })
call s:h("Directory",     { "fg": s:black, "format": "bold" })

" diff
call s:h("DiffAdd",       { "fg": s:black1,      "bg": s:green3 })
call s:h("DiffDelete",    { "fg": s:black1,      "bg": s:red3 })
call s:h("DiffChange",    { "fg": s:black1,      "bg": s:green3 })
call s:h("DiffText",      { "fg": s:black1,      "bg": s:green3 })

" fold
call s:h("Folded",        { "fg": s:blue0 })
call s:h("FoldColumn",    { "fg": s:grey4 })

" Incsearch"

" popup menu
call s:h("Pmenu",         { "bg": s:grey1 })
call s:h("PmenuSel",      { "bg": s:blue3 })
call s:h("PmenuThumb",    { "bg": s:blue3 })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:black2, "bg": s:pink4 })
call s:h("Number",        { "fg": s:black2, "bg": s:pink4 })
call s:h("Float",         { "fg": s:black2, "bg": s:pink4 })
call s:h("Boolean",       { "fg": s:black2, "bg": s:pink4 })
call s:h("Character",     { "fg": s:black2, "bg": s:pink4 })
call s:h("String",        { "fg": s:black2, "bg": s:green4 })

call s:h("Type",          { "fg": s:black2 })
call s:h("Structure",     { "fg": s:black2 })
call s:h("StorageClass",  { "fg": s:black2 })
call s:h("Typedef",       { "fg": s:pink2, "format": "bold" })

call s:h("Identifier",    { "fg": s:black2, "bg": s:blue4 })
call s:h("Function",      { "fg": s:black2, "bg": s:blue4 })

call s:h("Statement",     { "fg": s:black2 })
call s:h("Operator",      { "fg": s:black2 })
call s:h("Label",         { "fg": s:black2 })
call s:h("Keyword",       { "fg": s:black2 })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:black2 })
call s:h("Include",       { "fg": s:black2 })
call s:h("Define",        { "fg": s:black2 })
call s:h("Macro",         { "fg": s:black2 })
call s:h("PreCondit",     { "fg": s:black2 })

call s:h("Special",       { "fg": s:black2 })
call s:h("SpecialChar",   { "fg": s:black2 })
call s:h("Delimiter",     { "fg": s:black2 })
call s:h("SpecialComment",{ "fg": s:pink2 })
call s:h("Tag",           { "fg": s:black2 })

"        Debug"

call s:h("Todo",          { "fg": s:black2,  "bg": s:yellow2 })
call s:h("Comment",       { "fg": s:black2,  "bg": s:yellow2 })

call s:h("Underlined",    { "fg": s:black2, "format": "underline" })
"call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:black2, "bg": s:red2 })

"" NerdTree
"" --------

call s:h("NERDTreeOpenable",        { "fg": s:black2 })
call s:h("NERDTreeClosable",        { "fg": s:black2 })
call s:h("NERDTreeHelp",            { "fg": s:black2, "bg": s:yellow2 })
"call s:h("NERDTreeBookmarksHeader", { "fg": s:pink })
"call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
"call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:black2 })
call s:h("NERDTreeUp",              { "fg": s:black2 })
call s:h("NERDTreeDirSlash",        { "fg": s:black2 })
call s:h("NERDTreeDir",             { "fg": s:black2 })

"" Syntastic
"" ---------

"hi! link SyntasticErrorSign Error
"call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:orange })

"" coc
"" ---

"hi! link CocErrorSign Error
"call s:h("CocErrorHighlight",       { "fg": s:red, "format": "underline" })
"call s:h("CocErrorFloat",           { "fg": s:purered, "bg": s:lightblack3 })

"call s:h("CocWarningSign",          { "fg": s:orange, "bg": s:lightblack })
"call s:h("CocWarningHighlight",     { "format": "underline" })
"call s:h("CocWarningFloat",         { "fg": s:orange, "bg": s:lightblack3 })

"call s:h("CocInfoSign",             { "fg": s:yellow, "bg": s:lightblack3 })
"call s:h("CocInfoHighlight",        { "format": "underline" })

"call s:h("CocHintSign",             { "fg": s:white, "bg": s:lightblack3 })
"call s:h("CocHintHighlight",        { "format": "underline" })

"" Language highlight
"" ------------------

call s:h("TSVariable",   { "fg": s:black2 })
call s:h("TSFunction",   { "fg": s:black2 })
call s:h("TSFuncMacro",  { "fg": s:black2 })
call s:h("TSParameter",  { "fg": s:black2 })

" Clojure

hi! link clojureFunc Normal
hi! link clojureSymbol Normal
hi! link clojureDefineName Function
hi! link clojureKeyword Constant
hi! link clojureTSSymbol Constant

"" Java properties
"call s:h("jpropertiesIdentifier",   { "fg": s:pink })

"" Vim command
"call s:h("vimCommand",              { "fg": s:pink })

"" Javascript

hi! link javaScriptBraces          Delimiter
hi! link javaScriptNumber          Constant
hi! link javaScriptNull            Constant
hi! link javaScriptFunction        Keyword

hi! link jsArrowFunction           Operator
hi! link jsClassMethodType         Keyword
hi! link jsDestructuringAssignment Normal
hi! link jsDocParam                Normal
hi! link jsDocTags                 Keyword
hi! link jsDocType                 Type
hi! link jsDocTypeBrackets         Constant
hi! link jsFuncArgOperator         Operator
hi! link jsFunction                Keyword
hi! link jsTemplateBraces          Special
hi! link jsFuncCall 			         Normal
hi! link jsGlobalNodeObjects       Normal
hi! link jsGlobalObjects           Normal

"" Typescript
hi! link graphqlTemplateString            Normal
hi! link graphqlString                    Comment

hi! link typescriptAliasDeclaration       Identifier
hi! link typescriptArrayMethod            Function
hi! link typescriptArrowFunc              Operator
hi! link typescriptArrowFuncArg           Normal
hi! link typescriptAssign                 Operator
hi! link typescriptBOMWindowProp          Normal
hi! link typescriptBinaryOp               Operator
hi! link typescriptBraces                 Delimiter
hi! link typescriptCall                   typescriptArrowFuncArg
hi! link typescriptClassHeritage          Type
hi! link typescriptClassName              Identifier
hi! link typescriptDateMethod             Constant
hi! link typescriptDateStaticMethod       Function
hi! link typescriptDecorator              Normal
hi! link typescriptDefaultParam           Operator
hi! link typescriptES6SetMethod           Constant
hi! link typescriptEndColons              Delimiter
hi! link typescriptEnum                   Type
hi! link typescriptEnumKeyword            Keyword
hi! link typescriptFuncComma              Delimiter
hi! link typescriptFuncKeyword            Keyword
hi! link typescriptFuncType               Normal
hi! link typescriptFuncTypeArrow          Operator
hi! link typescriptGlobal                 Type
hi! link typescriptGlobalMethod           Constant
hi! link typescriptGlobalObjects          Type
hi! link typescriptIdentifier             Normal
hi! link typescriptInterfaceHeritage      Type
hi! link typescriptInterfaceName          Identifier
hi! link typescriptInterpolationDelimiter Keyword
hi! link typescriptKeywordOp              Keyword
hi! link typescriptLogicSymbols           Operator
hi! link typescriptMember                 Normal
hi! link typescriptMemberOptionality      Special
hi! link typescriptObjectColon            Special
hi! link typescriptObjectLabel            Normal
hi! link typescriptObjectSpread           Operator
hi! link typescriptOperator               Operator
hi! link typescriptParamImpl              Normal
hi! link typescriptParens                 Delimiter
hi! link typescriptPredefinedType         Type
hi! link typescriptRestOrSpread           Operator
hi! link typescriptTernaryOp              Operator
hi! link typescriptTypeAnnotation         Special
hi! link typescriptTypeCast               Operator
hi! link typescriptTypeParameter          Normal
hi! link typescriptTypeReference          Type
hi! link typescriptUnaryOp                Operator
hi! link typescriptVariable               Keyword
hi! link typescriptVariableDeclaration    Identifier
hi! link typescriptBOM                    Normal
hi! link typescriptIdentifierName         Identifier
hi! link typescriptTSProperty             Normal
hi! link tsxTSProperty                    Normal

"" Dart
"call s:h("dartStorageClass",    { "fg": s:pink })
"call s:h("dartExceptions",      { "fg": s:pink })
"call s:h("dartConditional",     { "fg": s:pink })
"call s:h("dartRepeat",          { "fg": s:pink })
"call s:h("dartTypedef",         { "fg": s:pink })
"call s:h("dartKeyword",         { "fg": s:pink })
"call s:h("dartConstant",        { "fg": s:purple })
"call s:h("dartBoolean",         { "fg": s:purple })
"call s:h("dartCoreType",        { "fg": s:aqua })
"call s:h("dartType",            { "fg": s:aqua })

"" HTML
hi! link htmlTag         Normal
hi! link htmlArg         Normal
hi! link htmlTitle       Normal
hi! link htmlH1          Normal
hi! link htmlSpecialChar Constant
hi! link htmlEndTag 	   Normal

"" XML
"call s:h("xmlTag",              { "fg": s:pink })
"call s:h("xmlEndTag",           { "fg": s:pink })
"call s:h("xmlTagName",          { "fg": s:orange })
"call s:h("xmlAttrib",           { "fg": s:green })

"" JSX
"call s:h("jsxTag",              { "fg": s:white })
"call s:h("jsxCloseTag",         { "fg": s:white })
"call s:h("jsxCloseString",      { "fg": s:white })
"call s:h("jsxPunct",            { "fg": s:white })
"call s:h("jsxClosePunct",       { "fg": s:white })
"call s:h("jsxTagName",          { "fg": s:pink })
"call s:h("jsxComponentName",    { "fg": s:pink })
"call s:h("jsxAttrib",           { "fg": s:green })
"call s:h("jsxEqual",            { "fg": s:white })
"call s:h("jsxBraces",           { "fg": s:white })

"" CSS
"call s:h("cssProp",             { "fg": s:yellow })
"call s:h("cssUIAttr",           { "fg": s:yellow })
"call s:h("cssFunctionName",     { "fg": s:aqua })
"call s:h("cssColor",            { "fg": s:purple })
"call s:h("cssPseudoClassId",    { "fg": s:purple })
"call s:h("cssClassName",        { "fg": s:green })
"call s:h("cssValueLength",      { "fg": s:purple })
"call s:h("cssCommonAttr",       { "fg": s:pink })
"call s:h("cssBraces" ,          { "fg": s:white })
"call s:h("cssClassNameDot",     { "fg": s:pink })
"call s:h("cssURL",              { "fg": s:orange, "format": "underline,italic" })

"" LESS
"call s:h("lessVariable",        { "fg": s:green })

"" SASS
"call s:h("sassMixing",          { "fg": s:aqua })
"call s:h("sassMixin",           { "fg": s:aqua })
"call s:h("sassFunctionDecl",    { "fg": s:aqua })
"call s:h("sassReturn",          { "fg": s:aqua })
"call s:h("sassClass",           { "fg": s:green })
"call s:h("sassClassChar",       { "fg": s:pink })
"call s:h("sassIdChar",          { "fg": s:pink })
"call s:h("sassControl",         { "fg": s:aqua })
"call s:h("sassFor",             { "fg": s:aqua })

"" ruby
"call s:h("rubyInterpolationDelimiter",  {})
"call s:h("rubyInstanceVariable",        {})
"call s:h("rubyGlobalVariable",          {})
"call s:h("rubyClassVariable",           {})
"call s:h("rubyPseudoVariable",          {})
"call s:h("rubyFunction",                { "fg": s:green })
"call s:h("rubyStringDelimiter",         { "fg": s:yellow })
"call s:h("rubyRegexp",                  { "fg": s:yellow })
"call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
"call s:h("rubySymbol",                  { "fg": s:purple })
"call s:h("rubyEscape",                  { "fg": s:purple })
"call s:h("rubyInclude",                 { "fg": s:pink })
"call s:h("rubyOperator",                { "fg": s:pink })
"call s:h("rubyControl",                 { "fg": s:pink })
"call s:h("rubyClass",                   { "fg": s:pink })
"call s:h("rubyDefine",                  { "fg": s:pink })
"call s:h("rubyException",               { "fg": s:pink })
"call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
"call s:h("rubyRailsARMethod",           { "fg": s:orange })
"call s:h("rubyRailsRerMethod",       { "fg": s:orange })
"call s:h("rubyRailsMethod",             { "fg": s:orange })
"call s:h("rubyConstant",                { "fg": s:aqua })
"call s:h("rubyBlockArgument",           { "fg": s:orange })
"call s:h("rubyBlockParameter",          { "fg": s:orange })

"" eruby
"call s:h("erubyDelimiter",              {})
"call s:h("erubyRailsMethod",            { "fg": s:aqua })

"" c
"call s:h("cLabel",                      { "fg": s:pink })
"call s:h("cStructure",                  { "fg": s:aqua })
"call s:h("cStorageClass",               { "fg": s:pink })
"call s:h("cInclude",                    { "fg": s:pink })
"call s:h("cDefine",                     { "fg": s:pink })
"call s:h("cSpecial",                    { "fg": s:purple })

"" Markdown
"call s:h("markdownCode",       { "fg": s:purple, "format": "italic" } )
"call s:h("markdownListMarker", { "fg": s:purple                     } )

hi link markdownH1 Title
hi link markdownH1Delimiter Title
hi link markdownH2 Title
hi link markdownH2Delimiter Title
hi link markdownH3 Title
hi link markdownH3Delimiter Title
hi link markdownH4 Title
hi link markdownH4Delimiter Title
hi link markdownH5 Title
hi link markdownH5Delimiter Title


"" vim-notes
"call s:h("notesTitle",        { "fg": s:aqua,        "format": "bold"        } )
"call s:h("notesAtxMarker",    { "fg": s:pink,        "format": "italic,bold" } )
"call s:h("notesShortHeading", { "fg": s:white,       "format": "bold"        } )
"call s:h("notesListBullet",   { "fg": s:purple                               } )
"call s:h("notesListNumber",   { "fg": s:purple,      "format": "italic"      } )
"call s:h("notesBold",         {                      "format": "bold"        } )
"call s:h("notesDoneMarker",   { "fg": s:green                                } )

"" Terminal Colors
"" ---------------
"if has('nvim')
  "let g:terminal_color_0  = s:black.gui
  "let g:terminal_color_1  = s:red.gui
  "let g:terminal_color_2  = s:green.gui
  "let g:terminal_color_3  = s:yellow.gui
  "let g:terminal_color_4  = s:aqua.gui
  "let g:terminal_color_5  = s:purple.gui
  "let g:terminal_color_6  = s:cyan.gui
  "let g:terminal_color_7  = s:white.gui
  "let g:terminal_color_8  = s:darkgrey.gui
  "let g:terminal_color_9  = s:pink.gui
  "let g:terminal_color_10 = s:br_green.gui
  "let g:terminal_color_11 = s:br_yellow.gui
  "let g:terminal_color_12 = s:br_blue.gui
  "let g:terminal_color_13 = s:br_purple.gui
  "let g:terminal_color_14 = s:br_cyan.gui
  "let g:terminal_color_15 = s:br_white.gui
"else
  "let g:terminal_ansi_colors = [
        "\ s:black.gui,
        "\ s:red.gui,
        "\ s:green.gui,
        "\ s:yellow.gui,
        "\ s:aqua.gui,
        "\ s:purple.gui,
        "\ s:cyan.gui,
        "\ s:white.gui,
        "\ s:darkgrey.gui,
        "\ s:pink.gui,
        "\ s:br_green.gui,
        "\ s:br_yellow.gui,
        "\ s:br_blue.gui,
        "\ s:br_purple.gui,
        "\ s:br_cyan.gui,
        "\ s:br_white.gui]
"endif
