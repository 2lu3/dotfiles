local wezterm = require 'wezterm';

wezterm.on("new_tab_working_directory", function(window, pane)
    return window:active_tab():current_directory()
end)

wezterm.on('bell', function(window, pane)
  window:toast_notification('Claude Code', 'Task completed', nil, 4000)
end)

return {
  audible_bell = 'SystemBeep',  -- 音も鳴らす場合
}
