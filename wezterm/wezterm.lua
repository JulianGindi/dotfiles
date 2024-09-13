-- Import the wezterm module
local wezterm = require 'wezterm'
local appearance = require 'appearance'
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font({family = 'SF Mono'})
config.font_size = 16

-- Window styling
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'

-- Sets the font for the window frame (tab bar)
config.window_frame = {
  font = wezterm.font({ family = 'SF Mono', weight = 'Bold' }),
  font_size = 11,
}

wezterm.on('update-status', function(window, pane)
  -- Grab the utf8 character for the "powerline" left facing
  -- solid arrow.
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Grab the current window's configuration, and from it the
  -- palette (this is the combination of your chosen color scheme
  -- including and overrides).
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  -- Get the date and time
  local date = wezterm.strftime '%Y-%m-%d %H:%M'

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. date .. ' ' },
  }))
end)

-- Spawn a fish shell in login mode
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

-- Returns out config to be evaluated. We must always do this at the bottom of this file
return config
