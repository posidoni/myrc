-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Error! Packer has failed to init!")
    return
end

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
    use({ "nathom/filetype.nvim", commit = "b522628a45a17d58fc0073ffd64f9dc9530a8027" })
    use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })

    -- @PluginManagement
    use({ "wbthomason/packer.nvim", commit = "3a9f9801f683946b9f1047d8f4bf9946c29e927d" }) -- Have packer manage itself
    use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
    use({ "nvim-lua/plenary.nvim", commit = "31807eef4ed574854b8a53ae40ea3292033a78ea" }) -- Useful lua functions used ny lots of plugins

    -- @FileSystem
    use({ "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" })
    use({ "kyazdani42/nvim-tree.lua", commit = "c3ea264947671f44d836af5b7587e12c4b4611f9" })

    -- @Lualine
    use({ "nvim-lualine/lualine.nvim", commit = "3cf45404d4ab5e3b5da283877f57b676cb78d41d" })

    -- @Tagbar
    use({ "simrat39/symbols-outline.nvim", commit = "e459f3262c4c79a62e654ada0fbbb9758313c968" })

    -- @GuiVim
    use({
        -- @Mikhail: these two plugins work great together for GUI vim
        -- on some systems (especially OS X) it's impossible to launch vim
        -- with CLI arguments (i.e. give certain file), thus it's great to be
        -- able to quicly jump to Git Projects
        "ahmedkhalf/project.nvim",
        commit = "090bb11ee7eb76ebb9d0be1c6060eac4f69a240f",
    })
    use({
        "goolord/alpha-nvim",
        commit = "6af70dda0c8bd96645064202263230c571eacbf5",
    })

    -- @VanillaLike_Helpers
    use({ "kshenoy/vim-signature", commit = "6bc3dd1294a22e897f0dcf8dd72b85f350e306bc" })
    use({ "numToStr/Comment.nvim", commit = "728f38ef5b9d77f310fc9d56f87582c24111f793" }) -- Easily comment stuff
    use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }) -- smart comments (aware of nested languages)
    use({ "akinsho/toggleterm.nvim", tag = "v2.*", commit = "7fb7cdf875f6c07285e4aae6a1a7f27b77b3485c" })
    -- @Colorschemes
    use({ "navarasu/onedark.nvim", commit = "551f299d9ab2fd557247aa1995b2831a1237e4ae" })
    use({ "NTBBloodbath/doom-one.nvim", commit = "347c5277948b8485301495b270a60eab24cee90c" })

    -- @Completition

    use({

        "hrsh7th/nvim-cmp", -- The completion plugin
        commit = "058100d81316239f3874064064f0f0c5d43c2103",
    })
    use({

        "L3MON4D3/LuaSnip", -- snippet engine, required for completition
        commit = "92c79c5826e165e3a54075630d2117dd692dae5e",
    })
    use({

        "hrsh7th/cmp-buffer", -- buffer completions
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
    })
    use({

        "hrsh7th/cmp-path", -- path completions
        commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1",
    })
    use({

        "hrsh7th/cmp-cmdline", -- cmdline completions
        commit = "9c0e331fe78cab7ede1c051c065ee2fc3cf9432e",
    })
    use({

        "hrsh7th/cmp-nvim-lsp", -- LSP completitions
        commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
    })

    use({ "folke/todo-comments.nvim", commit = "98b1ebf198836bdc226c0562b9f906584e6c400e" })

    -- @Snippets
    use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
    use({ "rafamadriz/friendly-snippets", commit = "6227548c97d7bd7d2f5f0897814c16649fcce368" }) -- a bunch of snippets to use

    -- @LSP
    use({ "neovim/nvim-lspconfig", commit = "520c609210029e901b433c49e7c1e00dd247b47a" }) -- enable LSP

    -- LSP Installer
    use({ "williamboman/mason.nvim", commit = "ac08235f30d580f68f4170d3928ed72830072a7e" })
    use({ "williamboman/mason-lspconfig.nvim", commit = "d9365e72afb2f876a62cd3cade555dc1a95031d9" })

    use({ "jose-elias-alvarez/null-ls.nvim", commit = "753ad51790a966b42997ac935e26573fb6d5864a" }) -- for formatters and linters
    use({ "antoinemadec/FixCursorHold.nvim", commit = "5aa5ff18da3cdc306bb724cf1a138533768c9f5e" })
    use({ "tamago324/nlsp-settings.nvim", commit = "a81bfc4038212b1fa0c058fd0ac042a1c6356f23" })

    -- @Telescope
    use({ "nvim-telescope/telescope.nvim", commit = "3e944f02ff8040056b44f6a9aed48842317b33ac" })
    use({ "nvim-telescope/telescope-symbols.nvim", commit = "f7d7c84873c95c7bd5682783dd66f84170231704" })

    -- @Treesitter @SyntaxHighlighting
    use({ "lukas-reineke/indent-blankline.nvim", commit = "c15bbe9f23d88b5c0b4ca45a446e01a0a3913707" })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        -- @Note: this is great plugin for plugin development.
        -- Provides access to raw tresitter AST.
        -- use "nvim-treesitter/playground"
        commit = "840994db95313b97328f33b772cc18081baf461f",
    })

    -- @Git
    use({ "lewis6991/gitsigns.nvim", commit = "1e107c91c0c5e3ae72c37df8ffdd50f87fb3ebfa" })
    use({ "tpope/vim-fugitive", commit = "b411b753f805b969cca856e2ae51fdbab49880df" })
    -- @Navigation
    use({ "akinsho/bufferline.nvim", tag = "v2.*", commit = "fb7b17362eb6eedc57c37bdfd364f8e7d8149e31" })
    use({ "christoomey/vim-tmux-navigator", commit = "afb45a55b452b9238159047ce7c6e161bd4a9907" })

    -- @Tasks
    use({ "jedrzejboczar/toggletasks.nvim", commit = "4329ad580799f25c0a923a2d1e71a585ae0bbc48" })

    -- @C_CXX_Development
    use({ "cdelledonne/vim-cmake", commit = "621cfabc41e93ca3327d5081fc4c69d092135647" })

    -- @Web
    use({ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" })

    use({ "simrat39/rust-tools.nvim", commit = "b696e6dee1e79a53159f1c0472289f5486ac31bc" })

    use({ "mfussenegger/nvim-dap", commit = "618c068e4265e8e1f428b93868141ac92c7dde8e" })

    -- @Docker
    -- use 'jamestthompson3/nvim-remote-containers

    use({
        "ray-x/lsp_signature.nvim",
        commit = "e65a63858771db3f086c8d904ff5f80705fd962b",
    })
    use({ "windwp/nvim-autopairs", commit = "0a18e10a0c3fde190437567e40557dcdbbc89ea1" })

    -- debugger
    use({ "rcarriga/nvim-dap-ui", commit = "225115ae986b39fdaffaf715e571dd43b3ac9670" }) -- A simple UI out of the box
    use({ "theHamsta/nvim-dap-virtual-text", commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4" }) -- Virtual text for variables
    use({ "nvim-telescope/telescope-dap.nvim", commit = "b4134fff5cbaf3b876e6011212ed60646e56f060" })

    use({
        "folke/trouble.nvim",
        commit = "da61737d860ddc12f78e638152834487eabf0ee5",
    })
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
