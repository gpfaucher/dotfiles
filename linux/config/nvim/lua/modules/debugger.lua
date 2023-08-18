local dap, dapui = require('dap'), require('dapui')
local adapters = dap.adapters
local configurations = dap.configurations

local keymap = vim.keymap.set
local options = { noremap = true, silent = true }

-- DAP UI Configuration
dapui.setup()
keymap('n', '<leader>od', dapui.open, options)
keymap('n', '<leader>cd', dapui.close, options)
keymap('n', '<leader>tb', dap.toggle_breakpoint, options)
keymap('n', '<leader>si', dap.step_into, options)
keymap('n', '<leader>so', dap.step_out, options)
keymap('n', '<leader>dc', dap.continue, options)

-- C# & .NET
adapters.coreclr = {
  type = 'executable',
  command = '/usr/bin/netcoredbg',
  args = { '--interpreter=vscode' }
}

configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  }
}

-- Rust, C & C++
adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}

configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:
configurations.c = configurations.cpp
configurations.rust = configurations.cpp

configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
