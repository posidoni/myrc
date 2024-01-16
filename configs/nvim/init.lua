local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
    checker = { enabled = true, notify = false },
    install = {
        colorscheme = { 'monokai-pro-classic' },
        missing = true,
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = true, -- get a notification when changes are found
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

-- write function that creates object Andrew

vim.g.mapleader = ' '

require('lazy').setup({
    { { import = 'colorschemes.monokai-pro' } },
    { { import = 'lsp' } },
    { 'lewis6991/impatient.nvim', lazy = false },
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
    { 'kyazdani42/nvim-tree.lua', lazy = true },
    { 'editorconfig/editorconfig-vim', lazy = true },
    -- @Lualine
    { 'nvim-lualine/lualine.nvim' },

    -- @Tui for Nvim
    { 'ahmedkhalf/project.nvim' },
    { 'goolord/alpha-nvim' },
    -- @VanillaLike_Helpers
    { 'kshenoy/vim-signature' },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },
    { 'akinsho/toggleterm.nvim', version = 'v2.*', event = 'VeryLazy' },
    {
        'hrsh7th/nvim-cmp', -- The completion plugin
        dependencies = {
            'L3MON4D3/LuaSnip', -- snippet engine, required for completition
            'hrsh7th/cmp-buffer', -- buffer completions
            'hrsh7th/cmp-nvim-lsp', -- LSP completitions
            'hrsh7th/cmp-path', -- path completions
            'hrsh7th/cmp-cmdline', -- cmdline completions
        },
        lazy = true,
    },
    { 'folke/todo-comments.nvim' },
    -- @LSP
    { 'neovim/nvim-lspconfig' }, -- enable LSP
    { 'folke/neodev.nvim', lazy = true, ft = { 'lua' } },
    -- LSP Installer
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
        event = 'VeryLazy',
    },

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
            'nvim-treesitter/nvim-treesitter-context',
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
    -- @C_CXX_Development
    {
        'cdelledonne/vim-cmake',
        ft = { 'c', 'cpp', 'cmake' },
        cmd = { 'CMakeGenerate', 'CMakeBuild' },
    },
    {
        'norcalli/nvim-colorizer.lua',
        ft = { ' css', 'jsx', 'tsx' },
    },
    { 'simrat39/rust-tools.nvim', lazy = true },

    -- @Docker
    { 'jamestthompson3/nvim-remote-containers', event = 'VeryLazy' },
    { 'ray-x/lsp_signature.nvim', lazy = true },
    { 'onsails/lspkind-nvim', lazy = true },
    { 'windwp/nvim-autopairs' },
    -- debugger
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            { 'leoluz/nvim-dap-go' },
            { 'rcarriga/nvim-dap-ui' },
            { 'theHamsta/nvim-dap-virtual-text' },
            { 'nvim-telescope/telescope-dap.nvim' },
        },
        lazy = true,
    },
    { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' }, lazy = true },
    {
        'edolphin-ydf/goimpl.nvim',
        ft = { 'go' },
        lazy = true,
    },
}, lazy_opts)

require('settings.options')
require('settings.keymaps')
require('settings.cmp')
require('settings.lsp')
require('settings.telescope')
require('settings.autopairs')
require('settings.todo-comments')
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
require('settings.toggleterm')
require('settings.trouble')
require('settings.dap')
require('settings.lsp.mason')
require('settings.lsp.rust')

-- Turned off
-- require('settings.ufo')
-- require('settings.firenvim')
