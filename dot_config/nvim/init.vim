if &compatible
  set nocompatible
endif

" neovim用pythonの設定
" pip install pynvim
if has('win64')
    let g:python3_dir = ''
    let g:python3_host_prog=g:python3_dir . 'python.exe'
elseif has("unix")
    let g:python3_dir = '~/.pynvim/bin/'
    let g:python3_host_prog= g:python3_dir . 'python'
endif

runtime! dein.vim
runtime! options.vim
runtime! keymap.vim

syntax enable
