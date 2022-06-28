local fn = vim.fn

-- @brief: disables built-in plugins to boost performance

local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
 vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify('Error! Packer has failed to init!')
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

vim.g.auto_save = 0
vim.g.auto_save_silent = 1
vim.g.auto_save_write_all_buffers = 1
vim.g.auto_save_events = {
    "InsertLeave",
    "TextChanged",
}

vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
    {
        ['path'] = '~/Obsidian',
        ['syntax'] = 'markdown',
        ['ext'] = '.md'
    }
}

vim.g.vim_git_sync_dirs = {
    '$HOME/Obsidian/',
    '$HOME/myrc',
    '$HOME/Codespace/',
}

vim.g.vim_git_sync_branch = 'main'

-- Install your plugins here
return packer.startup(function(use)

  -- @Performance --
  use "nathom/filetype.nvim"
  use "lewis6991/impatient.nvim"

  -- @PluginManagement
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins

  -- @FileSystem
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use '907th/vim-auto-save'
  use 'MikhailKuzntsov1/vim_git_sync'

  use "akinsho/bufferline.nvim"
 --  use "moll/vim-bbye"
 --  use "nvim-lualine/lualine.nvim"
 --  use "akinsho/toggleterm.nvim"
 --  use "ahmedkhalf/project.nvim"
 --  use "lukas-reineke/indent-blankline.nvim"
 --  use "goolord/alpha-nvim"
 --  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
 --  use "folke/which-key.nvim"

  -- @VanillaLike_Helpers
  use 'tpope/vim-obsession'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'kshenoy/vim-signature'
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- @Colorschemes
  use "navarasu/onedark.nvim"

  -- @Completition
  use {
      "hrsh7th/nvim-cmp",       -- The completion plugin
      "L3MON4D3/LuaSnip",       -- snippet engine, required for completition

      -- @SourcesOfCompletition
      "hrsh7th/cmp-buffer",     -- buffer completions
      "hrsh7th/cmp-path",       -- path completions
      "hrsh7th/cmp-cmdline",    -- cmdline completions
      "hrsh7th/cmp-nvim-lsp",   -- LSP completitions
    }

  -- @Snippets
  -- use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- @LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  --  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- @Telescope
  use "nvim-telescope/telescope.nvim"

  -- @Treesitter @TS
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",

  -- "JoosepAlviste/nvim-ts-context-commentstring"
  -- @Note: this is great plugin for plugin development.
  -- Provides access to raw tresitter AST.
  -- use "nvim-treesitter/playground"
  }

  -- @Git
  use "lewis6991/gitsigns.nvim"
  use 'tpope/vim-fugitive'

  -- @Wiki, @NoteTaking
  use "vimwiki/vimwiki"

  -- @Navigation
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
  -- use 'godlygeek/tabular'
  -- use 'preservim/vim-markdown'
  use 'christoomey/vim-tmux-navigator'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

