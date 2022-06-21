-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Color schemes
  use 'navarasu/onedark.nvim'

  -- Statusline
  use {
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Comment all the things
  use("tpope/vim-commentary")

  -- The git plugin so good, it should be illegal
  use("tpope/vim-fugitive")

  -- Enable repeating supported plugin maps with "."
  use("tpope/vim-repeat")
  -- Smart camel / snake case & etc. motions
  use("chaoren/vim-wordmotion")

  -- GitHub extension for fugitive.vim
  use("tpope/vim-rhubarb")

  -- Increment dates/times
  use("tpope/vim-speeddating")

  --  Quoting/parenthesizing made simple
  use("tpope/vim-surround")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

