let g:ycm_python_interpreter_path = '{{ python3_venv_path | expanduser }}/bin/python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
" let g:ycm_global_ycm_extra_conf = '{{config_path}}/global_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '{{config_path}}/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
