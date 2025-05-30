local mod = {}

local notes_dir = "/Users/jgindi/Desktop/temp_notes/"

local function new_note(name)
	local note_template = { "# Note -- " .. name }
	local note_file = notes_dir .. name .. ".minos"
	vim.fn.writefile(note_template, note_file)
end

local function create_index_file()
	local index_template = { "# Minos Notes Index" }
	local index_file = notes_dir .. "index.minos"
	if vim.fn.filereadable(index_file) == 0 then
		vim.fn.writefile(index_template, index_file)
	end
end

local function create_note_mapping(note_name)
	return function()
		new_note(note_name)
	end
end

local function get_notes_from_dir(notes_dir)
	local dir_entries = vim.fn.readdir(notes_dir)
	for _, file in ipairs(dir_entries) do
		-- print("File: " .. file)
	end
end

local function setup_keybinding()
	vim.keymap.set("n", "<localleader>m", create_note_mapping("test"), {
		desc = "Create a new Minos note",
		noremap = true,
		silent = true,
	})
end

local function test_ui()
	-- :h prompt-buffer
end

function mod.setup()
	-- First registering `.minos` note files as Markdown files
	vim.filetype.add({
		extension = {
			minos = "markdown",
		},
	})

	get_notes_from_dir(notes_dir)
	setup_keybinding()
	create_index_file()
end

-- Auto-setup when the module is loaded
mod.setup()

return mod
