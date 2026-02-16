return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = true,
  ---@module 'neo-tree'
  ---@type neotree.Config

  keys = {
    {
      "<leader>e",
      "<Cmd>Neotree toggle<CR>",
      desc = "Neo-tree",
    },
  },
  opts = {
    close_if_last_window = false, 
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      mappings = {
        ["l"] = "open",       -- フォルダ: 展開 / ファイル: 開く
        ["h"] = "close_node", -- フォルダ: 閉じる
      },
    },
  }
}
