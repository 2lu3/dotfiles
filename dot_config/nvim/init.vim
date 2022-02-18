if &compatible
  set nocompatible
endif

" 外部設定ファイルの読み込み
runtime! options.vim
runtime! keymap.vim

" neovim用pythonの設定
" pip install pynvim
if has('win64')
    let g:python3_dir = 'C:\Users\tlaloc\python_envs\nvim\.venv\Scripts\'
    let g:python3_host_prog=g:python3_dir . 'python.exe'
elseif has("unix")
    let g:python3_dir = '~/python_envs/nvim/.venv/bin/'
    let g:python3_host_prog= g:python3_dir . 'python'
endif

" dein関係
"
let g:dein#auto_recache=1

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:watch_files = ['~/.config/nvim/init.vim', '~/.config/nvim/dein.toml', '~/.config/nvim/dein_lazy.toml']

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein', s:watch_files)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax enable
