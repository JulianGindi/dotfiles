local global = vim.g
local o = vim.opt

-- General config
o.number = true -- Line numbers
o.relativenumber = false -- Relative line numbers
o.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank
o.cursorline = true -- Highlight the screen line of the cursor with CursorLine
o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
o.title = true -- When on, the title of the window will be set to the value of 'titlestring'
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one
o.ignorecase = true -- Ignoring case when searching

-- General Keyboard mappings
local keymap = vim.keymap
keymap.set("n", "<leader>m", "<cmd>Neorg index<cr>")
keymap.set("n", "<leader>1", "<cmd>Neorg journal today<cr>")

-- Tab creation and navigation
keymap.set("n", "<leader>t", "<cmd>:tabnew<cr>")

-- Clearning "highlights"
keymap.set("n", "<leader>/", "<cmd>:noh<cr>")
