-- local telescope = require("telescope.builtin")
local keymap = vim.keymap.set
local global = vim.g
local options = { noremap = true, silent = true }


-- Set global leader key to Space
global.mapleader = " "
---
-- Telescope
---
keymap('n', '<leader>?', '<cmd>Telescope oldfiles theme=dropdown <cr>', options)
keymap('n', '<leader><space>', '<cmd>Telescope buffers theme=dropdown <cr>', options)
keymap('n', '<leader>ff', '<cmd>Telescope find_files theme=dropdown <cr>', options)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep theme=dropdown <cr>', options)
keymap('n', '<leader>fd', '<cmd>Telescope diagnostics theme=dropdown <cr>', options)
keymap('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find theme=dropdown <cr>', options)
keymap('n', '<leader>fb', '<cmd>Telescope file_browser theme=dropdown <cr>', options)

-- require('telescope').load_extension('fzf')

-- -- LSP Saga
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", options)
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", options)
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", options)
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>", options)
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", options)
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", options)
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", options)
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", options)
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", options)
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", options)
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", options)
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", options)
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", options)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", options)
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", options)
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", options)
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", options)

keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", options)
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", options)
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", options)

-- Commands
keymap('n', '<leader>w', '<cmd>write<cr>', options)
keymap('n', '<leader>bq', '<cmd>bdelete<cr>', options)
keymap('n', '<leader>bl', '<cmd>buffer #<cr>', options)


-- Escape
keymap('i', 'jk', '<escape>', options)
