vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
	end,
})

return {
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							telemetry = { enable = false },
							diagnostics = {
								globals = { "vim", "require", "pcall", "pairs" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Replace",
							},
							hint = {
								enable = true,
							},
							format = {
								enable = false,
							},
						},
					},
				},
			},
		},
		dependencies = {
			{ "folke/neodev.nvim" },
			{ "hrsh7th/cmp-nvim-lsp", opts = {} },
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"williamboman/mason.nvim",
				config = function(_, opts)
					require("mason").setup(opts)
				end,
			},
		},
		config = function(_, opts)
			local servers = opts.servers
			local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				has_cmp and cmp_nvim_lsp.default_capabilities() or {},
				opts.capabilities or require("cmp_nvim_lsp").default_capabilities()
			)

			-- Main setup call
			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities or {}),
				}, servers[server] or {})
				server_opts.flags = { debounce_text_changes = 150 }
				require("lspconfig")[server].setup(server_opts)
			end

			local has_mason, mason_lsp = pcall(require, "mason-lspconfig")
			local mason_servers = {}
			if has_mason then
				mason_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
			end

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- Run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(mason_servers, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end
			if has_mason then
				mason_lsp.setup({
					ensure_installed = ensure_installed,
					handlers = { setup },
					automatic_installation = true,
				})
			end
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
				dependencies = {
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
						require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets/" } })
					end,
				},
				opts = {
					history = true,
					delete_check_events = "TextChanged",
				},
			},
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			local cmp = require("cmp")

			local cmp_config = {
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
				mapping = {
					-- confirm selection
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					-- cancel completion
					["<C-e>"] = cmp.mapping.abort(),

					-- navigate items on the list
					["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
					["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),

					-- if completion menu is visible, go to the previous item
					-- else, trigger completion menu
					["<S-Tab>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item({ behavior = "insert" })
						else
							cmp.complete()
						end
					end),

					-- if completion menu is visible, go to the next item
					-- else, trigger completion menu
					["<Tab>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_next_item({ behavior = "insert" })
						else
							cmp.complete()
						end
					end),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			}

			cmp.setup(cmp_config)
		end,
	},

	-- { "rafamadriz/friendly-snippets" },

	-- Rust Support
	"simrat39/rust-tools.nvim",
	ft = "rust",

	-- Debugging
	{ "mfussenegger/nvim-dap" },
}
