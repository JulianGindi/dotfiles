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

		-- Common config options
		local base_config = {
			capabilities = capabilities,
		}

		-- Helper function to merge configs
		local function make_config(extra)
			return vim.tbl_deep_extend("force", base_config, extra or {})
		end

		-- Set up servers using new API
		vim.lsp.config('clojure_lsp', make_config())
		vim.lsp.config('fennel_language_server', make_config())
		vim.lsp.config('jsonls', make_config())
		vim.lsp.config('ast_grep', make_config())
		vim.lsp.config('ts_ls', make_config())
		vim.lsp.config('rust_analyzer', make_config())
		vim.lsp.config('lua_ls', make_config())
		vim.lsp.config('clangd', make_config())

		-- Ruff/Python stuff
		vim.lsp.config('ruff', make_config())

		-- Custom ty configuration
		vim.lsp.config('ty', make_config({
			cmd = { 'uvx', 'ty', 'server' },
			filetypes = { 'python' },
			root_dir = function(fname)
				return vim.fs.root(fname, { 'pyproject.toml', 'setup.py', '.git' })
			end,
			settings = {
				-- ty language server settings go here
			},
		}))

		-- C# Language Server Configuration
		if is_lsp_disabled() then
			-- Lightweight C# support using ast-grep for disabled directories
			print("LSP disabled for this directory - using lightweight C# support")
		else
			-- Full OmniSharp configuration for enabled directories
			vim.lsp.config('omnisharp', make_config({
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
					return vim.fs.root(fname, { '*.sln', '*.csproj' }) or vim.fn.getcwd()
				end,
			}))
			vim.lsp.enable('omnisharp')
		end

		-- Enable all the configured servers
		vim.lsp.enable('clojure_lsp')
		vim.lsp.enable('fennel_language_server')
		vim.lsp.enable('jsonls')
		vim.lsp.enable('ast_grep')
		vim.lsp.enable('ts_ls')
		vim.lsp.enable('rust_analyzer')
		vim.lsp.enable('lua_ls')
		vim.lsp.enable('clangd')
		vim.lsp.enable('ruff')
		vim.lsp.enable('ty')
		vim.lsp.enable('lexical')

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
