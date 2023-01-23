--[[
@Lazyloading notes:
cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
ft = string or list,         -- Specifies filetypes which load this plugin.
keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
event = string or list,      -- Specifies autocommand events which load this plugin.
fn = string or list          -- Specifies functions which load this plugin.
]]
--

local P = function(use)
    -- @Performance --
    use({ 'lewis6991/impatient.nvim' })
    -- @PluginManagement
    use({ 'wbthomason/packer.nvim' })
    use({ 'nvim-lua/popup.nvim' })
    use({ 'nvim-lua/plenary.nvim' })
    use({ 'RRethy/vim-illuminate' })
    -- @FileSystem
    use({ 'kyazdani42/nvim-web-devicons' })
    use({ 'kyazdani42/nvim-tree.lua' })

    -- @Lualine
    use({ 'nvim-lualine/lualine.nvim' })

    -- @GuiVim
    use({ 'ahmedkhalf/project.nvim' })
    use({ 'goolord/alpha-nvim' })

    -- @VanillaLike_Helpers
    use({ 'kshenoy/vim-signature' })
    use({ 'numToStr/Comment.nvim' })
    use({ 'akinsho/toggleterm.nvim', tag = 'v2.*' })

    -- @Colorschemes
    use({ 'navarasu/onedark.nvim' })
    use({ 'folke/tokyonight.nvim' })

    -- @Completition
    use({
        'hrsh7th/nvim-cmp', -- The completion plugin

        requires = {
            'L3MON4D3/LuaSnip', -- snippet engine, required for completition
            'hrsh7th/cmp-buffer', -- buffer completions
            'saadparwaiz1/cmp_luasnip', -- snippet completions
            'rafamadriz/friendly-snippets', -- a bunch of snippets to use
            'hrsh7th/cmp-nvim-lsp', -- LSP completitions
            'hrsh7th/cmp-path', -- path completions
            'hrsh7th/cmp-cmdline', -- cmdline completions
        },
    })

    use({ 'folke/todo-comments.nvim' })

    -- @LSP
    use({ 'neovim/nvim-lspconfig' }) -- enable LSP

    -- LSP Installer
    use({
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim',
        },
    })
    -- for formatters and linters
    use({ 'jose-elias-alvarez/null-ls.nvim' })
    --[[ A plugin to configure Neovim LSP using json/yaml files like coc-settings.json. ]]
    use({ 'tamago324/nlsp-settings.nvim' })

    -- @Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }),
            use({ 'nvim-telescope/telescope-symbols.nvim' }),
        },
    })

    -- @Treesitter @SyntaxHighlighting
    use({ 'lukas-reineke/indent-blankline.nvim' })

    use({ 'rcarriga/nvim-notify' }) -- don't really use

    use({ 'nvim-treesitter/nvim-treesitter' })
    use({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' })

    -- @Git
    use({ 'lewis6991/gitsigns.nvim' })

    use({ 'tpope/vim-surround' })
    use({ 'tpope/vim-fugitive' })

    -- @Navigation
    use({ 'akinsho/bufferline.nvim', tag = 'v2.*' })
    use({ 'christoomey/vim-tmux-navigator' })

    -- @C_CXX_Development
    use({
        'cdelledonne/vim-cmake',
        ft = { 'c', 'cpp', 'cmake' },
        cmd = { 'CMakeGenerate', 'CMakeBuild' },
    })

    -- @Web
    use({ 'norcalli/nvim-colorizer.lua', ft = { ' css', 'jsx', 'tsx' } })
    use({ 'simrat39/rust-tools.nvim' })

    -- @Docker
    -- use 'jamestthompson3/nvim-remote-containers

    use({ 'ray-x/lsp_signature.nvim' })
    use({ 'windwp/nvim-autopairs' })

    -- debugger
    use({
        'mfussenegger/nvim-dap',
        'leoluz/nvim-dap-go',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-telescope/telescope-dap.nvim',
    })

    use({ 'folke/trouble.nvim', cmd = { 'Trouble', 'TroubleToggle' } })

    -- @SQL
    use({ 'nanotee/sqls.nvim', ft = { 'sql' } })

    -- @Go
    use({
        'olexsmir/gopher.nvim',
        'edolphin-ydf/goimpl.nvim',
        ft = { 'go' },
    })
end

return P
