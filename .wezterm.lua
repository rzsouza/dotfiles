local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local mux = wezterm.mux
wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true
config.font = wezterm.font("MesloLGS NF")

return config
