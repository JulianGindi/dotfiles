local mod = {}

-- Function to get and print current working directory
function mod.print_cwd()
	local cwd = vim.fn.getcwd()
	print("Current working directory: " .. cwd)
end

local function setup_keybinding()
	vim.keymap.set("n", "<localleader>m", mod.print_cwd, {
		desc = "Print current working directory",
		noremap = true,
		silent = true,
	})
end

function mod.setup()
	setup_keybinding()
end

-- Auto-setup when the module is loaded
mod.setup()

return mod
