return {
  "stevearc/conform.nvim",
  config = function ()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = {"isort", "black"}
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
    })
  end
}

		-- "mhartington/formatter.nvim",
		-- config = function()
		-- 	require("formatter").setup({
		-- 		logging = true,
		-- 		log_level = vim.log.levels.WARN,
		-- 		filetype = {
		-- 			lua = {
		-- 				require("formatter.filetypes.lua").stylua,
		-- 			},
		-- 			haskell = {
		-- 				require("formatter.filetypes.haskell").stylish_haskell,
		-- 			},
		-- 			["*"] = {
		-- 				require("formatter.filetypes.any").remove_trailing_whitespace,
		-- 			},
		-- 		},
		-- 	})
		-- end,
