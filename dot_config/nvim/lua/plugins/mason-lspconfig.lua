-- mason-lspconfig.nvim: LSPサーバー名とmasonパッケージの橋渡し
-- 言語を増やすときは ensure_installed に サーバー名 を追加していく

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = { "mason-org/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "ts_ls",
      },
      -- ensure_installedのサーバーを自動でvim.lsp.enable()する（デフォルトtrue）
      automatic_enable = true,
    })
  end,
}
