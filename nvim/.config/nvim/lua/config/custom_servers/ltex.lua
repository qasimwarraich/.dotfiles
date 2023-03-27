local attach = require("config.lsp_keymap").attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("ltex-ls").setup({
	on_attach = attach,
	capabilities = capabilities,
	use_spellfile = false,
	filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
	settings = {
		ltex = {
			enabled = { "latex", "tex", "bib", "markdown" },
			language = "en-GB",
			diagnosticSeverity = "information",
			sentenceCacheSize = 2000,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en",
			},
			disabledRules = {},
			dictionary = (function()
				-- For dictionary, search for files in the runtime to have
				-- and include them as externals the format for them is
				-- dict/{LANG}.txt
				--
				-- Also add dict/default.txt to all of them
				local files = {}
				for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
					local lang = vim.fn.fnamemodify(file, ":t:r")
					local fullpath = vim.fs.normalize(file, ":p")
					files[lang] = { ":" .. fullpath }
				end

				if files.default then
					for lang, _ in pairs(files) do
						if lang ~= "default" then
							vim.list_extend(files[lang], files.default)
						end
					end
					files.default = nil
				end
				return files
			end)(),
		},
	},
})
