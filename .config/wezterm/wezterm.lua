local wezterm = require("wezterm")
local config = wezterm.config_builder()

--config.color_scheme = 'Jellybeans (Gogh)'
--config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 14

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

return config
