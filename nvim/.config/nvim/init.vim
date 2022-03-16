syntax on
set smartindent
set nu
set relativenumber
set mouse=a
set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
set clipboard=unnamedplus
set splitbelow splitright
set scrolloff=8
set updatetime=300
" set laststatus=2
let mapleader = "\<Space>"
" let g:python3_host_prog = '/home/spam/Clones/py3nvim/bin/python'

set termguicolors

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

set hidden

"-- Mappings --

nnoremap <esc><esc> :noh<return>
map <F8> :set nolist!<CR>
map <C-a> ggVG<C-o>
map <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
map <A-z> :Goyo<CR>
" map <leader>t :lcd %:p:h<CR>:split \| resize 10 \| term <CR>
map <leader>TT :lcd ~/<CR>
map <leader>x <C-w>q
map <leader>mp :MarkdownPreview<CR>
nnoremap <leader>S :Telescope live_grep<CR>
nnoremap <leader>s :Telescope find_files<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>p :Telescope <CR>
nnoremap <leader>E :Telescope file_browser <CR>
nnoremap <leader>L :lua require('lint').try_lint()<CR>
command! -nargs=* W w " Unbinds :W = :Windows (fzf)

"Moving between windows with h,j,k,l keys
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>> :resize +5<CR>
nnoremap <Leader>< :resize -5<CR>
"This feels sexy
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Maps a quick function yank for curly braced languages.
nnoremap yf va{Vy
nnoremap df va{Vd

"Exit Terminal with ESC
tnoremap <esc> <C-\><C-n>

"-- Commands, Functions and Other Cool Stuff  --
command Reload :source /home/spam/.config/nvim/init.vim
command WS :/\s\+$/
autocmd BufNewFile,BufRead \.aliases set ft=sh

"Highlight Yanks
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}

"sxhkdrc file save runs restart command
autocmd BufWritePost .config/sxhkd/sxhkdrc :silent !sxhkd-restart

"testing auto cd for term
map <leader>T :call Spam()<CR>
fun! Spam()
let Directory = expand("%:h")
:split | resize 10 | term
execute "normal! i"
call feedkeys("cd ")
echom Directory
endfun


"-- VIM PLUG --

call plug#begin('~/.config/nvim')

" Surrounding objects tool
Plug 'tpope/vim-surround'

" Vim-Commentary Comments Utility
Plug 'tpope/vim-commentary'

" Lualine status bar
Plug 'nvim-lualine/lualine.nvim'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Gruvbox Colour Scheme
Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'
Plug 'rebelot/kanagawa.nvim'

" Rainbow parenthesis nesting.
Plug 'p00f/nvim-ts-rainbow'

" VIM FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" GoYo 'Zen Mode'
Plug 'junegunn/goyo.vim'

" Vim quick navigation with f,F
Plug 'unblevable/quick-scope'

" Debugging tool
Plug 'puremourning/vimspector'

" Window Maximiser
Plug 'szw/vim-maximizer'

Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Sidebar plugin
Plug 'sidebar-nvim/sidebar.nvim'

" Indent Line
Plug 'lukas-reineke/indent-blankline.nvim'

" Emmet
Plug 'mattn/emmet-vim/'

" Vim Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Vim file templates
Plug 'tibabit/vim-templates'

" VimTex LaTeX
Plug 'lervag/vimtex'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" Fire nvim: VIM EVERYWHERE!
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Nvim LSP
Plug 'neovim/nvim-lspconfig'

" go.nvim
Plug 'ray-x/go.nvim'

" Nvim Lint
Plug 'mfussenegger/nvim-lint'

" Vim dadbod + dadbodui
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

" Fugitive git tool
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'

" Git gutter tool
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'

" Neoformat
Plug 'sbdchd/neoformat'

" Autopairs
Plug  'windwp/nvim-autopairs'

" Colour highlight
Plug 'norcalli/nvim-colorizer.lua'

" Prettier errors
Plug 'folke/lsp-trouble.nvim'

" LSP symbols outline
" Plug 'simrat39/symbols-outline.nvim'

" Nvim distant
Plug 'chipsenkbeil/distant.nvim'

" Nvim DAP
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Harpoon
Plug 'ThePrimeagen/harpoon'

" Nvim cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'

call plug#end()

"Dadbod UI config
let g:db_ui_use_nerd_fonts = 1

"Config pretty error list.
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

"Load colour highlighter
lua require'colorizer'.setup()

"Markdown Preview
let g:mkdp_auto_close = 1

"Fire Nvim Config
" let fc['.*'] = { 'takeover': 'always' }
"
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'takeover': 'never'
        \ },
    \ }
\ }

"Templates config
let g:tmpl_search_paths = ['/home/spam/Programming/Templates/VimTemplates/']
let g:tmpl_auto_initialize = 0
map <leader>it :TemplateInit<CR>


"Vim Emmet config
let g:user_emmet_leader_key=','


"Colour Scheme Config

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
" colorscheme gruvbox

" Example config in VimScript
" NOTE: Configuration needs to be set BEFORE loading the color scheme with `colorscheme` command
let g:github_function_style = "italic"
let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer", "NvimTree"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:github_colors = {
  \ 'hint': 'orange',
  \ 'bg_search': 'white',
  \ 'fg_search': 'black',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme kanagawa
" colorscheme github_dark_default

hi Normal guibg=black
hi NormalNC guibg=black
hi Pmenu guibg=black
hi Signcolumn guibg=black guifg=gold
hi Linenr guibg=black guifg=gold

" hi Normal guibg=#0c0c0c guifg=white
" hi Signcolumn guibg=#0c0c0c guifg=gold
" hi Linenr guibg=#0c0c0c guifg=gold

"Rainbow config
let g:rainbow_active = 1


"Fugitive bindings
nnoremap <leader>g :Git<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gP :Git pull<CR>
nnoremap <leader>gd :Git diff<CR>

"Maximizer Setup
nnoremap <silent><leader>m :MaximizerToggle<CR>

"Vimspector Setup

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" nnoremap <leader>dd :call vimspector#Launch()<CR>
" nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
" nnoremap <leader>dq :call vimspector#Reset()<CR>

" nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

" nmap <leader>dl <Plug>VimspectorStepInto
" nmap <leader>dj <Plug>VimspectorStepOver
" nmap <leader>dk <Plug>VimspectorStepOut
" nmap <leader>dr <Plug>VimspectorRestart
" nnoremap <leader>d<space> :call vimspector#Continue()<CR>

" nmap <leader>drc <Plug>VimspectorRunToCursor
" nmap <leader>db <Plug>VimspectorToggleBreakpoint
" nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint

nnoremap <leader>dd :lua require'dap'.continue()<CR>
nnoremap <leader>dq :lua require'dap'.terminate()<CR>
nmap <leader>dl :lua require'dap'.step_into()<CR>
nmap <leader>dj :lua require'dap'.step_over()<CR>
nmap <leader>dk :lua require'dap'.step_out()<CR>
nmap <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <leader>d<space> :lua require("dapui").toggle()<CR>
nmap <leader>db :lua require'dap'.toggle_breakpoint()


"VimTex Config
" let g:vimtex_latexmk_progname='/home/spam/.local/bin/nvr'
let g:vimtex_view_method = 'zathura'
let g:vimtex_complete_close_braces = 1
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
" set statusline+=%{FugitiveStatusline()}
" set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P



lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
require'lsp_signature'.on_attach({hi_parameter = "IncSearch"})
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>E', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "jedi_language_server", "rust_analyzer", "tsserver", "clangd", 'vimls', 'html', 'cssls','intelephense', 'sumneko_lua', 'dockerls', 'metals', 'ansiblels','texlab', 'ltex'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF


lua << EOF
require 'go'.setup({
  goimport = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gopls', -- if set to gopls will use golsp format
  max_line_len = 120,
  tag_transform = false,
  test_dir = '',
  comment_placeholder = '   ',
  lsp_cfg = true, -- false: use your own lspconfig
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  dap_debug = true,
})

local protocol = require'vim.lsp.protocol'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
  rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
}


require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
EOF

" TS Python named operators highlighting hotfix
highlight! link TSKeywordOperator Keyword

nnoremap <leader>e :SidebarNvimToggle<CR>

set termguicolors " this variable must be enabled for colors to be applied properly


set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
require('nvim-autopairs').setup{
    fast_wrap = {},
}
local lspkind = require('lspkind')
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
   formatting = {
        format = lspkind.cmp_format({
          with_text = false, -- do not show text alongside icons
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          
          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function (entry, vim_item)
            return vim_item
          end
        })
      },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'omni' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'buffer' },
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
    { name = 'buffer' , name = 'path'},
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
autocmd FileType tex lua require('cmp').setup.buffer { sources = { { name = 'omni' }, { name = 'nvim_lsp' }, { name = 'vsnip' }, { name = 'buffer' } }}

"Vsnip config
" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

lua <<EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF



lua <<EOF
require('lint').linters_by_ft = {
    markdown = {'vale', 'markdownlint'},
    python = {'flake8', 'pylint'},
    c = {'clang-tidy'},
    cpp = {'clang-tidy'},
    sh = {'shellcheck'},
    bash = {'shellcheck'},
    yml = {'yamllint'},
    yaml = {'yamllint'},
}
EOF

au InsertLeave *.* lua require('lint').try_lint()




lua <<EOF


local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}

local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}


-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/Clones/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
EOF

" Harpoon config
nnoremap <leader>H :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>a :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>t :lua require("harpoon.term").gotoTerminal(1)<CR>             
lua <<EOF
require("telescope").load_extension('harpoon')
require("telescope").load_extension "file_browser"

require('distant').setup {
  -- Applies Chip's personal settings to every machine you connect to
  --
  -- 1. Ensures that distant servers terminate with no connections
  -- 2. Provides navigation bindings for remote directories
  -- 3. Provides keybinding to jump into a remote file's parent directory
  ['*'] = require('distant.settings').chip_default()
}
EOF
lua << END
require('lualine').setup({
    options = {
        theme = 'kanagawa',
        section_separators = "",
        component_separators = ""
    },
    extensions = {
        'quickfix',
        'fugitive'
        }
})

require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = true,
    update_interval = 1000,
    sections = { "buffers", "files", "git", "diagnostics", "todos" },
    section_separator = "-----",
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    files = { show_hidden = true },
    todos = { ignored_paths = { "~" , "./node_modules/"} },
    disable_closing_prompt = true
})

vim.opt.list = false
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    disable_with_nolist = true
}
END

let g:gitlab_api_keys = {'gitlab.com': $GLPAT}
