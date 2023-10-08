require 'format'
require 'status'
require 'event'

return {
    keys = require("keybinds").keys,
    key_tables = require("keybinds").key_tables,
    leader = { key = "a", mods = "CTRL" },
    disable_default_key_bindings = true,
    color_scheme = 'Catppuccin Mocha',
    window_background_opacity = 0.9,
    font = require("wezterm").font("FiraCode Nerd Font"),
    font_size = 11.0,
    use_ime = true,
    ime_preedit_rendering = "Builtin",
    status_update_interval = 1000,
}
