-- Set up nvim-cmp.
local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_keymap = require('config.cmp_keymap')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    window = {},
    mapping = cmp_keymap.mapping,
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'cmp_tabnine'},
        {name = 'path'}, {name = 'luasnip'}
    }, {{name = 'buffer'}})
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({{name = 'luasnip'}, {name = 'cmp_git'}},
                                 {{name = 'buffer'}})
})

cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

