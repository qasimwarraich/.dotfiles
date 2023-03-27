vim.cmd("colorscheme kanagawa")

local highlight = function(highlight_group, opts)
	vim.api.nvim_set_hl(0, highlight_group, opts)
end

highlight("Normal", { bg = "none" })
highlight("NormalNC", { bg = "none" })
highlight("Pmenu", { bg = "none" })
highlight("Signcolumn", { bg = "none", fg = "gold" })
highlight("Linenr", { bg = "none", fg = "gold" })
highlight("TelescopeBorder", { bg = "none", fg = "gold" })
highlight("TelescopeTitle", { bg = "none", fg = "gold" })
highlight("TelescopePromptCounter", { bg = "none", fg = "gold" })
