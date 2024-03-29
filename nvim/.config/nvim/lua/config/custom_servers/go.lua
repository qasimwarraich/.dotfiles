local attach = require("config.lsp_keymap").attach

require("go").setup({
	goimport = "gopls", -- if set to 'gopls' will use golsp format
	gofmt = "gofumpt", -- if set to gopls will use golsp format
	max_line_len = 120,
	tag_transform = false,
	test_dir = "",
	comment_placeholder = "   ",
	lsp_cfg = true, -- false: use your own lspconfig
	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = attach, -- use on_attach from go.nvim
	test_runner = "go",
	dap_debug = true,
	dap_debug_keymap = false,
	run_in_floaterm = true,
	lsp_inlay_hints = {
        enable = true,
		style = 'eol',
	},
})

-- require('dap-go').setup()
