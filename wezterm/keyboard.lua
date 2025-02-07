local wezterm = require("wezterm")
local projects = require("projects")

-- Define a local lua module table
local module = {}

local function move_pane(key, direction)
	return {
		key = key,
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection(direction),
	}
end

function module.setup_keys(config)
	-- Set up our leader key first to CTRL + a
	config.leader = {
		key = "a",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	}

	-- Define our keybindings
	config.keys = {
		-- Creating a tab
		{
			key = "c",
			mods = "LEADER",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		-- Moving through tabs
		{
			key = "n",
			mods = "LEADER",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		{
			key = "b",
			mods = "LEADER",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		},
		-- Split pane horizontally
		{
			key = '"',
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({
				domain = "CurrentPaneDomain",
			}),
		}, -- Split pane vertically
		{
			key = "%",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({
				domain = "CurrentPaneDomain",
			}),
		},
		-- setting up the keybindings for moving panes
		move_pane("j", "Down"),
		move_pane("k", "Up"),
		move_pane("h", "Left"),
		move_pane("l", "Right"),
		-- Moving through projects
		{
			key = "p",
			mods = "LEADER",
			action = projects.choose_project(),
		},
		{
			key = "f",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},
		-- Passing LEADER to the terminal if called twice
		{
			key = "a",
			-- When we're in leader mode _and_ CTRL + A is pressed...
			mods = "LEADER|CTRL",
			-- Actually send CTRL + A key to the terminal
			action = wezterm.action.SendKey({
				key = "a",
				mods = "CTRL",
			}),
		},
	}
end

return module
