local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({higroup = 'IncSearch', timeout = 40})
    end
})

-- Run gofmt + goimport on save
vim.api.nvim_exec(
    [[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]],
    false)
-- Run Neoformat on svelte
vim.api.nvim_exec([[ autocmd BufWritePre *.svelte :Neoformat<CR>]], false)

vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'packer.lua',
    command = 'source <afile> | PackerCompile',
})
