local nmap = require('config.keymap').nmap
local nnoremap = require('config.keymap').nnoremap

nnoremap("<leader>dd", ":lua require'dap'.continue()<CR>")
nnoremap("<leader>dq", ":lua require'dap'.terminate()<CR>")
nmap("<leader>dl", ":lua require'dap'.step_into()<CR>")
nmap("<leader>dj", ":lua require'dap'.step_over()<CR>")
nmap("<leader>dk", ":lua require'dap'.step_out()<CR>")
nmap("<leader>dr", ":lua require'dap'.repl.open()<CR>")
nnoremap("<leader>d<space>", ":lua require('dapui').toggle()<CR>")
nmap("<leader>db", ":lua require'dap'.toggle_breakpoint()")
