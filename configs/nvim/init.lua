require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"

Fontsize = 15

function IncreaseFontSize()
  Fontsize = Fontsize + 1 -- Lua doesn't have increment lol
  local new_size = Fontsize
  vim.opt.guifont = string.format("FiraCode Nerd Font:%d", new_size)
end

function DecreaseFontSize()
  Fontsize = Fontsize - 1
  vim.opt.guifont = string.format("FiraCode Nerd Font:%d", Fontsize)
end
