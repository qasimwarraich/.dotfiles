local function get_default(name)
	return string.format('require("%s").setup()', name)
end

return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"vigoux/ltex-ls.nvim",
		},
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("config.custom_servers.go")
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false, -- This plugin is already lazy
	},

	-- CMP
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "tzachar/cmp-tabnine", build = "./install.sh" },
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-omni",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"f3fora/cmp-spell",
		},
	},
	"lervag/vimtex",

	-- Debugger
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"nvim-neotest/nvim-nio",
	"theHamsta/nvim-dap-virtual-text",
	"mfussenegger/nvim-dap-python",

	-- Formatter
	"sbdchd/neoformat",

	-- Colorscheme
	"rebelot/kanagawa.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		run = ":TSUpdate",
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
	},

	-- Testing
	"vim-test/vim-test",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
			"rouge8/neotest-rust",
			"haydenmeade/neotest-jest",
		},
	},

	-- Databases
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			{
				"kristijanhusak/vim-dadbod-completion",
				config = function()
					vim.cmd(
						[[autocmd FileType sql,mysql,plsql lua require("cmp").setup.buffer({sources = {{ name = "vim-dadbod-completion" }, { name = "buffer" },} })]]
					)
					vim.cmd([[let g:db_ui_use_nerd_fonts = 1 ]])
					vim.cmd([[let g:db_ui_win_position = "right" ]])
				end,
			},
		},
	},

	-- Usefull Stuff
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"mbbill/undotree",
	"theprimeagen/harpoon",
	"lukas-reineke/indent-blankline.nvim",
	{ "numToStr/Comment.nvim", config = get_default("Comment") },
	{ "kylechui/nvim-surround", config = get_default("nvim-surround") },
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"kosayoda/nvim-lightbulb",
		dependencies = "antoinemadec/FixCursorHold.nvim",
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc").setup({ highlighter = { auto_enable = true, lsp = true } })
		end,
	},
}
