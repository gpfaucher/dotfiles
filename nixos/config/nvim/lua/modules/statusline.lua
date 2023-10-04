return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine = require("lualine")
      vim.opt.showmode = false

      lualine.setup({
        options = {
          theme = 'auto',
          icons_enabled = true,
          component_separators = '|',
          section_separators = '',
          disabled_filetypes = {
            statusline = { 'NvimTree' },
          },
        },
      })
    end
  },
}
