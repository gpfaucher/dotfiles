local keymap = vim.keymap.set
local options = { noremap = true, silent = true }
local hop = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup {
  jump_on_sole_occurrence = false,
}

keymap('n', 'hw', '<cmd>HopWord <cr>', options)
keymap('n', 'hc', '<cmd>HopChar2 <cr>', options)
keymap('n', 'hl', '<cmd>HopLine <cr>', options)
keymap('n', 'hp', '<cmd>HopPattern <cr>', options)
