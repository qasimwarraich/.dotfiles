local cmp = require("cmp")
local cmp_keymap = require("config.cmp_keymap")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
				["vim-dadbod-completion"] = "[DB]",
				cmp_tabnine = "[TN]",
			})[entry.source.name]

			-- TODO: Maybe check if tailwindserver is attached?
			if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
				tailwind = require("tailwindcss-colorizer-cmp").formatter
				vim_item = tailwind(entry, vim_item)
			end
			return vim_item
		end,
	},
	window = {},
	mapping = cmp_keymap.mapping,
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "cmp_tabnine" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer" },
	}),
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({ { name = "luasnip" }, { name = "cmp_git" } }, { { name = "buffer" } }),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})
