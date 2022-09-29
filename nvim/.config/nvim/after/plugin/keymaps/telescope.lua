local nnoremap = require("config.keymap").nnoremap

nnoremap("<C-p>", ":Telescope <CR>")
nnoremap("<leader>s", ":Telescope find_files <CR>")
nnoremap("<leader>S", ":Telescope live_grep <CR>")

