local lsp_keymap = require("config.lsp_keymap")

vim.g.rustaceanvim = {
	server = {
		on_attach = lsp_keymap.attach,
	},
}
