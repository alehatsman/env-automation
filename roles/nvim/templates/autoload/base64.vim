" based on https://github.com/christianrondeau/vim-base64

function! base64#strip(value)
  return substitute(a:value, '\n$', '', 'g')
endfunction

function! base64#encode(value)
  return base64#strip(system('python3 -m base64', a:value))
endfunction

function! base64#decode(value)
  return base64#strip(system('python3 -m base64 -d', a:value))
endfunction

function! base64#apply(fn)
	" Preserve line breaks
	let l:paste = &paste
	set paste
	" Reselect the visual mode text
	normal! gv
	" Apply transformation to the text
	execute "normal! c\<c-r>=base64#" . a:fn . "(@\")\<cr>\<esc>"
	" Select the new text
	normal! `[v`]h
	" Revert to previous mode
	let &paste = l:paste
endfunction

function! base64#v_atob()
  call base64#apply("encode")
endfunction

function! base64#v_btoa()
  call base64#apply("decode")
endfunction
