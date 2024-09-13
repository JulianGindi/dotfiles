-- Import the wezterm module
local wezterm = require 'wezterm'
local appearance = require 'appearance'

-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()
appearance.setup_main(config)

-- Events
wezterm.on('update-status', appearance.draw_right_status)

-- Spawn a fish shell in login mode
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

-- Returns out config to be evaluated. We must always do this at the bottom of this file
return config
