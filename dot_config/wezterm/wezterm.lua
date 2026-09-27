require("event")

return {
	keys = require("keybinds").keys,
	key_tables = require("keybinds").key_tables,
	leader = { key = "a", mods = "CTRL" },
	color_scheme = "MaterialDesignColors",
	font = require("wezterm").font_with_fallback({ "FiraCode Nerd Font", "Moralerspace Neon HWJPDOC" }),
}
