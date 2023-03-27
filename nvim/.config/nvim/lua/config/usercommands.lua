if vim.fn.exists(":Reload") == 0 then
	vim.cmd([[command Reload :so /home/spam/.config/nvim/init.lua]])
end
