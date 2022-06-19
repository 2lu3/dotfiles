if &compatible
  set nocompatible
endif

" 外部設定ファイルの読み込み
runtime! options.vim
runtime! keymap.vim

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

syntax enable
