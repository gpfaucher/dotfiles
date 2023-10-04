local keymap = vim.keymap.set
local global = vim.g
local options = { noremap = true, silent = true }

global.mapleader = " "

keymap("n", "<leader>e", "<cmd>NvimTreeToggle <cr>", options)

-- Telescope.nvim
keymap("n", "<leader>?", "<cmd>Telescope oldfiles theme=dropdown <cr>", options)
keymap("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown <cr>", options)
keymap("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown <cr>", options)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown <cr>", options)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown <cr>", options)
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics theme=dropdown <cr>", options)
keymap("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find theme=dropdown <cr>", options)

-- Escape
keymap("i", "jk", "<escape>", options)
