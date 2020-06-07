if runo#should_abort('ruby')
    finish
endif

if ! exists('g:ruby_operators')
    let g:ruby_operators=1
endif

hi! link rubyBlockArgument          RunoOrangeItalic
hi! link rubyBlockParameter         RunoOrangeItalic
hi! link rubyCurlyBlock             RunoPink
hi! link rubyGlobalVariable         RunoPink
hi! link rubyInstanceVariable       RunoPinkItalic
hi! link rubyInterpolationDelimiter RunoPink
hi! link rubyRegexpDelimiter        RunoRed
hi! link rubyStringDelimiter        RunoYellow
