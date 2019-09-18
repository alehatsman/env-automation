function! s:SortTimeStamps(lhs, rhs)
  return a:lhs[1] > a:rhs[1] ? 1
    \    a:lhs[1] < a:rhs[1] ? -1 
    \                        : 0
endfunction

function! s:CloseStaleBuffers(max_number_of_buffers)
  let saved_buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && ! getbufvar(v:val, "&modified")')
  let times = map(copy(saved_buffers), '[(v:val), getftime(bufname(v:val))]')
  call filter(times, 'v:val[1] > 0')
  call sort(times, function('s:SortTimeStamps'))
  let number_of_buffers = min([a:max_number_of_buffers, len(times)])
  let buffers_to_strip = map(copy(times[0:(number_of_buffers-1)]), 'v:val[0]')
  exe 'bw '.join(buffers_to_strip, ' ')
endfunction

augroup CloseOldBuffers
  au!
  au BufNew * call s:Close(g:max_number_of_buffers)
augroup END

let g:max_number_of_buffers = 20
