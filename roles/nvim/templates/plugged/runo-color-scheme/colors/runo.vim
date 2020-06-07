" Configuration:

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'runo'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette:

let s:none      = ['NONE', 'NONE']

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:runo#palette['color_' . s:i]
  endfor
endif

if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:runo#palette['color_' . s:i])
  endfor
endif

" User Configuration:

if !exists('g:runo_bold')
  let g:runo_bold = 1
endif

if !exists('g:runo_italic')
  let g:runo_italic = 1
endif

if !exists('g:runo_underline')
  let g:runo_underline = 1
endif

if !exists('g:runo_undercurl') && g:runo_underline != 0
  let g:runo_undercurl = 1
endif

if !exists('g:runo_inverse')
  let g:runo_inverse = 1
endif

if !exists('g:runo_colorterm')
  let g:runo_colorterm = 1
endif

" Script Helpers:

let s:attrs = {
      \ 'bold': g:runo_bold == 1 ? 'bold' : 0,
      \ 'italic': g:runo_italic == 1 ? 'italic' : 0,
      \ 'underline': g:runo_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:runo_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:runo_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " Falls back to coloring foreground group on terminals because
  " nearly all do not support undercurl
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !has('gui_running')
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

" Runo Highlight Groups:

" Color groups

call s:h('RunoBgDarker', s:none, g:runo#palette.bg_0)
call s:h('RunoBgDark', s:none, g:runo#palette.bg_1)
call s:h('RunoBg', s:none, g:runo#palette.bg_2)
call s:h('RunoBgLight', s:none, g:runo#palette.bg_3)
call s:h('RunoBgLighter', s:none, g:runo#palette.bg_4)

call s:h('RunoFg', g:runo#palette.fg_2)
call s:h('RunoFgUnderline', g:runo#palette.fg_2, s:none, [s:attrs.underline])
call s:h('RunoFgBold', g:runo#palette.fg_2, s:none, [s:attrs.bold])

call s:h('RunoString', g:runo#palette.fg_2, g:runo#palette.positive_4)
call s:h('RunoComment', g:runo#palette.fg_2, g:runo#palette.neutral_2)
call s:h('RunoConstant', g:runo#palette.fg_2, g:runo#palette.sub_brand_4)
call s:h('RunoGlobalDef', g:runo#palette.fg_2, g:runo#palette.brand_4)

call s:h('RunoGreen', g:runo#palette.positive_2)
call s:h('RunoGreenBold', g:runo#palette.positive_2, s:none, [s:attrs.bold])

call s:h('RunoOrange', g:runo#palette.attention_2)
call s:h('RunoOrangeBold', g:runo#palette.attention_2, s:none, [s:attrs.bold])
call s:h('RunoOrangeInverse', g:runo#palette.fg_2, g:runo#palette.attention_2)

call s:h('RunoPink', g:runo#palette.sub_brand_2)
call s:h('RunoPinkBold', g:runo#palette.sub_brand_2, s:none, [s:attrs.bold])

call s:h('RunoRed', g:runo#palette.negative_2)
call s:h('RunoRedInverse', g:runo#palette.fg_2, g:runo#palette.negative_2)

call s:h('RunoYellow', g:runo#palette.neutral_2)

call s:h('RunoBlue_1', g:runo#palette.brand_0)

call s:h('RunoBlue_2', g:runo#palette.brand_2)
call s:h('RunoBlueBold', g:runo#palette.brand_2, s:none, [s:attrs.bold])

call s:h('RunoSx', g:runo#palette.fg_1)
call s:h('RunoSxUnderline', g:runo#palette.fg_1, s:none, [s:attrs.underline])
call s:h('RunoSxBold', g:runo#palette.fg_1, s:none, [s:attrs.bold])

call s:h('RunoSelection', s:none, g:runo#palette.brand_3)
call s:h('RunoSubtle', g:runo#palette.bg_4)

call s:h('RunoError', g:runo#palette.fg_2, g:runo#palette.negative_2, [], g:runo#palette.negative_2)

call s:h('RunoErrorLine', s:none, s:none, [s:attrs.undercurl], g:runo#palette.negative_2)
call s:h('RunoWarnLine', s:none, s:none, [s:attrs.undercurl], g:runo#palette.negative_4)
call s:h('RunoInfoLine', s:none, s:none, [s:attrs.undercurl], g:runo#palette.positive_2)

call s:h('RunoSearch', g:runo#palette.attention_2, s:none, [s:attrs.inverse])
call s:h('RunoLink', g:runo#palette.brand_2, s:none, [s:attrs.underline])

call s:h('RunoDiffChange', g:runo#palette.negative_4, s:none)
call s:h('RunoDiffText', g:runo#palette.bg_2, g:runo#palette.negative_4)
call s:h('RunoDiffDelete', g:runo#palette.negative_2, g:runo#palette.bg_1)

" User Interface:

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', g:runo#palette.fg_2, g:runo_colorterm || has('gui_running') ? g:runo#palette.bg_2 : s:none )
call s:h('StatusLine', s:none, g:runo#palette.bg_4, [s:attrs.bold])
call s:h('StatusLineNC', s:none, g:runo#palette.bg_3)
call s:h('StatusLineTerm', s:none, g:runo#palette.bg_4, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, g:runo#palette.bg_3)
call s:h('WildMenu', g:runo#palette.bg_2, g:runo#palette.sub_brand_2, [s:attrs.bold])
call s:h('CursorLine', s:none, g:runo#palette.bg_1)
call s:h('LineNr', g:runo#palette.fg_4, g:runo#palette.bg_1)
call s:h('SignColumn', g:runo#palette.brand_2)

hi! link ColorColumn  RunoBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr RunoFg
hi! link DiffAdd      RunoGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   RunoOrange
hi! link DiffDelete   RunoDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     RunoDiffText
hi! link Directory    RunoPinkBold
hi! link ErrorMsg     RunoRedInverse
hi! link FoldColumn   RunoSubtle
hi! link Folded       RunoBlue_1
hi! link IncSearch    RunoOrangeInverse
hi! link MoreMsg      RunoFgBold
hi! link NonText      RunoSubtle
hi! link Pmenu        RunoBgDark
hi! link PmenuSbar    RunoBgDark
hi! link PmenuSel     RunoSelection
hi! link PmenuThumb   RunoSelection
hi! link Question     RunoFgBold
hi! link Search       RunoSearch
hi! link TabLine      RunoBlue_1
hi! link TabLineFill  RunoBgDarker
hi! link TabLineSel   Normal
hi! link Title        RunoGreenBold
hi! link VertSplit    RunoBlue_1
hi! link Visual       RunoSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   RunoOrangeInverse

" Syntax

" Required as some plugins will overwrite
call s:h('MatchParen', g:runo#palette.positive_2, s:none, [s:attrs.underline])
call s:h('Conceal', g:runo#palette.positive_2, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey RunoRed
  hi! link LspDiagnosticsUnderline RunoFgUnderline
  hi! link LspDiagnosticsInformation RunoPink
  hi! link LspDiagnosticsHint RunoPink
  hi! link LspDiagnosticsError RunoError
  hi! link LspDiagnosticsWarning RunoOrange
  hi! link LspDiagnosticsUnderlineError RunoErrorLine
  hi! link LspDiagnosticsUnderlineHint RunoInfoLine
  hi! link LspDiagnosticsUnderlineInformation RunoInfoLine
  hi! link LspDiagnosticsUnderlineWarning RunoWarnLine
else
  hi! link SpecialKey RunoSubtle
endif

hi! link Comment RunoComment
hi! link Underlined RunoFgUnderline
hi! link Todo RunoComment

hi! link Error RunoError
hi! link SpellBad RunoErrorLine
hi! link SpellLocal RunoWarnLine
hi! link SpellCap RunoInfoLine
hi! link SpellRare RunoInfoLine

hi! link Constant RunoConstant
hi! link String RunoString
hi! link Character RunoConstant
hi! link Number RunoConstant
hi! link Boolean RunoConstant
hi! link Float RunoConstant

hi! link Identifier RunoGlobalDef
hi! link Function RunoGlobalDef

hi! link Statement RunoSx
hi! link Conditional RunoSx
hi! link Repeat RunoSx
hi! link Label RunoFg
hi! link Operator RunoSx
hi! link Keyword RunoSx
hi! link Exception RunoSx

hi! link PreProc RunoSx
hi! link Include RunoSx
hi! link Define RunoSx
hi! link Macro RunoSx
hi! link PreCondit RunoSx
hi! link StorageClass RunoSx
hi! link Structure RunoSx
hi! link Typedef RunoPink

hi! link Type RunoSx
hi! link Delimiter RunoSx

hi! link Special RunoSx
hi! link SpecialComment RunoPink
hi! link Tag RunoSx
hi! link helpHyperTextJump RunoLink
hi! link helpCommand RunoComment
hi! link helpExample RunoComment
hi! link helpBacktick Special

" vim: fdm=marker ts=2 sts=2 sw=2:
