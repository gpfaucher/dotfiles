return {
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{
		"phaazon/hop.nvim",
		event = "VimEnter",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})

			require("hop").setup({
				jump_on_sole_occurence = false,
			})

			vim.keymap.set("n", "hw", "<cmd>HopWord <cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "hc", "<cmd>HopChar2 <cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "hl", "<cmd>HopLine <cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "hp", "<cmd>HopPattern <cr>", { noremap = true, silent = true })
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
}
