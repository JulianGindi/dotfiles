return {
	"nvim-neorg/neorg",
	dependencies = { "luarocks.nvim" },
	-- put any other flags you wanted to pass to lazy here!
	cmd = "Neorg",
	ft = "norg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/Nextcloud/org/notes",
							other = "~/Nextcloud/org/other",
						},
						default_workspace = "notes",
					},
				},
			},
		})
	end,
}
