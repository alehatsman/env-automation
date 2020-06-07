" Palette

let g:runo#palette            = {}

let g:runo#palette.bg_0       = ['{{colors.bg.0}}', 188]
let g:runo#palette.bg_1       = ['{{colors.bg.1}}', 1]
let g:runo#palette.bg_2       = ['{{colors.bg.2}}', 231]
let g:runo#palette.bg_3       = ['{{colors.bg.2}}', 1]
let g:runo#palette.bg_4       = ['{{colors.bg.2}}', 1]

let g:runo#palette.fg_0       = ['{{colors.fg.0}}', 1]
let g:runo#palette.fg_1       = ['{{colors.fg.1}}', 1]
let g:runo#palette.fg_2       = ['{{colors.fg.2}}', 59]
let g:runo#palette.fg_3       = ['{{colors.fg.3}}', 1]
let g:runo#palette.fg_4       = ['{{colors.fg.4}}', 1]

let g:runo#palette.brand_0    = ['{{colors.brand.0}}', 1]
let g:runo#palette.brand_1    = ['{{colors.brand.1}}', 1]
let g:runo#palette.brand_2    = ['{{colors.brand.2}}', 60]
let g:runo#palette.brand_3    = ['{{colors.brand.3}}', 1]
let g:runo#palette.brand_4    = ['{{colors.brand.4}}', 1]

let g:runo#palette.sub_brand_0 = ['{{colors.sub_brand.0}}', 1]
let g:runo#palette.sub_brand_1 = ['{{colors.sub_brand.1}}', 1]
let g:runo#palette.sub_brand_2 = ['{{colors.sub_brand.2}}', 168]
let g:runo#palette.sub_brand_3 = ['{{colors.sub_brand.3}}', 1]
let g:runo#palette.sub_brand_4 = ['{{colors.sub_brand.4}}', 1]

let g:runo#palette.positive_0 = ['{{colors.positive.0}}', 1]
let g:runo#palette.positive_1 = ['{{colors.positive.1}}', 1]
let g:runo#palette.positive_2 = ['{{colors.positive.2}}', 151]
let g:runo#palette.positive_3 = ['{{colors.positive.3}}', 1]
let g:runo#palette.positive_4 = ['{{colors.positive.4}}', 1]

let g:runo#palette.negative_0 = ['{{colors.negative.0}}', 1]
let g:runo#palette.negative_1 = ['{{colors.negative.1}}', 1]
let g:runo#palette.negative_2 = ['{{colors.negative.2}}', 181]
let g:runo#palette.negative_3 = ['{{colors.negative.3}}', 1]
let g:runo#palette.negative_4 = ['{{colors.negative.4}}', 1]

let g:runo#palette.neutral_2 = ['{{colors.neutral.2}}', 229]
let g:runo#palette.attention_2 = ['{{colors.attention.2}}', 215]

let g:runo#palette.color_0  = '{{colors.fg.2}}'
let g:runo#palette.color_1  = '{{colors.negative.2}}'
let g:runo#palette.color_2  = '{{colors.positive.2}}'
let g:runo#palette.color_3  = '{{colors.neutral.2}}'
let g:runo#palette.color_4  = '{{colors.attention.2}}'
let g:runo#palette.color_5  = '{{colors.brand.2}}'
let g:runo#palette.color_6  = '#8BE9FD'
let g:runo#palette.color_7  = '{{colors.brand.2}}'
let g:runo#palette.color_8  = '{{colors.brand.0}}'
let g:runo#palette.color_9  = '{{colors.negative.0}}'
let g:runo#palette.color_10 = '{{colors.positive.0}}'
let g:runo#palette.color_11 = '{{colors.neutral.2}}'
let g:runo#palette.color_12 = '{{colors.attention.2}}'
let g:runo#palette.color_13 = '#FF92DF'
let g:runo#palette.color_14 = '#A4FFFF'
let g:runo#palette.color_15 = '#FFFFFF'

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
