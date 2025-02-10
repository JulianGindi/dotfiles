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
				["core.summary"] = {},
				["core.concealer"] = {},
				["core.itero"] = {
					config = {
						retain_extensions = {
							["ordered_list%d"] = true,
							["unordered_list%d"] = true,
						},
					},
				},
				["core.keybinds"] = {
					config = {
						hook = function(keybinds)
							keybinds.remap_event("norg", "i", "<C-CR>", "core.itero.next-iteration")
						end,
					},
				},
				["core.esupports.metagen"] = { config = { author = "Julian Gindi", type = "auto", update_date = true } },
				["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
				["core.integrations.nvim-cmp"] = {},
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
