-- Additional spell suggestion
local function spell_suggest()
  require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({
    layout_config = {
      width = 0.3,
      height = 0.4,
    },
  }))
end

-- General Keyboard mappings
local keymap = vim.keymap

keymap.set("n", "<leader>m", "<cmd>Neorg index<cr>")
keymap.set("n", "<leader>1", "<cmd>Neorg journal today<cr>")

-- Tab creation and navigation
keymap.set("n", "<leader>t", "<cmd>:tabnew<cr>")

-- Clearning "highlights"
keymap.set("n", "<leader>/", "<cmd>:noh<cr>")

-- Map spell suggestion to a key
keymap.set('n', '<leader>z', spell_suggest, { desc = 'Spell suggestions' })
