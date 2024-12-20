local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true
config.font = wezterm.font("MesloLGS NF")

return config
