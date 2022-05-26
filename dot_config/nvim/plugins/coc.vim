" lightlineにcocのステータスを載せる
let g:lightline = {
    \'active': {
        \'right':[
            \['coc']
        \]
    \},
    \'component_function': {
        \'coc': 'coc#status'
    \}
\}

" Diagnosisの、左横のアイコン色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


"ノーマルモードで
"Leader2回でCocList
nnoremap  <Leader><Leader> :<C-u>CocList<cr>
"スペースinfoでHover
noremap <silent> <Leader>info :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nnoremap <Leader>df :call CocAction('jumpDefinition')<CR>
"スペースdcでDeclaration
nnoremap <space>dc :call CocAction('jumpDeclaration')<CR>
"スペースrfでReferences
nnoremap <silent> <space>rf <Plug>(coc-references)<CR>
"スペースrnでRename
nmap <silent> <space>rn <Plug>(coc-rename)
"スペースfmtでFormat
nnoremap <space>fmt :call CocAction('format')<CR>
" Coc-quick-fix
nnoremap <space>fx :CocAction quickfix<CR>
