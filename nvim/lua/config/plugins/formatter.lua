return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				clojure = { "cljfmt" },
			},
		})

		-- Create separate keybindings for normal and visual mode formatting
		-- Normal mode: format the entire file (respecting directory exclusions)
		vim.keymap.set("n", "<leader>f", function()
			-- Get the file path
			local filepath = vim.api.nvim_buf_get_name(0)

			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format entire file" })

		-- Visual mode: always format only the selected text (regardless of directory)
		vim.keymap.set("v", "<leader>f", function()
			-- Always format the selected range in visual mode
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
				-- Format only the selected range
				range = { vim.fn.getpos("'<"), vim.fn.getpos("'>") },
			})
		end, { desc = "Format selected text" })
	end,
}
