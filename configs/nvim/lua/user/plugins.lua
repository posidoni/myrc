local fn = vim.fn

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

vim.g.auto_save = 1
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

vim.cmd [[
" let g:vimwiki_list = [{'path': '~/Obsidian',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]

" let g:auto_save = 0  " enable AutoSave on Vim startup
" let g:auto_save_silent = 1  " do not display the auto-save notification
" " This config is optimal to prevent save of 'utility buffers (e.g. nerdtree)'
" " let g:auto_save_events = [
"         \ "InsertLeave",
"         \"TextChanged"
"         \]
" let g:auto_save_write_all_buffers = 1

" let g:vim_git_sync_dirs = [
"     \"$HOME/Obsidian/",
"     \"$HOME/myrc/",
"     \"$HOME/Codespace/",
" \]

" let g:vim_git_sync_branch = "main"
" " Disables TemporaryWiki feature (every .md file considered as wiki)
" let g:vimwiki_global_ext = 0
" let g:vimwiki_list = [{'path': '~/Obsidian/',
"                   \ 'syntax': 'markdown', 'ext': '.md'}]
]]
-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "nathom/filetype.nvim" }
  use "lewis6991/impatient.nvim"
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
     use "numToStr/Comment.nvim" -- Easily comment stuff
    --  use "kyazdani42/nvim-web-devicons"
    --  use "kyazdani42/nvim-tree.lua"
    --  use "akinsho/bufferline.nvim"
    --  use "moll/vim-bbye"
    --  use "nvim-lualine/lualine.nvim"
    --  use "akinsho/toggleterm.nvim"
    --  use "ahmedkhalf/project.nvim"
    --  use "lukas-reineke/indent-blankline.nvim"
    --  use "goolord/alpha-nvim"
    --  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    --  use "folke/which-key.nvim"

  -- Colorschemes
  use "navarasu/onedark.nvim"
  use "olimorris/onedarkpro.nvim"


  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
--  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  -- use "nvim-treesitter/playground" -- very useful thing for developing plugins, allows easily inspect AST

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Wiki
   use "vimwiki/vimwiki"

  -- use 'ludovicchabant/vim-gutentags'
  -- use 'kkoomen/vim-doge'
  -- use 'google/vim-maktaba'
  -- use 'google/vim-codefmt'
  -- use 'google/vim-glaive'
  -- use 'tpope/vim-obsession'
  -- use 'cohama/lexima.vim'
   use '907th/vim-auto-save'
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
   use 'tpope/vim-commentary'
   use 'tpope/vim-unimpaired'
   use 'tpope/vim-fugitive'
   use 'tpope/vim-repeat'
   use 'tpope/vim-surround'
  -- use 'kshenoy/vim-signature'
   use 'MikhailKuzntsov1/vim_git_sync'
  -- use 'mattn/calendar-vim'
  -- use 'godlygeek/tabular'
  -- use 'preservim/vim-markdown'
  -- use 'ludovicchabant/vim-gutentags'
  -- use 'kkoomen/vim-doge'
  use 'christoomey/vim-tmux-navigator'
  -- use 'google/vim-maktaba'
  -- use 'google/vim-codefmt'
  -- use 'google/vim-glaive'
  -- use 'tpope/vim-obsession'

  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)



