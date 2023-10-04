require("core")

-- Install Lazy.vim if it doesn't exist
local lazy = {}
function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print("Installing lazy.nvim....")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      path,
    })
  end
end

function lazy.setup(plugins)
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require("lazy").setup(plugins, lazy.opts)
end

-- Read and configure all plugin configurations from lua/modules
lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {
  lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
}

lazy.setup({ import = "modules" })
