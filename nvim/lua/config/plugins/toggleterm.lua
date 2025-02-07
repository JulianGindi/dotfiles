return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 10,
			open_mapping = [[<c-\>]],
			shading_factor = 2,
			direction = "horizontal",
		})
	end,
}
