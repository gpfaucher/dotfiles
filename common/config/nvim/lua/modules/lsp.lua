return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"folke/neodev.nvim",
			"simrat39/rust-tools.nvim",
			"mrcjkb/haskell-tools.nvim",
			"pmizio/typescript-tools.nvim",
			{
				"nvimdev/lspsaga.nvim",
				event = "LspAttach",
				dependencies = {
					"nvim-treesitter/nvim-treesitter",
					"nvim-tree/nvim-web-devicons",
				},
			},
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason").setup({})
			mason_lspconfig.setup()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
				},
				lightbulb = {
					enable = false,
				},
				outline = {
					layout = "float",
				},
			})

			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
			vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
			vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<CR>", opts)
			vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
			vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
			vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = default_capabilities,
					})
				end,
				["rust_analyzer"] = function()
					require("rust-tools").setup({})
				end,
				["lua_ls"] = function()
					require("neodev").setup({
						pathStrict = true,
					})
				end,
				["tsserver"] = function()
					require("typescript-tools").setup({})
				end,
			})
		end,
	},
}
