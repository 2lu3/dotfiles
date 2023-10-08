local wezterm = require 'wezterm';

wezterm.on("new_tab_working_directory", function(window, pane)
    return window:active_tab():current_directory()
end)
