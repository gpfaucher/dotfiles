---
-- Treesitter
---
-- See :help nvim-treesitter-modules
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  sync_install = false,
  ignore_install = {},
  modules = {},
  auto_install = true,
  -- :help nvim-treesitter-textobjects-modules
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

require("kanagawa").setup({
  transparent = true,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  }
})
vim.cmd("colorscheme kanagawa")
