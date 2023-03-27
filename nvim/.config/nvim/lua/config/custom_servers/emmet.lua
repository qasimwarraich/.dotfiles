local lspconfig = require("lspconfig")
local attach = require("config.lsp_keymap").attach

lspconfig.emmet_ls.setup({
	on_attach = attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby", "svelte" },
})
