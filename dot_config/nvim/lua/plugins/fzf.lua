return {
    "junegunn/fzf.vim",
    dependencies = {
        -- fzf#run() などの本体関数を提供する base プラグイン
        { "junegunn/fzf", build = "./install --bin" },
    },
}
