-- blink.cmp: 補完エンジン

return {
  "saghen/blink.cmp",
  dependencies = { "saghen/blink.lib" },
  opts = {
    keymap = { preset = "default" },
    fuzzy = { implementation = "lua" },
  },
}
