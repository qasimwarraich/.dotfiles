local Remap = require("config.keymap")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Netrw
nnoremap("<leader>e", ":Ex<CR>")

-- Neoformat
nnoremap("<leader>F", ":Neoformat<CR>")

-- Nolist
nnoremap("<leader>F", ":Neoformat<CR>")

-- Markdown Preview
nnoremap("<F8>", ":set nolist!<CR>")

-- Register handling
xnoremap("<leader>p", "\"_dP")

nnoremap("<leader>p", "\"+p")
nmap("<leader>P", "\"+P")

nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- Moving lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Remove search highlighting
nnoremap("<esc><esc>", ":noh<return>")

-- Close window
nmap("<leader>x", "<C-w>q")
