vim.opt.clipboard:append("unnamedplus")

-- 常に絶対行番号を表示する
vim.opt.number = true

-- インデントのデフォルト（言語別に変えたい場合は ftplugin/<filetype>.lua で上書きする）
vim.opt.expandtab = true   -- タブの代わりにスペースを挿入
vim.opt.tabstop = 4        -- タブ文字の見た目の幅
vim.opt.shiftwidth = 4     -- インデント（<<, >>, autoindent）の幅
vim.opt.softtabstop = 4    -- <Tab>キーを押したときに実際に入る幅
