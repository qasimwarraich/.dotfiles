function get_config(name)
	return string.format('require("config/%s")', name)
end

function get_default(name)
	return string.format('require("%s").setup()', name)
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return {

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"lervag/vimtex",
			"ray-x/go.nvim",
			"simrat39/rust-tools.nvim",
		},
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
		config = get_config("cmp"),
	},
	"vigoux/ltex-ls.nvim",
	-- Debugger
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
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
			"p00f/nvim-ts-rainbow",
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
	"mbbill/undotree",
	"theprimeagen/harpoon",
	{ "kylechui/nvim-surround", config = get_default("nvim-surround") },
	"tpope/vim-fugitive",
	"lukas-reineke/indent-blankline.nvim",
	{ "lewis6991/gitsigns.nvim", config = get_default("gitsigns") },
	{ "numToStr/Comment.nvim", config = get_default("Comment") },
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
		-- optionally, override the default options:
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
