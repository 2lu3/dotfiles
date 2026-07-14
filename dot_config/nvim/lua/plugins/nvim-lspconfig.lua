-- nvim-lspconfig: LSPサーバーのcapabilities連携とキーマップ設定
-- サーバーの起動自体は mason-lspconfig.lua の automatic_enable に任せる
-- サーバーを増やすときは mason-lspconfig.lua の ensure_installed に追加するだけでよい

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    -- blink.cmpの補完機能をLSPサーバーに知らせる
    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   callback = function(args)
    --     local opts = { buffer = args.buf }
    --     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    --     vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    --     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    --     vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    --     vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    --   end,
    -- })
  end,
}
