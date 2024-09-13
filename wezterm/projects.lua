local wezterm = require 'wezterm'
local module = {}

-- The directory that contains all your projects.
local project_dir = wezterm.home_dir .. '/.projects'

local function project_dirs()
    -- Start with your home directory as a project
    local projects = { wezterm.home_dir }

    -- WezTerm comes with a glob function! Let's use it to get a lua table
    -- containing all subdirectories of your project folder.
    for _, dir in ipairs(wezterm.glob(project_dir .. '/*')) do
        -- ... and add them to the projects table.
        table.insert(projects, dir)
    end

    return projects
end

function module.choose_project()
    local choices = {}
    for _, value in ipairs(project_dirs()) do
        table.insert(choices, { label = value })
    end

    -- The InputSelector action presents a modal UI for choosing between a set of options
    -- within WezTerm.
    return wezterm.action.InputSelector {
        title = 'Projects',
        choices = choices,
        -- Enabling fuzzy searching
        fuzzy = true,
        action = wezterm.action_callback(function(child_window, child_pane, id, label)
            -- "label" may be empty if nothing was selected. Don't bother doing anything
            -- when that happens.
            if not label then return end

            child_window:perform_action(wezterm.action.SwitchToWorkspace {
                name = label:match("([^/]+)$"),
                spawn = { cwd = label },
            }, child_pane)
        end),
    }
end

return module
