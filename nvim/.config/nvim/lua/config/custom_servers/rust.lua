local rt = require("rust-tools")
local lsp_keymap = require('config.lsp_keymap')

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            lsp_keymap.attach(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>A", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
