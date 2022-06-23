" デフォルトでインストールするもの
let g:coc_global_extensions = [
    \'coc-clangd',
    \'coc-pyright'
    \]

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
nnoremap  <Leader><Leader> :<C-u>CocList<CR>
"スペースinfoでHover
nnoremap <silent> <Leader>if :<C-u>call CocAction('doHover')<CR>
"スペースdfでDefinition
nnoremap <silent> <Leader>df :call CocAction('jumpDefinition')<CR>
"スペースdcでDeclaration
nnoremap <silent> <Leader>dc :call CocAction('jumpDeclaration')<CR>
"スペースdcでType Declaration
nnoremap <silent> <Leader>dt :call CocAction('jumpTypeDeclaration')<CR>
"スペースrfでReferences
nnoremap <silent> <Leader>rf :call CocAction('jumpReferences')<CR>
"スペースrnでRename
nnoremap <Leader>rn <Plug>(coc-rename)
"スペースfmtでFormat
nnoremap <Leader>fmt :call CocAction('format')<CR>
" Coc-quick-fix
nnoremap <Leader>fx :call CocAction('doQuickfix')<CR>
