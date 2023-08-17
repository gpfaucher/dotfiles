local lazy = {}

vim.g.indent_blankline_filetype_exclude = 'help'

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print("Installing lazy.nvim....")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require("lazy").setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}

lazy.setup({
  -- Debugging
  'mfussenegger/nvim-dap',
  'pocco81/dap-buddy.nvim',
  'rcarriga/nvim-dap-ui',

  -- Theming
  "nvim-lualine/lualine.nvim",
  "rebelot/kanagawa.nvim",
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          project = { enable = false },
          mru = { limit = 5 },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim",              branch = "0.1.x" },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },

  -- Code manipulation
  { "nvim-treesitter/nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "numToStr/Comment.nvim" },
  { "tpope/vim-surround" },
  { "wellle/targets.vim" },
  { "tpope/vim-repeat" },

  -- Utilities
  { "moll/vim-bbye" },
  { "nvim-lua/plenary.nvim" },
  { "akinsho/toggleterm.nvim" },

  -- LSP support
  "neovim/nvim-lspconfig",
  "lukas-reineke/lsp-format.nvim",
  "onsails/lspkind.nvim",
  {
    "williamboman/mason.nvim",
    build = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  "MunifTanjim/prettier.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- UI
  'phaazon/hop.nvim',

  -- Modal Editing & Navigation
  "windwp/nvim-ts-autotag",
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" }
  },
  { "rafamadriz/friendly-snippets" },
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
})
