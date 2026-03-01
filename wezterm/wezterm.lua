-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.launch_menu = {
	{
		label = "WSL: Ubuntu",
		args = { "wsl.exe", "-d", "Ubuntu" },
	},
	{
		label = "Windows: Command Prompt",
		args = { "cmd.exe" },
	},
}

-- This is where you actually apply your config choices.

config.automatically_reload_config = true
-- config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
-- config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12.5
config.color_scheme = "Nord (Gogh)"
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.window_background_opacity = 0.95
config.background = {
	{
		source = {
			File = "/home/abdel/.config/wezterm/backgrounds/black_mountain.png",
		},
		opacity = 1.0,
	},
	{
		source = {
			Color = "#282c35",
		},
		width = "100%",
		height = "100%",
		opacity = 0.35,
	},
}
-- Finally, return the configuration to wezterm:
return config
