return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter", "NvChad/nvim-colorizer.lua" },
		config = function()
			require("colorizer").setup({})

			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				sync_install = false,
				ignore_install = { "dart" },
				modules = {},
				auto_install = true,
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
				ensure_installed = "all",
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
