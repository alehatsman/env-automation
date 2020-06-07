if runo#should_abort()
  finish
endif

if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Search'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Search'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'],
    \}
endif

if exists('g:ale_enabled')
  hi! link ALEError              RunoErrorLine
  hi! link ALEWarning            RunoWarnLine
  hi! link ALEInfo               RunoInfoLine

  hi! link ALEErrorSign          RunoRed
  hi! link ALEWarningSign        RunoOrange
  hi! link ALEInfoSign           RunoPink

  hi! link ALEVirtualTextError   Comment
  hi! link ALEVirtualTextWarning Comment
endif

if exists('g:loaded_ctrlp')
  hi! link CtrlPMatch     IncSearch
  hi! link CtrlPBufferHid Normal
endif

" vim: fdm=marker ts=2 sts=2 sw=2:
