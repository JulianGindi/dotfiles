return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
  config = function()
    require("neo-tree").setup()

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>d", "<cmd>Neotree toggle<cr>")
  end
}
