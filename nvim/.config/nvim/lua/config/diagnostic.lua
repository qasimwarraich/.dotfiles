vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	-- underline = true,
	severity_sort = true,
	float = {
		source = "always",
		focusable = false,
		header = "",
		prefix = "",
	},
})
