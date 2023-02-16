vim.o.filetype = false
vim.opt.rtp:append("/usr/share/lilypond/2.22.0/vim")

vim.cmd [[
syntax on filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set gdefault ignorecase undofile smartcase list
set completeopt=menu,menuone
set smartindent expandtab smarttab tabstop=4 softtabstop=0 shiftwidth=4 textwidth=120
set ch=0 ls=0 stal=0 sbr=> fcs+=diff:/ fdl=99 cole=2
set spell spl=en,ru
]]

vim.g.mapleader = " "
vim.g.loaded_netrw, vim.g.loaded_netrwPlugin = 1, 1
vim.g.loaded_python3_provider, vim.g.loaded_ruby_provider, vim.g.loaded_perl_provider = 0, 0, 0

vim.api.nvim_create_autocmd("FocusLost", {pattern = "*", callback = ":wa"})

require 'packer'.startup(function()
use 'wbthomason/packer.nvim'
use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }

use {'stevearc/dressing.nvim', config = function() require 'dressing'.setup {
    input = {win_options = {winblend = 0}}, select = {enabled = false}
} end }

use {'nvim-treesitter/nvim-treesitter', config = function()
    ts_langs = {
        "c", "cpp", "lua", "dot", "rust", "cmake", "python", "bash", "toml",
        "dockerfile", "yaml", "go", "haskell", "html", "scss", "tlaplus"}
    ts_colors = { 'Red', 'brown', 'Yellow', 'Blue', 'Magenta', 'Cyan' }

    require 'nvim-treesitter.configs'.setup {
        ensure_installed = ts_langs,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        rainbow = { enable = true, extended_mode = true, colors = ts_colors}}

    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "vim_treesitter#foldexpr()"
end }

use {'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}

use {'lukas-reineke/indent-blankline.nvim', ft = {"yaml"}, config = function()
    require "indent_blankline".setup()
    vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
end}

use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use {'hrsh7th/nvim-cmp', config = function() local cmp = require 'cmp' cmp.setup {
    mapping = {
        ['<Tab>'] = function(fb) if cmp.visible() then cmp.select_next_item() else fb() end end,
        ['<S-Tab>'] = function(fb) if cmp.visible() then cmp.select_prev_item() else fb() end end },
    sources = {{ name = 'nvim_lsp' }, { name = 'buffer' }},
    experimental = { ghost_text = true }
} end }


-- TODO replace with vim-ranger
use {'kyazdani42/nvim-tree.lua', commit = "ec3f10e2116f344d9cc5c9980bddf7819f27d8ae", config = function()
    vim.g.nvim_tree_show_icons = { folders = 0, files = 0, folder_arrows = 0 }
    require 'nvim-tree'.setup{}
end }

use 'tpope/vim-fugitive'
-- TODO Maybe use this instead of fugitive
use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require "diffview".setup{
    use_icons = false
} end}

use {'simrat39/rust-tools.nvim', config = function() require 'rust-tools'.setup() end }

use {'haya14busa/incsearch.vim', config = function() vim.g['incsearch#auto_nohlsearch'] = 1 end }
use 'kuangliu/vim-easymotion'
use 'haya14busa/incsearch-easymotion.vim'
use {'mileszs/ack.vim', config = function() vim.g.ackprg = 'ag --vimgrep' end}

use {'lervag/vimtex', ft = {"tex"}, config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_syntax_conceal_disable = true
    vim.g.vimtex_quickfix_ignore_filters = { 'Underfull', 'Overfull' }
    vim.g.vimtex_compiler_latexmk = { options = {
        '-file-line-error', '-synctex=1',
        '-interaction=nonstopmode', '-shell-escape' }}
end}

use 'tpope/vim-obsession'

use {'junegunn/goyo.vim', config = function() vim.g.goyo_width = 120 end }

use 'Twinside/vim-haskellConceal'
use 'myrrc/tlaplus-conceal.vim'
end)

local caps, servers = require 'cmp_nvim_lsp'.default_capabilities(), {
    clangd = { "clangd-13", "--background-index", "-j=8", "--header-insertion=never" },
    rust_analyzer = { "rust-analyzer" },
    hls = { "haskell-language-server-wrapper", "--lsp" }
}

for lsp_name, lsp_flags in pairs(servers) do require 'lspconfig'[lsp_name].setup {
    capabilities = caps, cmd = lsp_flags, flags = { debounce_text_changes = 150}
} end

local map, n, s, sn = vim.keymap.set, {noremap = true}, {silent = true}, {silent = true, noremap = true}

map('n', ';', ':', n)
map('i', 'jj', '<ESC>', n)
map('t', 'jj', '<C-\\><C-n>', n)
map('n', '<C-J>', '<C-W><C-J>', n)
map('n', '<C-K>', '<C-W><C-K>', n)
map('n', '<C-L>', '<C-W><C-L>', n)
map('n', '<C-H>', '<C-W><C-H>', n)

map('n', '<Leader>a', ':Ack ', n)
map('n', '<Leader>s', ':NvimTreeToggle<CR>', s)
-- TODO minibuf ( s) and fzf ( d)
map('n', 'f', '<Plug>(easymotion-bd-W)', sn)

-- +signature help?
map('n', '<Leader>y', vim.lsp.buf.outgoing_calls, sn)
map('n', '<Leader>u', vim.lsp.buf.code_action, sn)
map('n', '<Leader>i', vim.lsp.buf.format, sn)
map('n', '<Leader>o', vim.lsp.buf.rename, sn)
map('n', '<Leader>p', vim.lsp.buf.document_symbol, sn)
map('n', '<Leader>g', vim.lsp.buf.incoming_calls, sn)
map('n', '<Leader>h', vim.lsp.buf.hover, sn)
map('n', '<Leader>j', vim.lsp.buf.definition, sn)
map('n', '<Leader>k', vim.lsp.buf.references, sn)
map('n', '<Leader>n', ':DiffviewOpen<CR>', sn)
map('n', '<Leader>m', ':G commit<CR>', sn)
map('n', '<Leader>,', ':G push<CR>', sn)
map('n', '<Leader>/', '"*p', sn)

--map('n', '[d', vim.diagnostic.goto_prev, sn)
--map('n', ']d', vim.diagnostic.goto_next, sn)
map('n', '/', '<Plug>(incsearch-easymotion-/)', {})
map('n', 'n', '<Plug>(incsearch-nohl-n)', {})
map('n', 'N', '<Plug>(incsearch-nohl-N)', {})
map('n', '#', '<Plug>(incsearch-nohl-#)', {})
