

---
-- Comment.nvim
---
require('Comment').setup({})
--
---
-- Indent-blankline
---
-- See :help indent-blankline-setup
require('indent_blankline').setup({
    char = '▏',
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    use_treesitter = true,
    show_current_context = false
})
--
---
-- Gitsigns
---
-- See :help gitsigns-usage
require('gitsigns').setup({
    signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '➤' },
        topdelete = { text = '➤' },
        changedelete = { text = '▎' },
    }
})
