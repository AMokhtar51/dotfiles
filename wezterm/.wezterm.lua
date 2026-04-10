-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_domain = "WSL:Ubuntu"
config.default_prog = { "wsl.exe", "~", "-e", "bash", "-l" }

-- This is where you actually apply your config choices.

config.automatically_reload_config = true
-- config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
-- config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.enable_kitty_graphics = true

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12.5
config.color_scheme = "Tokyo Night"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.window_background_opacity = 1
--[[
config.background = { 
	{ 
		source = { File = "C:/Users/abdel/black_mountain.png", }, 
	    opacity = 1.0,
	}, 
	{ 
		source = { Color = "#282c35", },
		width = "100%",
		height = "100%",
		opacity = 0.35,
	},
}
--]]
-- Finally, return the configuration to wezterm:
return config
