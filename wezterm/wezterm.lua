-- Import the wezterm module
local wezterm = require("wezterm")
local appearance = require("appearance")
local keyboard = require("keyboard")

local os_name = wezterm.target_triple

-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()
appearance.setup_main(config)

-- Setup keyboard shortcuts
keyboard.setup_keys(config)

-- Events
wezterm.on("update-status", appearance.draw_right_status)

-- Spawn a fish shell in login mode: TODO: probably dont need this with cachy
if os_name:find("darwin") then
	config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
end

-- Returns out config to be evaluated. We must always do this at the bottom of this file
return config
