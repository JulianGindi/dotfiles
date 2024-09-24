local wezterm = require 'wezterm'

-- Define a local lua module table
local module = {}

local function setup_general_theme(config)
    -- (This is where our main config will go)
    config.color_scheme = 'Tokyo Night'
    config.font = wezterm.font({family = 'DM Mono'})
    config.font_size = 16
end

local function setup_window_theme(config)
    -- Window styling
    config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'

    -- Sets the font for the window frame (tab bar)
    config.window_frame = {
    font = wezterm.font({ family = 'SF Mono', weight = 'Bold' }),
    font_size = 11,
}
end

local function segments_for_right_status(window)
    return {
        window:active_workspace(),
        wezterm.strftime('%a %b %-d %H:%M'),
    }
end

-- Draw the right status bar
function module.draw_right_status(window, pane)
    -- Grab the utf8 character for the "powerline" left facing
    -- solid arrow.
    local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    local segments = segments_for_right_status(window)

    -- Grab the current window's configuration, and from it the
    -- palette (this is the combination of your chosen color scheme
    -- including and overrides).
    local color_scheme = window:effective_config().resolved_palette
    local bg = wezterm.color.parse(color_scheme.background)
    local fg = color_scheme.foreground

    -- Each powerline segment is going to be coloured progressively
    -- darker/lighter depending on whether we're on a dark/light colour
    -- scheme. Let's establish the "from" and "to" bounds of our gradient.
    local gradient_to, gradient_from = bg
    gradient_from = gradient_to:lighten(0.2)

    local gradient = wezterm.color.gradient(
        {
            orientation = 'Horizontal',
            colors = { gradient_from, gradient_to },
        },
        #segments -- only gives us as many colours as we have segments.
    )

    -- We'll build up the elements to send to wezterm.format in this table.
    local elements = {}

    for i, seg in ipairs(segments) do
        local is_first = i == 1
    
        if is_first then
          table.insert(elements, { Background = { Color = 'none' } })
        end
        table.insert(elements, { Foreground = { Color = gradient[i] } })
        table.insert(elements, { Text = SOLID_LEFT_ARROW })
    
        table.insert(elements, { Foreground = { Color = fg } })
        table.insert(elements, { Background = { Color = gradient[i] } })
        table.insert(elements, { Text = ' ' .. seg .. ' ' })
    end

    window:set_right_status(wezterm.format(elements))
end

-- Set up the main terminal appearance
function module.setup_main(config)
    setup_general_theme(config)
    setup_window_theme(config)
end

return module
