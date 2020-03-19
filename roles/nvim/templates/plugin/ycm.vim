"---------------------------------------------
" Python configuration
"---------------------------------------------
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0

let g:ycm_python_binary_path = 'python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_binary_path',
  \  'g:ycm_server_python_interpreter'
  \]
let g:ycm_global_ycm_extra_conf = '{{ config_path | expanduser }}/global_extra_conf.py'

function! s:GetPipenvStat()
  let l:venv_path = system('pipenv --venv')
  let l:stat = {
    \ 'shell_error': v:shell_error,
    \ 'venv_path': l:venv_path,
    \}
  return l:stat
endfunction

" Pipenv support
let s:pipenvStat = s:GetPipenvStat()
if s:pipenvStat['shell_error'] == 0
  let venv_path = trim(s:pipenvStat['venv_path'])
  let g:ycm_server_python_interpreter = venv_path . '/bin/python'
else
  let g:ycm_server_python_interpreter = '{{ python3_venv_path | expanduser }}/bin/python'
endif
