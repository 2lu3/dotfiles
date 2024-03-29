if &compatible
  set nocompatible
endif

runtime! keymap.vim
runtime! options.vim

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

"colorscheme gruvbox
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE

syntax enable
