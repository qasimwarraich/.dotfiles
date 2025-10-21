local attach = require("config.lsp_keymap").attach

vim.lsp.config['denols'] = {
	on_attach = attach,
	root_dir = "deno.json",
}
