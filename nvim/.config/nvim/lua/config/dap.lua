local nmap = require('config.keymap').nmap
local nnoremap = require('config.keymap').nnoremap
local dapui = require('dapui')

nnoremap("<leader>dd", ":lua require'dap'.continue()<CR>")
nnoremap("<leader>dq", ":lua require'dap'.terminate()<CR>")
nmap("<leader>dl", ":lua require'dap'.step_into()<CR>")
nmap("<leader>dj", ":lua require'dap'.step_over()<CR>")
nmap("<leader>dk", ":lua require'dap'.step_out()<CR>")
nmap("<leader>dr", ":lua require'dap'.repl.open()<CR>")
nnoremap("<leader>d<space>", ":lua require('dapui').toggle()<CR>")
nmap("<leader>db", ":lua require'dap'.toggle_breakpoint()")

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed
    name = "lldb"
}

local dap = require('dap')
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
                                'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

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
        runInTerminal = false
    }
}

-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {
        os.getenv('HOME') .. '/Clones/vscode-node-debug2/out/src/nodeDebug.js'
    }
}
dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal'
    }, {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require'dap.utils'.pick_process
    }
}

vim.fn.sign_define('DapBreakpoint',
                   {text = '🔴', texthl = '', linehl = '', numhl = ''})
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
