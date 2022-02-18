let g:deoplete#sources#clang#libclang_path = 'D:\\Program Files\\LLVM\\bin\\libclang.dll'
let g:deoplete#sources#clang#clang_header = 'D:\\Program Files\\LLVM\\lib\\clang'

" 起動時に有効にする
let g:deoplete#enable_at_startup = 1

" 補完終了時にpreviewウィンドウを削除
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" 補完をするまでの待ち時間
" 大文字小文字関係なく
call deoplete#custom#option({
            \ 'auto_complete_delay': 0,
            \ 'ignore_case': v:true,
            \ })

" 大文字小文字両方が入っている場合、大文字小文字区別する
let g:deoplete#smart_case = 1

" 補完を始める文字数
let g:deoplete#min_pattern_length = 1


