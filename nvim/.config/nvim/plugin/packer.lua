function get_config(name) return string.format('require("config/%s")', name) end
function get_default(name) return string.format('require("%s").setup()', name) end

vim.cmd [[packadd packer.nvim]] -- Only required if you have packer configured as `opt`

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
        requires = {
            "p00f/nvim-ts-rainbow", "nvim-treesitter/nvim-treesitter-context"
        },
        run = ":TSUpdate"
    })

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim"
        }
    }

    -- Testing
    use("vim-test/vim-test")
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim", "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python", "rouge8/neotest-rust",
            "haydenmeade/neotest-jest"
        }
    }

    -- Databases
    use {
        "tpope/vim-dadbod",
        requires = {
            "kristijanhusak/vim-dadbod-ui", {
                "kristijanhusak/vim-dadbod-completion",
                config = function()
                    vim.cmd(
                        [[autocmd FileType sql,mysql,plsql lua require("cmp").setup.buffer({sources = {{ name = "vim-dadbod-completion" }, { name = "buffer" },} })]])
                    vim.cmd( [[let g:db_ui_use_nerd_fonts = 1 ]])
                    vim.cmd( [[let g:db_ui_win_position = "right" ]])
                end
            }
        }
    }

    -- Usefull Stuff
    use "mbbill/undotree"
    use "theprimeagen/harpoon"
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"
    use "lukas-reineke/indent-blankline.nvim"
    use({
        "uga-rosa/ccc.nvim",
        branch = "0.7.2",
        config = require'ccc'.setup({highlighter = {auto_enable = true}})
    })
    use {"lewis6991/gitsigns.nvim", config = get_default("gitsigns")}
    use {"numToStr/Comment.nvim", config = get_default("Comment")}
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
