return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neodev.nvim", opts = {} },
		"hrsh7th/nvim-cmp", -- Re-add completion engine
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- Directories where LSP should be disabled (absolute paths)
		local disabled_lsp_directories = {
			-- Add your large C# repo paths here, example:
			"/Users/jgindi/perforce/workspace/jgindi_horde_macbook",
		}

		-- Function to check if current directory is within any disabled directory
		local function is_lsp_disabled()
			local cwd = vim.fn.getcwd()
			for _, disabled_dir in ipairs(disabled_lsp_directories) do
				if cwd:find("^" .. vim.pesc(disabled_dir)) then
					return true
				end
			end
			return false
		end

		-- Get capabilities from cmp_nvim_lsp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Global on_attach function
		local on_attach = function(client, bufnr)
			-- Nothing here yet...
		end

		-- Common setup options for all servers
		local setup_opts = function(extra_opts)
			extra_opts = extra_opts or {}
			local opts = {
				on_attach = on_attach,
				capabilities = capabilities,
			}
			return vim.tbl_deep_extend("force", opts, extra_opts)
		end

		-- Set up servers using a simplified pattern
		lspconfig.clojure_lsp.setup(setup_opts())
		lspconfig.fennel_language_server.setup(setup_opts())
		lspconfig.jsonls.setup(setup_opts())
		lspconfig.ast_grep.setup(setup_opts())
		lspconfig.pyright.setup(setup_opts())
		lspconfig.ts_ls.setup(setup_opts())
		lspconfig.rust_analyzer.setup(setup_opts())
		lspconfig.lua_ls.setup(setup_opts())

		-- C# Language Server Configuration
		if is_lsp_disabled() then
			-- Lightweight C# support using ast-grep for disabled directories
			-- ast_grep is already set up above and provides basic syntax support
			print("LSP disabled for this directory - using lightweight C# support")
		else
			-- Full OmniSharp configuration for enabled directories
			lspconfig.omnisharp.setup(setup_opts({
				cmd = { "dotnet", "/Users/jgindi/bin/omnisharp-osx-arm64-net6.0/OmniSharp.dll" },
				handlers = {
					["textDocument/definition"] = require("omnisharp_extended").handler,
				},
				settings = {
					FormattingOptions = { EnableEditorConfigSupport = true },
					RoslynExtensionsOptions = {
						EnableAnalyzersSupport = true,
						EnableImportCompletion = true,
					},
					SDK = { IncludePrereleases = true },
					EnableMsBuildLoadProjectsOnDemand = true,
					EnableImportCompletion = true,
					EnableRoslynAnalyzers = true,
					OrganizeImports = true,
					AnalyzeOpenDocumentsOnly = true,
				},
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern("*.sln", "*.csproj")(fname) or vim.fn.getcwd()
				end,
			}))
		end

		-- Setup completion options
		vim.opt.completeopt = "menu,menuone,noselect"

		-- Configure nvim-cmp
		local cmp = require("cmp")

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
