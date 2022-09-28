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

    use({
        "hrsh7th/nvim-cmp",
        requires = {
            {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-nvim-lua"},
            {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-omni"}, {"L3MON4D3/LuaSnip"},
            {"tzachar/cmp-tabnine", run = "./install.sh"},
            {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}}
        },
        config = get_config("cmp")
    })

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
        requires = {{"nvim-lua/plenary.nvim"}}
    }

    -- Usefull Stuff
    use "tpope/vim-surround"
    use "theprimeagen/harpoon"
    use "tpope/vim-fugitive"
    use {"lewis6991/gitsigns.nvim", config = get_default("gitsigns")}
    use {"numToStr/Comment.nvim", config = get_config("Comment")}
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    })
    
end)

