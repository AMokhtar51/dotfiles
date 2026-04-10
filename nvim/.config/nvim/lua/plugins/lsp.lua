return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
		"b0o/SchemaStore.nvim",
	},
	config = function()
		-- Mason setup
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"clangd",
				"cmake",
				"lua_ls",
				"stylua",
				"html",
				"cssls",
				"marksman",
				"pyright",
				"bashls",
				"jdtls",
			},
		})

		-- LSP capabilities (for cmp-nvim-lsp)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Server-specific configurations
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						telemetry = { enable = false },
					},
				},
				server_capabilities = { semanticTokensProvider = nil },
			},
			clangd = {},
			cmake = {},
			pyright = {},
			bashls = {},
			jdtls = {},
			html = {},
			cssls = {},
			marksman = {},
		}

		-- LSP attach function (keymaps + buffer setup)
		local on_attach = function(client, bufnr)
			local bufmap = function(mode, lhs, rhs, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, lhs, rhs, opts)
			end

			bufmap("n", "gd", vim.lsp.buf.definition)
			bufmap("n", "gD", vim.lsp.buf.declaration)
			bufmap("n", "gr", vim.lsp.buf.references)
			bufmap("n", "gT", vim.lsp.buf.type_definition)
			bufmap("n", "K", vim.lsp.buf.hover)
			bufmap("n", "<leader>rn", vim.lsp.buf.rename)
			bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
			bufmap("n", "<leader>wd", function()
				require("telescope.builtin").lsp_document_symbols()
			end)
			bufmap("n", "<leader>ww", function()
				require("telescope.builtin").diagnostics({ root_dir = true })
			end)

			vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

			-- Disable semantic tokens for Lua
			if client.name == "lua_ls" then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end

		-- Setup servers using the new API
		for name, config in pairs(servers) do
			config = config or {}
			config.capabilities = capabilities
			config.on_attach = on_attach

			-- Remove manual_install if present
			config.manual_install = nil

			-- New API for nvim-lspconfig 0.11+
			vim.lsp.config(name, config)
		end

		-- Setup lsp_lines.nvim
		require("lsp_lines").setup()
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
	end,
}
