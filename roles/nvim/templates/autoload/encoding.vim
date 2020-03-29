function! encoding#strip(value)
  return substitute(a:value, '\n$', '', 'g')
endfunction

function! encoding#apply(fn)
	" Preserve line breaks
	let l:paste = &paste
	set paste
	" Reselect the visual mode text
	normal! gv
	" Apply transformation to the text
	execute "normal! c\<c-r>=encoding#" . a:fn . "(@\")\<cr>\<esc>"
	" Select the new text
	normal! `[v`]h
	" Revert to previous mode
	let &paste = l:paste
endfunction

"---------------------------------------------
" Base64
" based on https://github.com/christianrondeau/vim-base64
"---------------------------------------------

function! encoding#base64_encode(value)
  return encoding#strip(system('python3 -m base64', a:value))
endfunction

function! encoding#base64_decode(value)
  return encoding#strip(system('python3 -m base64 -d', a:value))
endfunction

function! encoding#base64_v_atob()
  call encoding#apply("base64_encode")
endfunction

function! encoding#base64_v_btoa()
  call encoding#apply("base64_decode")
endfunction

"---------------------------------------------
" URL
"---------------------------------------------

function! encoding#url_decode(value)
  return encoding#strip(system('python3 -c "import sys, urllib.parse as ul; [print(ul.unquote_plus(l), end='''') for l in sys.stdin]"', a:value))
endfunction

function! encoding#url_encode(value)
  return encoding#strip(system('python3 -c "import sys, urllib.parse as ul; [print(ul.quote_plus(l), end='''') for l in sys.stdin]"', a:value))
endfunction

function! encoding#url_v_stou()
  call encoding#apply("url_encode")
endfunction

function! encoding#url_v_utos()
  call encoding#apply("url_decode")
endfunction
