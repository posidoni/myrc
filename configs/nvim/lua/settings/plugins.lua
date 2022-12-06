local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Error! Packer has failed to init!")
    return
end

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_first_launch = ensure_packer()

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- @Performance --
    use({ "nathom/filetype.nvim" })
    use({ "lewis6991/impatient.nvim" })

    -- @PluginManagement
    use({ "wbthomason/packer.nvim" })
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-lua/plenary.nvim" })

    -- @FileSystem
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "kyazdani42/nvim-tree.lua" })

    -- @Lualine
    use({ "nvim-lualine/lualine.nvim" })

    -- @Tagbar
    use({ "simrat39/symbols-outline.nvim" })

    -- @GuiVim
    use({
        -- @Mikhail: these two plugins work great together for GUI vim
        -- on some systems (especially OS X) it's impossible to launch vim
        -- with CLI arguments (i.e. give certain file), thus it's great to be
        -- able to quicly jump to Git Projects
        "ahmedkhalf/project.nvim",
    })
    use({
        "goolord/alpha-nvim",
    })

    -- @VanillaLike_Helpers
    use({ "kshenoy/vim-signature" })
    use({ "numToStr/Comment.nvim" }) -- Easily comment stuff
    use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- smart comments (aware of nested languages)
    use({ "akinsho/toggleterm.nvim", tag = "v2.*" })
    -- @Colorschemes
    use({ "navarasu/onedark.nvim" })
    use({ "sainnhe/sonokai" })
    -- use({ "NTBBloodbath/doom-one.nvim" })

    -- @Completition

    use({

        "hrsh7th/nvim-cmp", -- The completion plugin

    })
    use({

        "L3MON4D3/LuaSnip", -- snippet engine, required for completition
    })
    use({

        "hrsh7th/cmp-buffer", -- buffer completions
    })
    use({

        "hrsh7th/cmp-path", -- path completions
    })
    use({

        "hrsh7th/cmp-cmdline", -- cmdline completions
    })
    use({

        "hrsh7th/cmp-nvim-lsp" -- LSP completitions
    })

    use({ "folke/todo-comments.nvim" })

    -- @Snippets
    use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
    use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

    -- @LSP
    use({ "neovim/nvim-lspconfig"
    }) -- enable LSP

    -- LSP Installer
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })

    use({ "jose-elias-alvarez/null-ls.nvim"
    }) -- for formatters and linters
    use({ "antoinemadec/FixCursorHold.nvim"
    })
    use({ "tamago324/nlsp-settings.nvim"
    })

    -- @Telescope
    use({ "nvim-telescope/telescope.nvim"
    })
    use({ "nvim-telescope/telescope-symbols.nvim" })

    -- @Treesitter @SyntaxHighlighting
    use({ "lukas-reineke/indent-blankline.nvim" })

    use({
        "nvim-treesitter/nvim-treesitter",
        -- run = ":TSUpdate",
        -- @Note: this is great plugin for plugin development.
        -- Provides access to raw tresitter AST.
        -- use "nvim-treesitter/playground"
    })

    -- @Git
    use({ "lewis6991/gitsigns.nvim" })
    use({ "tpope/vim-fugitive" })
    -- @Navigation
    use({ "akinsho/bufferline.nvim", tag = "v2.*" })
    use({ "christoomey/vim-tmux-navigator" })

    -- @C_CXX_Development
    use({ "cdelledonne/vim-cmake" })

    -- @Web
    use({ "norcalli/nvim-colorizer.lua" })

    use({ "simrat39/rust-tools.nvim" })

    -- @Docker
    -- use 'jamestthompson3/nvim-remote-containers

    use({
        "ray-x/lsp_signature.nvim",
    })
    use({ "windwp/nvim-autopairs" })

    -- debugger
    use({ "mfussenegger/nvim-dap" })
    use({ "leoluz/nvim-dap-go" })
    use({ "rcarriga/nvim-dap-ui" }) -- A simple UI out of the box
    use({ "theHamsta/nvim-dap-virtual-text" }) -- Virtual text for variables
    use({ "nvim-telescope/telescope-dap.nvim" })


    use({
        "folke/trouble.nvim",
    })

    -- @Go
    use {
        "olexsmir/gopher.nvim",
        requires = { -- dependencies
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    }
    use {
        'edolphin-ydf/goimpl.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-treesitter/nvim-treesitter' },
        },
        config = function()
            require 'telescope'.load_extension 'goimpl'
        end,
    }

    if packer_first_launch then
        require("packer").sync()
    end
end)
