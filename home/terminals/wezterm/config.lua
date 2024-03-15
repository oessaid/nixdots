local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "zsh" }

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13.0
-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "Gruvbox dark, hard (base16)"
config.color_scheme = "GruvboxDarkHard"
config.check_for_updates = true
config.enable_wayland = true
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}
config.window_decorations = "RESIZE"

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

return config
