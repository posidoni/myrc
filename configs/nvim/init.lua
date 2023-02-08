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
    install = { colorscheme = { 'dracula' } },
    concurrency = 5,
    performance = {
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
    debug = false,
}

-- write function that creates object Andrew

require('lazy').setup({
    -- @Colors
    { 'olimorris/onedarkpro.nvim', lazy = false, priority = 1000 },
    --
    { 'lewis6991/impatient.nvim' },
    {
        "sindrets/diffview.nvim",
        opts = {},
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" }
        },
    },
    -- @PluginManagement
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'RRethy/vim-illuminate' },
    -- @FileSystem
    { 'kyazdani42/nvim-web-devicons' },
    { 'kyazdani42/nvim-tree.lua' },
    { 'editorconfig/editorconfig-vim' },
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
        end
    },
    { 'akinsho/toggleterm.nvim', version = 'v2.*' },
    {
        'hrsh7th/nvim-cmp',         -- The completion plugin
        dependencies = {
            'L3MON4D3/LuaSnip',     -- snippet engine, required for completition
            'hrsh7th/cmp-buffer',   -- buffer completions
            'hrsh7th/cmp-nvim-lsp', -- LSP completitions
            'hrsh7th/cmp-path',     -- path completions
            'hrsh7th/cmp-cmdline',  -- cmdline completions
        },
    },
    { 'folke/todo-comments.nvim' },
    -- @LSP
    { 'neovim/nvim-lspconfig' }, -- enable LSP
    { 'folke/neodev.nvim' },
    -- LSP Installer
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
    }, -- for formatters and linters

    -- alternative for NULL-LS (which is archived Aug 2023)
    { 'nvimtools/none-ls.nvim' },
    { 'tamago324/nlsp-settings.nvim' },
    -- @Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-symbols.nvim' },
        },
    }, -- @Treesitter @SyntaxHighlighting
    { 'lukas-reineke/indent-blankline.nvim', tag = 'v2.20.8' },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "RRethy/nvim-treesitter-textsubjects",
        }
    },
    -- @Git
    { 'lewis6991/gitsigns.nvim' },
    -- @Navigation
    { 'akinsho/bufferline.nvim' },
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
        keys = {
            { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  desc = "Got to the left pane" },
            { "<C-j>", "<cmd>TmuxNavigateDown<cr>",  desc = "Got to the down pane" },
            { "<C-k>", "<cmd>TmuxNavigateUp<cr>",    desc = "Got to the up pane" },
            { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
        },
    },
    -- @C_CXX_Development
    {
        'cdelledonne/vim-cmake',
        ft = { 'c', 'cpp', 'cmake' },
        cmd = { 'CMakeGenerate', 'CMakeBuild' },
    },
    'norcalli/nvim-colorizer.lua',
    ft = { ' css', 'jsx', 'tsx' },
    { 'simrat39/rust-tools.nvim' },

    -- @Docker
    { 'jamestthompson3/nvim-remote-containers' },

    { 'ray-x/lsp_signature.nvim' },
    { "onsails/lspkind-nvim" },
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
    { 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' } },
    {
        'edolphin-ydf/goimpl.nvim',
        ft = { 'go' },
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        event = "BufReadPost",
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        },

        init = function()
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

            require("ufo").setup(
                {
                    provider_selector = function(bufnr, filetype, buftype)
                        return { "treesitter", "indent" }
                    end
                }
            )
        end,
    },
}, lazy_opts)

-------------------------------------
-- [[

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

-- Firenvim config:
-- vim.cmd([[
--     if exists('g:started_by_firenvim')
--         au TextChanged * ++nested write
--         au TextChangedI * ++nested write
--         let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
--         let g:EditorConfig_disable_rules = ['']
--     endif
-- ]])

require('onedarkpro').setup({
    styles = {
        types = 'NONE',
        methods = 'NONE',
        numbers = 'NONE',
        strings = 'NONE',
        comments = 'italic',
        keywords = 'bold',
        constants = 'NONE',
        functions = 'bold',
        operators = 'NONE',
        variables = 'NONE',
        parameters = 'NONE',
        conditionals = 'bold',
        virtual_text = 'NONE',
    },
    plugins = { -- Override which plugin highlight groups are loaded
        aerial = true,
        barbar = true,
        copilot = true,
        dashboard = true,
        flash_nvim = true,
        gitsigns = true,
        hop = true,
        indentline = true,
        leap = true,
        lsp_saga = true,
        lsp_semantic_tokens = true,
        marks = true,
        mini_indentscope = true,
        neotest = true,
        neo_tree = true,
        nvim_cmp = true,
        nvim_bqf = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        nvim_hlslens = true,
        nvim_lsp = true,
        nvim_navic = true,
        nvim_notify = true,
        nvim_tree = true,
        nvim_ts_rainbow = true,
        op_nvim = true,
        packer = true,
        polygot = true,
        startify = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
        trouble = true,
        vim_ultest = true,
        which_key = true,
    },
    highlights = {
        Comment = { italic = true, extend = true },
        Directory = { bold = true },
        ErrorMsg = { italic = true, bold = true },
    },
    options = {
        cursorline = true,                  -- Use cursorline highlighting?
        transparency = false,               -- Use a transparent background?
        terminal_colors = true,             -- Use the theme's colors for Neovim's :terminal?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
    },
})

vim.cmd([[ colorscheme onedark_vivid]])
