local nvim_lsp = require('lspconfig')
local lsp_keymap = require('config.lsp_keymap')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
    "pyright", "jedi_language_server", "tsserver", "clangd",
    'vimls', 'html', 'cssls', 'intelephense', 'dockerls', 'metals', 'ansiblels',
    'texlab', 'ltex', 'svelte', 'tailwindcss', 'denols', 'eslint'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = lsp_keymap.attach,
        capabilities = capabilities
    }
end

-- Custom configs
require("config.custom_servers.lua_ls")
require("config.custom_servers.go")
require("config.custom_servers.rust")
require("config.custom_servers.deno")
require("config.custom_servers.emmet")
