---------------------------------------
-- 見た目
---------------------------------------
vim.o.termguicolors = true -- True Color
vim.o.title = true -- ターミナルのタブ名に現在編集中のファイル名を設定
vim.o.number = true -- 行番号を表示する
vim.o.relativenumber = true -- 相対的な行番号
vim.o.wrap = true -- 行を折り返す
vim.o.showmatch = true -- 括弧入力時の対応する括弧を表示
vim.o.list = true --不可視文字の可視化
vim.o.listchars="tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲" -- デフォルト不可視文字は美しくないのでUnicodeできれいに
vim.o.matchtime=3 -- 対応括弧のハイライト表示を3sにする

---------------------------------------
-- 見た目検索・置換
---------------------------------------

vim.o.ignorecase = true -- 大文字小文字の区別なく検索する
vim.o.smartcase = true -- 検索文字列に大文字が含まれている場合は区別して検索する
vim.o.wrapscan = true -- 検索時に最後まで行ったら最初に戻る
vim.o.hlsearch = true -- 検索語をハイライト表示
vim.o.incsearch = true -- 検索文字列入力時に順次対象文字列にヒットさせる
vim.o.inccommand=split -- インタラクティブに変更

---------------------------------------
-- インデント
---------------------------------------
vim.o.smartindent = true -- オートインデント
vim.o.expandtab = true -- softtabstop や shiftwidth で設定されている値分のスペースが挿入されたときに、挿入されたスペース数が tabstop に達してもタブに変換されない
vim.o.tabstop=4 -- スペースn個分で1つのタブとしてカウントするか
vim.o.softtabstop=4 -- <tab>を押したとき、n個のスペースを挿入
vim.o.shiftwidth=4 -- <Enter>や<<, >>などを押したとき、n個のスペースを挿入

---------------------------------------
-- 補完
---------------------------------------
vim.o.wildmode="longest,list,full" -- リスト表示,最長マッチ
vim.o.infercase = true -- 補完時に大文字小文字を区別しない
vim.o.wildmenu = true --コマンドの補完を有効に

---------------------------------------
-- 操作
---------------------------------------
vim.o.clipboard="unnamedplus"-- クリップボードにコピーする
vim.o.backspace="indent,eol,start" -- backspaceで様々な文字を消せるようにした
vim.o.hidden = true
vim.o.textwidth=0 --自動改行する文字数

---------------------------------------
-- ログ
---------------------------------------
vim.o.history=5000 --保持するコマンド履歴の数
vim.o.swapfile = false -- swapファイルを保存しない
vim.o.undofile = false -- undoファイルを保存しない
vim.o.backup = false -- backupを保存しない
vim.o.writebackup = false --writebackupを保存しない
vim.o.viminfo= ""-- viminfoファイルに保存しない

---------------------------------------
-- その他
---------------------------------------
vim.o.encoding="utf-8" -- 文字コード
