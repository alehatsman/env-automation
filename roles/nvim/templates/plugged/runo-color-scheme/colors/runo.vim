" Configuration

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

" Terminal ANSI colors

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

" User Configuration

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

" Script Helpers

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

" Runo Highlight Groups

" Color groups

call s:h('RunoBgDarker', s:none, g:runo#palette.gray_0)
call s:h('RunoBgDark', s:none, g:runo#palette.gray_1)
call s:h('RunoBg', s:none, g:runo#palette.gray_2)
call s:h('RunoBgLight', s:none, g:runo#palette.gray_3)
call s:h('RunoBgLighter', s:none, g:runo#palette.gray_4)

call s:h('RunoFg', g:runo#palette.black_2)
call s:h('RunoFgUnderline', g:runo#palette.black_2, s:none, [s:attrs.underline])
call s:h('RunoFgBold', g:runo#palette.black_2, s:none, [s:attrs.bold])

call s:h('RunoString', g:runo#palette.black_2, g:runo#palette.green_4)
call s:h('RunoComment', g:runo#palette.black_2, g:runo#palette.yellow_2)
call s:h('RunoConstant', g:runo#palette.black_2, g:runo#palette.pink_4)
call s:h('RunoGlobalDef', g:runo#palette.black_2, g:runo#palette.blue_4)

call s:h('RunoDiffAdd', g:runo#palette.black_1, g:runo#palette.green_3)
call s:h('RunoDiffDelete', g:runo#palette.black_1, g:runo#palette.red_3)

call s:h('RunoGreen', g:runo#palette.green_2)
call s:h('RunoGreenBold', g:runo#palette.green_2, s:none, [s:attrs.bold])

call s:h('RunoOrange', g:runo#palette.yellow_0)
call s:h('RunoOrangeBold', g:runo#palette.yellow_0, s:none, [s:attrs.bold])
call s:h('RunoOrangeInverse', g:runo#palette.black_2, g:runo#palette.yellow_0)

call s:h('RunoPink', g:runo#palette.pink_2)
call s:h('RunoPinkBold', g:runo#palette.pink_2, s:none, [s:attrs.bold])

call s:h('RunoRed', g:runo#palette.red_2)
call s:h('RunoRedInverse', g:runo#palette.black_2, g:runo#palette.red_2)

call s:h('RunoYellow', g:runo#palette.yellow_2)

call s:h('RunoBlue_1', g:runo#palette.blue_0)
call s:h('RunoBlue_2', g:runo#palette.blue_2)
call s:h('RunoBlueBold', g:runo#palette.blue_2, s:none, [s:attrs.bold])

call s:h('RunoSelection', s:none, g:runo#palette.blue_3)
call s:h('RunoSubtle', g:runo#palette.gray_4)

call s:h('RunoError', g:runo#palette.black_2, g:runo#palette.red_2, [], g:runo#palette.red_2)

call s:h('RunoErrorLine', g:runo#palette.black_2, s:none, [s:attrs.undercurl], g:runo#palette.red_2)
call s:h('RunoWarnLine', g:runo#palette.black_2, s:none, [s:attrs.undercurl], g:runo#palette.red_4)
call s:h('RunoInfoLine', g:runo#palette.black_2, s:none, [s:attrs.undercurl], g:runo#palette.green_2)

call s:h('RunoSearch', g:runo#palette.yellow_0, g:runo#palette.black_2, [s:attrs.inverse])
call s:h('RunoSearchInc', g:runo#palette.yellow_0, g:runo#palette.black_2, [s:attrs.inverse, s:attrs.underline])
call s:h('RunoLink', g:runo#palette.black_2, s:none, [s:attrs.underline])

" User Interface

" set background=light

" Required as some plugins will overwrite
call s:h('Normal', g:runo#palette.black_2, g:runo_colorterm || has('gui_running') ? g:runo#palette.gray_2 : s:none )
call s:h('StatusLine', s:none, g:runo#palette.gray_4, [s:attrs.bold])
call s:h('StatusLineNC', s:none, g:runo#palette.gray_3)
call s:h('StatusLineTerm', s:none, g:runo#palette.gray_4, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, g:runo#palette.gray_3)
call s:h('WildMenu', g:runo#palette.gray_2, g:runo#palette.pink_2, [s:attrs.bold])
call s:h('CursorLine', s:none, g:runo#palette.gray_1)
call s:h('LineNr', g:runo#palette.black_4, g:runo#palette.gray_1)
call s:h('SignColumn', g:runo#palette.blue_2)

hi! link ColorColumn  RunoBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr RunoFg

hi! link DiffAdd      RunoDiffAdd
hi! link DiffAdded    RunoDiffAdd
hi! link DiffChange   RunoDiffAdd
hi! link DiffDelete   RunoDiffDelete
hi! link DiffRemoved  RunoDiffDelete
hi! link DiffText     RunoDiffAdd

hi! link Directory    RunoFgBold
hi! link ErrorMsg     RunoRedInverse
hi! link FoldColumn   RunoSubtle
hi! link Folded       RunoBlue_1
hi! link IncSearch    RunoSearchInc
hi! link MoreMsg      RunoFgBold
hi! link NonText      RunoSubtle
hi! link Pmenu        RunoBgDark
hi! link PmenuSbar    RunoBgDark
hi! link PmenuSel     RunoSelection
hi! link PmenuThumb   RunoSelection
hi! link Question     RunoFgBold
hi! link Search       RunoSearch| "last search pattern highlighting

hi! link TabLineSel   Normal| "tab pages line, active tab page label
hi! link TabLine      RunoBlue_1| "tab pages line, not active tab page label
hi! link TabLineFill  RunoBgDarker|   "tab pages line, where there are no labels

hi! link Title        RunoGlobalDef
hi! link VertSplit    RunoBlue_1
hi! link Visual       RunoSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   RunoOrangeInverse

" Syntax

" Required as some plugins will overwrite
call s:h('MatchParen', g:runo#palette.black_2, g:runo#palette.green_2, [s:attrs.underline])
call s:h('Conceal', g:runo#palette.green_2, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey RunoRed

  hi! link LspDiagnosticsError RunoError
  hi! link LspDiagnosticsErrorSign RunoRed
  hi! link LspDiagnosticsErrorFloating RunoError

  hi! link LspDiagnosticsUnderline RunoFgUnderline
  hi! link LspDiagnosticsInformation RunoFgUnderline
  hi! link LspDiagnosticsHint RunoFgUnderline
  hi! link LspDiagnosticsWarning RunoOrange
  hi! link LspDiagnosticsUnderlineError RunoError
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

hi! link Identifier RunoFg
hi! link Function RunoFg

hi! link Statement RunoFg
hi! link Conditional RunoFg
hi! link Repeat RunoFg
hi! link Label RunoFg
hi! link Operator RunoFg
hi! link Keyword RunoFg
hi! link Exception RunoFg

hi! link PreProc RunoFg
hi! link Include RunoFg
hi! link Define RunoFg
hi! link Macro RunoFg
hi! link PreCondit RunoFg
hi! link StorageClass RunoFg
hi! link Structure RunoFg
hi! link Typedef RunoPink

hi! link Type RunoFg
hi! link Delimiter RunoFg

hi! link Special RunoFg
hi! link SpecialComment RunoComment
hi! link Tag RunoFg
hi! link helpHyperTextJump RunoLink
hi! link helpCommand RunoComment
hi! link helpExample RunoComment
hi! link helpBacktick Special

" vim: fdm=marker ts=2 sts=2 sw=2:
