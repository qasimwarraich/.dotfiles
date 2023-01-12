local lspconfig = require("lspconfig")
local attach    = require('config.lsp_keymap').attach


lspconfig.denols.setup {
    on_attach = attach,
    root_dir = lspconfig.util.root_pattern("deno.json"),
}
