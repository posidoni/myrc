local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '

local lazy_opts = {
    checker = {
        enabled = true,
        notify = false,
    },
    install = {
        missing = true,
    },
    concurrency = 8, -- hardcoded, because I don't want to make any syscalls here
    performance = {
        debug = false,
        reset_packpath = true, -- reset the package path to improve startup time
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = {
                'gzip',
                'tar',
                'tarPlugin',
                'zip',
                'zipPlugin',
                'getscript',
                'getscriptPlugin',
                'vimball',
                'vimballPlugin',
                '2html_plugin',
                'logiPat',
                'rrhelper',
                'netrw',
                'netrwPlugin',
                'netrwSettings',
                'netrwFileHandlers',
                'tutor',
                'tohtml',
            },
        },
    },
}

require('lazy').setup({
    { 'lewis6991/impatient.nvim', lazy = false },
    --
    { { import = 'lsp' } },
    { { import = 'settings.lsp.mason' } },
    { { import = 'settings.cmp' } },
    { { import = 'ui.dropbar' } },
    { { import = 'ui.noice' } },
    { { import = 'dap' } },
    { { import = 'colorschemes' } },
    { { import = 'settings.languages.neotest' } },
    { { import = 'settings.languages.lua' } },
    { { import = 'settings.languages.rust' } },
    { { import = 'settings.languages.go' } },
    { { import = 'settings.neotree' } },
    { { import = 'settings.todo-comments' } },
    -- { { import = 'settings.ufo' } },
    { { import = 'settings.toggleterm' } },

    --
    {
        'sindrets/diffview.nvim',
        keys = {
            { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'DiffView' },
        },
        lazy = true,
    },
    -- @PluginManagement
    { 'nvim-lua/popup.nvim', lazy = true },
    { 'nvim-lua/plenary.nvim' },
    { 'RRethy/vim-illuminate' },
    -- @FileSystem
    { 'kyazdani42/nvim-web-devicons', lazy = true },
    { 'editorconfig/editorconfig-vim', lazy = true },
    -- @Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'AndreM222/copilot-lualine',
        },
    },

    {
        'numToStr/Comment.nvim',
        opts = {
            padding = true,
            sticky = true,
            toggler = {
                line = 'gcc',
                block = 'gbc',
            },
            opleader = {
                line = 'gc',
                block = 'gb',
            },
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = 'gcA',
            },
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },
        },
        lazy = false,
    },

    -- @Tui for Nvim
    { 'ahmedkhalf/project.nvim' },
    { 'goolord/alpha-nvim' },
    -- @VanillaLike_Helpers
    { 'kshenoy/vim-signature' },
    -- @LSP
    { 'neovim/nvim-lspconfig' }, -- enable LSP
    -- LSP Installer

    { 'tamago324/nlsp-settings.nvim' },
    -- @Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-symbols.nvim' },
        },
        lazy = true,
    }, -- @Treesitter @SyntaxHighlighting
    { 'lukas-reineke/indent-blankline.nvim', tag = 'v2.20.8' },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'windwp/nvim-ts-autotag',
            -- 'nvim-treesitter/nvim-treesitter-context', -- Don't use it really
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-textsubjects',
        },
    },
    -- @Git
    { 'lewis6991/gitsigns.nvim', lazy = true },
    -- @Navigation
    { 'akinsho/bufferline.nvim' },
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
        keys = {
            {
                '<C-h>',
                '<cmd>TmuxNavigateLeft<cr>',
                desc = 'Got to the left pane',
            },
            {
                '<C-j>',
                '<cmd>TmuxNavigateDown<cr>',
                desc = 'Got to the down pane',
            },
            { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Got to the up pane' },
            {
                '<C-l>',
                '<cmd>TmuxNavigateRight<cr>',
                desc = 'Got to the right pane',
            },
        },
    },
    { 'jamestthompson3/nvim-remote-containers', event = 'VeryLazy' },
    { 'ray-x/lsp_signature.nvim', lazy = true },
    { 'windwp/nvim-autopairs' },
    { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
}, lazy_opts)

require('settings.options')
require('settings.keymaps')
require('settings.lsp')
require('settings.telescope')
require('settings.autopairs')
require('settings.treesitter')
require('settings.illuminate')
require('settings.gitsigns')
require('settings.nvim-tree')
require('settings.lualine')
require('settings.project')
require('settings.alpha')
require('settings.autocommands')
require('settings.bufferline')
require('settings.indentline')
require('settings.cmake')
