local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanks
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
	end,
})

-- Run gofmt + goimport on save
-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- Run Neoformat on svelte
vim.api.nvim_exec([[ autocmd BufWritePre *.svelte :Neoformat<CR>]], false)

-- Lsp Lightbulb
vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]])
