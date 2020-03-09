let b:python_highlight_all=1
let g:ale_python_auto_pipenv=1
" Check Python files with flake8 and pylint.
let b:ale_linters = ['pyls', 'black', 'mypy']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['black']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0

nmap <buffer> <S-k> :ALEHover<cr>
nmap <buffer> <C-]> :ALEGoToDefinition<cr>
