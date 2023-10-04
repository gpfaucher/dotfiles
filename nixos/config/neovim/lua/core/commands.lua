local create_group = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local user_cmds_group = create_group("user_cmds", { clear = true })
local lsp_format_group = create_group("user_cmds", { clear = true })

-- Highlight when yanking
create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = user_cmds_group,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- Quit out of help buffers easily
create_autocmd("FileType", {
	pattern = { "help", "man" },
	group = user_cmds_group,
	command = "nnoremap <buffer> q <cmd>quit<cr>",
})

create_autocmd("BufWritePost", {
	command = "FormatWrite",
})
