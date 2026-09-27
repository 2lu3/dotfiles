return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fmt",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters = {
      ruff_format = {
        command = require("conform.util").find_executable({ ".venv/bin/ruff" }, "ruff"),
      },
    },
    formatters_by_ft = {
      python = { "ruff_format" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
    },
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}
