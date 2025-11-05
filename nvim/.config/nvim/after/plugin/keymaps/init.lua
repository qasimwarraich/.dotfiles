-- Netrw
vim.keymap.set("n", "<leader>e", ":Ex<CR>")

-- Neoformat
vim.keymap.set("n", "<leader>F", ":Neoformat<CR>")

-- Nolist
vim.keymap.set("n", "<F8>", ":set nolist!<CR>")

-- Markdown Preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")

-- Register handling
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("x", "<leader>P", [["_d"+p]])

vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])

-- Moving lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remove search highlighting
vim.keymap.set("n", "<esc><esc>", ":noh<return>")

-- Close window
vim.keymap.set("n", "<leader>x", "<C-w>q")

-- Better c+d/u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search and repace under cursor
vim.keymap.set("n", "<leader>/", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Term 
vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]])
