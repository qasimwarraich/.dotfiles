local highlight = function(highlight_group, opts)
	vim.api.nvim_set_hl(0, highlight_group, opts)
end

function ColourScheme(theme)
	theme = theme or "kanagawa"
	vim.cmd.colorscheme(theme)

	highlight("Normal", { bg = "none" })
	highlight("NormalFloat", { bg = "none" })
	highlight("NormalNC", { bg = "none" })
	highlight("Signcolumn", { bg = "none", fg = "gold" })
	highlight("Linenr", { bg = "none", fg = "gold" })
	highlight("Pmenu", { bg = "none" })
	highlight("TelescopeBorder", { bg = "none", fg = "gold" })
	highlight("TelescopeTitle", { bg = "none", fg = "gold" })
	highlight("TelescopePromptCounter", { bg = "none", fg = "gold" })
	highlight("ColorColumn", { bg = "#2a273f" })
	highlight("StatusLine", { bg = "#2a273f" })
	highlight("StatusLineNC", { bg = "#2a273f" })
end

ColourScheme()
