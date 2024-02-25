local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	local ok, defaultConfig = pcall(wezterm.config_builder)
	if ok then
		config = defaultConfig -- Use the defaults as a base
	end
end

config.font_size = 14
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 2,
	bottom = 0,
}

config.color_scheme = "Catppuccin Mocha"
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.max_fps = 144
config.audible_bell = "Disabled"

-- experiment, requires terminfo installation
-- tempfile=$(mktemp) \
--   && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo \
--   && tic -x -o ~/.terminfo $tempfile \
--   && rm $tempfile
-- config.term                         = 'wezterm'

-- make task numbers clickable
-- the first matched regex group is captured in $1.
table.insert(config.hyperlink_rules, {
	regex = [[\b[tt](\d+)\b]],
	format = "https://example.com/tasks/?t=$1",
})

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{2}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

config.keys = {
	{ key = "f", mods = "CMD", action = act.ToggleFullScreen },
	{ key = "n", mods = "CMD", action = act.SpawnWindow },
	{ key = "p", mods = "CMD", action = act.ActivateCommandPalette },
	{ key = "t", mods = "SHIFT|ALT", action = act.SpawnTab("DefaultDomain") },
	{ key = "Super", action = act.SendKey({ key = "1" }) },
	-- {
	--     key = 'CMD',
	--     action = wezterm.action.SendKey { key = 'a' },
	-- },
}

return config
