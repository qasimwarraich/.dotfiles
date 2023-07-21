local M = {}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", '<space>E', vim.diagnostic.open_float, opts)
vim.keymap.set("n", '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set("n", '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", '<space>f', vim.lsp.buf.format, bufopts)

	local active_clients = vim.lsp.get_active_clients()
	if client.name == "denols" then
		for _, client_ in pairs(active_clients) do
			if client_.name == "tsserver" then
				client_.stop()
			end
		end
	elseif client.name == "tsserver" then
		for _, client_ in pairs(active_clients) do
			if client_.name == "denols" then
				client.stop()
			end
		end
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end
end

M.attach = on_attach

return M
