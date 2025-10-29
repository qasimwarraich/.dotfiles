local attach = require("config.lsp_keymap").attach

vim.lsp.config['emmet_ls'] = {
	on_attach = attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby", "svelte" },
}

vim.lsp.enable('emmet_ls')
