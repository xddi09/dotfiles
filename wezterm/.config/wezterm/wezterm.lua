-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font_size = 14
config.font = wezterm.font("SauceCodePro Nerd Font Mono")
config.color_scheme = "Tokyo Night Moon"

-- config.default_prog = { "/bin/tmux", "-u" }

config.initial_rows = 32
config.initial_cols = 122

config.enable_tab_bar = false
config.enable_scroll_bar = false

config.front_end = "WebGpu"
config.max_fps = 200
config.animation_fps = 100

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.enable_wayland = false -- Uncomment for WezTerm support on Hyprland.

config.window_padding = {
  top = 3,
  bottom = 3,
  left = 9,
  right = 9,
}

config.keys = {
  {
    key = "n",
    mods = "SHIFT|CTRL",
    action = wezterm.action.ToggleFullScreen,
  },
}

-- and finally, return the configuration to wezterm
return config
