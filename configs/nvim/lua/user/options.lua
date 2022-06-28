local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  wildoptions = "pum",
  lazyredraw = true,
  list = true,
  pumblend = 10,                           -- Intellisense menu blenging
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  timeoutlen = 300,                        -- Very important setting. Experiment with it. 300 feels comfortable & usable
  colorcolumn = "81",
  listchars = { trail = '·', tab = '» ', extends = '›', precedes = '‹', nbsp = '·' },

  -- This setting must be set for Neovide
  -- Syntax: "fontname:h<size>"
  guifont = "FiraCode Nerd Font:h16"
}

local g = vim.g

-- https://github.com/neovide/neovide/wiki/Configuration#multigrid
g.neovide_refresh_rate = 140
g.neovide_fullscree = true

--- Input settings
g.neovide_input_use_logo = true -- Redirects [S]uper key to Nvim (Win / Opt)

-- Cursor settings. Applicable only in Neovide
if g.neovide == true then
    g.neovide_cursor_animation_length = 0.13
    g.neovide_cursor_trail_length = 0.8
    g.neovide_cursor_antialiasing = true
    g.neovide_cursor_unfocused_outline_width = 0.125
end

g.neovide_silent = true

-- @Mikhail:
-- let g:neovide_silent = v:true disables all neovide fancy cursor things
if g.neovide_silent == true then
    g.neovide_cursor_animation_length = 0
    g.neovide_cursor_trail_length = 0.0
    g.neovide_cursor_antialiasing = true
    g.neovide_cursor_unfocused_outline_width = 0.125
end

vim.opt.wildignore = { '*.o', '*.a', '__pycache__' }
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end


--[[
    @MikhailKuzntsov1
        these are very simple global lua functions for
        changing GUI font
--]]

Fontsize = 16

function IncreaseFontSize()
  Fontsize = Fontsize + 1
  vim.opt.guifont = string.format("FiraCode Nerd Font:h%d", Fontsize)
end

function DecreaseFontSize()
  Fontsize = Fontsize - 1
  vim.opt.guifont = string.format("FiraCode Nerd Font:h%d", Fontsize)
end

function SetFontSize(size)
    FontSize = size
    vim.opt.guifont = string.format("FiraCode Nerd Font:h%d", Fontsize)
end

-- For reference see this PR: https://github.com/neovim/neovim/pull/13479
