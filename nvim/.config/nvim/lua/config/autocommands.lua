local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanks
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
	end,
})
