return {
  'yuki-yano/fzf-preview.vim',
  branch = 'release/remote',
  -- fzf#run() を提供する junegunn/fzf 本体が必要
  dependencies = { 'junegunn/fzf' },
  build = function()
    -- Remote plugin を登録
    vim.cmd('UpdateRemotePlugins')
  end,
  -- リモートプラグインのコマンドはlazy.nvimの遅延ロードと噛み合わず
  -- autoload関数が見つからないエラーになるため、起動時に読み込む
  lazy = false,
  keys = {
    { "<leader>fp", "<Cmd>FzfPreviewDirectoryFiles<CR>", desc = "Fzf preview directory files" },
  },
}
