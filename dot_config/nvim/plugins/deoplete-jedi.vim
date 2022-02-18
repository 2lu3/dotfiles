" show docstring in previw window
let g:deoplete#sources#jedi#show_docstring = 1

" Set the Python interpreter path to use for the completion server. It
" defaults to "python", i.e. the first available python in $PATH. Note: This
" is different from Neovim's Python (:python) in general.
let g:deoplete#sources#jedi#python_path = g:python3_host_prog

" Ignore jedi errors for completions. Default: 0
let g:deoplete#sources#jedi#ignore_errors = 1

" Ignore private members from completions. Default: 0
let g:deoplete#sources#jedi#ignore_private_members = 0
