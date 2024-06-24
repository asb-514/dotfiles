local wezterm = require 'wezterm'
local config = {}
--config.color_scheme = 'Jellybeans (Gogh)'
config.font = wezterm.font ('CodeNewRoman Nerd Font', {weight = 'Bold'})
config.font_size = 15
--config.color_scheme = "Catppuccin Latte" -- or Macchiato, Frappe, Latte
hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.3
config.macos_window_background_blur = 20

return config
