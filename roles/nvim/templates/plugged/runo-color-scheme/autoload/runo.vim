" Palette

let g:runo#palette            = {}

let g:runo#palette.gray_0       = ['{{colors.gray.0}}', 188]
let g:runo#palette.gray_1       = ['{{colors.gray.1}}', 1]
let g:runo#palette.gray_2       = ['{{colors.gray.2}}', 231]
let g:runo#palette.gray_3       = ['{{colors.gray.2}}', 1]
let g:runo#palette.gray_4       = ['{{colors.gray.2}}', 1]

let g:runo#palette.black_0       = ['{{colors.black.0}}', 1]
let g:runo#palette.black_1       = ['{{colors.black.1}}', 1]
let g:runo#palette.black_2       = ['{{colors.black.2}}', 59]
let g:runo#palette.black_3       = ['{{colors.black.3}}', 1]
let g:runo#palette.black_4       = ['{{colors.black.4}}', 1]

let g:runo#palette.blue_0    = ['{{colors.blue.0}}', 1]
let g:runo#palette.blue_1    = ['{{colors.blue.1}}', 1]
let g:runo#palette.blue_2    = ['{{colors.blue.2}}', 60]
let g:runo#palette.blue_3    = ['{{colors.blue.3}}', 1]
let g:runo#palette.blue_4    = ['{{colors.blue.4}}', 1]

let g:runo#palette.pink_0 = ['{{colors.pink.0}}', 1]
let g:runo#palette.pink_1 = ['{{colors.pink.1}}', 1]
let g:runo#palette.pink_2 = ['{{colors.pink.2}}', 168]
let g:runo#palette.pink_3 = ['{{colors.pink.3}}', 1]
let g:runo#palette.pink_4 = ['{{colors.pink.4}}', 1]

let g:runo#palette.green_0 = ['{{colors.green.0}}', 1]
let g:runo#palette.green_1 = ['{{colors.green.1}}', 1]
let g:runo#palette.green_2 = ['{{colors.green.2}}', 151]
let g:runo#palette.green_3 = ['{{colors.green.3}}', 1]
let g:runo#palette.green_4 = ['{{colors.green.4}}', 1]

let g:runo#palette.red_0 = ['{{colors.red.0}}', 1]
let g:runo#palette.red_1 = ['{{colors.red.1}}', 1]
let g:runo#palette.red_2 = ['{{colors.red.2}}', 181]
let g:runo#palette.red_3 = ['{{colors.red.3}}', 1]
let g:runo#palette.red_4 = ['{{colors.red.4}}', 1]

let g:runo#palette.yellow_0 = ['{{colors.yellow.0}}', 215]
let g:runo#palette.yellow_1 = ['{{colors.yellow.1}}', 215]
let g:runo#palette.yellow_2 = ['{{colors.yellow.2}}', 229]

" Normal colors
let g:runo#palette.color_0  = '{{ ansi_colors.normal.black }}'
let g:runo#palette.color_1  = '{{ ansi_colors.normal.red }}'
let g:runo#palette.color_2  = '{{ ansi_colors.normal.green }}'
let g:runo#palette.color_3  = '{{ ansi_colors.normal.yellow }}'
let g:runo#palette.color_4  = '{{ ansi_colors.normal.blue }}'
let g:runo#palette.color_5  = '{{ ansi_colors.normal.magenta }}'
let g:runo#palette.color_6  = '{{ ansi_colors.normal.cyan }}'
let g:runo#palette.color_7  = '{{ ansi_colors.normal.white }}'

" Bright colors
let g:runo#palette.color_8  = '{{ ansi_colors.bright.black }}'
let g:runo#palette.color_9  = '{{ ansi_colors.bright.red }}'
let g:runo#palette.color_10 = '{{ ansi_colors.bright.green }}'
let g:runo#palette.color_11 = '{{ ansi_colors.bright.yellow }}'
let g:runo#palette.color_12 = '{{ ansi_colors.bright.blue }}'
let g:runo#palette.color_13 = '{{ ansi_colors.bright.magenta }}'
let g:runo#palette.color_14 = '{{ ansi_colors.bright.cyan }}'
let g:runo#palette.color_15 = '{{ ansi_colors.bright.white }}'

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! runo#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'runo'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2:
