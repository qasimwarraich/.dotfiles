-- This file can be loaded by calling `lua require('plugins')` from your init.vim
function get_config(name) return string.format('require("config/%s")', name) end

function get_default(name) return string.format('require("%s").setup()', name) end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- LSP 
    use({"neovim/nvim-lspconfig", requires = {use "ray-x/go.nvim"}})
    use 'lervag/vimtex'

    -- CMP
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            {"tzachar/cmp-tabnine", run = "./install.sh"},
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-omni", "hrsh7th/cmp-calc", "hrsh7th/cmp-emoji",
            "L3MON4D3/LuaSnip", 'saadparwaiz1/cmp_luasnip',
            "rafamadriz/friendly-snippets", "f3fora/cmp-spell"
        },
        config = get_config("cmp")
    })

    -- Debugger
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "mfussenegger/nvim-dap-python"

    -- Formatter 
    use "sbdchd/neoformat"

    -- Colorscheme
    use "rebelot/kanagawa.nvim"

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        requires = {"p00f/nvim-ts-rainbow"},
        run = ":TSUpdate"
    })

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            "nvim-lua/plenary.nvim", 'nvim-treesitter/nvim-treesitter-context'
        }
    }

    -- Usefull Stuff
    use "mbbill/undotree"
    use "theprimeagen/harpoon"
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"
    use({
        "uga-rosa/ccc.nvim",
        branch = "0.7.2",
        config = require'ccc'.setup({highlighter = {auto_enable = true}})
    })
    use {"lewis6991/gitsigns.nvim", config = get_default("gitsigns")}
    use {"numToStr/Comment.nvim", config = get_config("Comment")}
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    })
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim'
    }
end)

