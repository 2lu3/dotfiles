lua << EOF
require("telescope").setup{
    extensions = {
        frequency = {
        }
    }
}
EOF

" Find files using Telescope command-line sugar.
" ファイル一覧を探す
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" 隠されたファイルもすべて開く
nnoremap <leader>fa <cmd>Telescope find_files hidden=true no_ignore=true no_ignore_parent=true<cr>
" よく開く別ディレクトリのファイルも開く
nnoremap <leader>fo <cmd>Telescope frequency<cr>
" grepする
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" 開いているバッファの中から探す
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" helpを開く
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" 閉じる: <C-x>
" j/k/H/M/L/Tab/S-Tab/gg/G あたりは使える

" Using Lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
