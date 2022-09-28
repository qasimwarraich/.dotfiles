local nnoremap = require('config.keymap').nnoremap
local nvim_lsp = require('lspconfig')
local lsp_keymap = require('config.lsp_keymap')

local servers = {
    "pyright", "jedi_language_server", "rust_analyzer", "tsserver", "clangd",
    'vimls', 'html', 'cssls', 'intelephense', 'dockerls', 'metals', 'ansiblels',
    'texlab', 'ltex', 'svelte'
}
for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = lsp_keymap.attach} end

require("config.custom_servers.sumneko")
require("config.custom_servers.go")

