return {
	{
		"Olical/conjure",
		ft = { "clojure", "fennel", "racket" },
		lazy = true,
		init = function()
			vim.g["conjure#client#fennel#aniseed#deprecation_warning"] = false
		end,
	},
}
