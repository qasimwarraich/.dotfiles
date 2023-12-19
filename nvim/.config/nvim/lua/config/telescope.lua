require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
    file_ignore_patterns = {"node_modules", "bundle.js", "bundle.map.js"},
})
require("telescope").load_extension("ui-select")
