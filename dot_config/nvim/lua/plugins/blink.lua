-- blink.cmp: 補完エンジン

return {
    "saghen/blink.cmp",
    -- リリースタグを使うことでプリビルトのfuzzyライブラリが自動ダウンロードされる
    -- (mainブランチだとタグがなくダウンロードできず、cargoでのビルドが必要になる)
    version = "1.*",
    opts = {
        keymap = { preset = "default" },
    },
}
