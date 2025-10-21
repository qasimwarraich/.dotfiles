local attach = require("config.lsp_keymap").attach


local languages = require('efmls-configs.defaults').languages()
local web = {
	{
		formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
		formatStdin = true,
		lintCommand = "eslint --no-color --format unix --stdin",
		lintStdin = true,
		prefix = "eslint",
		lintFormats = { "<text>(%l,%c): %trror %m", "<text>(%l,%c): %tarning %m" },
		rootMarkers = {
			".eslintrc",
			".eslintrc.cjs",
			".eslintrc.js",
			".eslintrc.json",
			".eslintrc.yaml",
			".eslintrc.yml",
			"package.json",
		},
	},
}

local prettier = {
	{
		formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
		formatStdin = true,
	},
}

vim.lsp.config['efm'] = {
	init_options = { documentFormatting = true },
	on_attach = attach,
	filetypes = {
		"python",
		"cpp",
		"lua",
		"javascript",
		"typescript",
		"svelte",
		"json",
		"sh",
		"markdown",
        "html",
		"css",
	},
	settings = {
		rootMarkers = { ".git/" },
        languages = languages,
		-- languages = {
		-- 	lua = {
		-- 		{
		-- 			formatCommand = "stylua --color Never --search-parent-directories - ",
		-- 			formatStdin = true,
		-- 		},
		-- 	},
		-- 	python = {
		-- 		{
		-- 			formatCommand = "black --no-color -q  -",
		-- 			formatStdin = true,
		-- 			lintCommand = "flake8 -",
		-- 			lintStdin = true,
		-- 			prefix = "flake8",
		-- 			lintFormats = { "stdin:%l:%c: %t%n %m" },
		-- 			rootMarkers = { "setup.cfg", "tox.ini", ".flake8" },
		-- 		},
		-- 	},
		-- 	sh = {
		-- 		{
		-- 			formatCommand = "shfmt -",
		-- 			formatStdin = true,
		-- 			lintCommand = "shellcheck --color=never --format=gcc -",
		-- 			lintStdin = true,
		-- 			prefix = "shellcheck",
		-- 			lintFormats = {
		-- 				"-:%l:%c: %trror: %m",
		-- 				"-:%l:%c: %tarning: %m",
		-- 				"-:%l:%c: %tote: %m",
		-- 			},
		-- 		},
		-- 	},
		-- 	javascript = web,
		-- 	typescript = web,
		-- 	svelte = web,
		-- 	json = prettier,
  --           markdown = prettier,
		-- 	html = prettier,
		-- 	css = prettier,
		-- },
	},
}
