return {
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					haskell = {
						require("formatter.filetypes.haskell").stylish_haskell,
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
		end,
	},
}