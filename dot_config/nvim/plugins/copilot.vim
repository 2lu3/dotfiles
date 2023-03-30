let g:copilot_no_tab_map = v:true

inoremap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
inoremap <silent> <M-j> <Plug>(copilot-next)
inoremap <silent> <M-k> <Plug>(copilot-previous)
nnoremap <silent> <M-h> :vertical belowright Copilot panel<CR>
inoremap <silent> <M-h> <Esc>:vertical belowright Copilot panel<CR>

let g:copilot_popup_delay = 0
