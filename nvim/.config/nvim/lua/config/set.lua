-- Numbering
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- Lines
vim.opt.wrap = false

-- Window
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.splitbelow = true
vim.opt.guicursor = ""
vim.opt.title = true
-- vim.opt.colorcolumn = "80"

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.incsearch = true
vim.opt.errorbells = false

-- List chars
vim.opt.list = false
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- Misc
vim.g.mapleader = " "
vim.opt.completeopt = {menu, menuone, noselect}
vim.opt.updatetime = 50
