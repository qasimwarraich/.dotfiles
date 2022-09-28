local nnoremap = require("config.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>H", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>a", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<leader>1", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>2", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>3", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>4", function() require("harpoon.ui").nav_file(4) end, silent)
