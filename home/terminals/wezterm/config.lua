local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0
config.color_scheme = "Gruvbox Material (Gogh)"
config.check_for_updates = true
config.enable_wayland = true
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

-- config.front_end = "WebGpu"
-- config.webgpu_power_preference = "HighPerformance"

return config
