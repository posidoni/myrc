local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus",
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	fileencoding = "utf-16", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	incsearch = true,
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	wildoptions = "pum",
	lazyredraw = false,
	conceallevel = 2,
	concealcursor = "n",
	-- these AW commands
	autowrite = true,
	autowriteall = true,
	list = true,
	pumblend = 10, -- Intellisense menu blenging
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 2, -- set number column width to 2 {default 4}
	wrap = true, -- display lines as one long line
	linebreak = true, -- doesn't break words when wraps lines. To move through breaked (not numbered) lines use: gj gk g$ ...
	scrolloff = 10, -- is one of my fav
	sidescrolloff = 8,
	timeoutlen = 250, -- Very important setting. Experiment with it. 300 feels comfortable & usable
	ttimeoutlen = 30,
	colorcolumn = "81",
	belloff = "all",
	spell = false,
	cursorline = true,
	foldmethod = "expr",
	foldenable = false,
	listchars = { trail = "·", tab = "» ", extends = "›", precedes = "‹", nbsp = "·" },
	nrformats = "", -- disables vim support for binary/hex numbers (allows incrementing numbers with trailing spaces 0001, etc.)
	-- @Warning! This setting 'merges' all columns into one (i.e. folds, warnings, numbers, etc.)
	-- alternative: 'yes' (always show, to prevent screen jumping)
	signcolumn = "yes",
}

vim.opt.guifont = "FiraCode Nerd Font Mono:h9"

local g = vim.g

vim.cmd([[
set autoread
aut FocusGained,BufEnter * checktime
set foldexpr=nvim_treesitter#foldexpr()
set sessionoptions-=buffers
]])

-- Autoread buffer on an external change
vim.cmd([[ set autoread ]])
vim.cmd([[ au FocusGained,BufEnter * checktime ]])

-- See @docs for reference on @Neovide configuration:
-- https://github.com/neovide/neovide/wiki/Configuration#multigrid
g.neovide_refresh_rate = 140
g.neovide_fullscreen = false -- If this is true, it is impossible to exit fullscreen mode of NeoVide. Not recommended.

--- Input settings
g.neovide_input_use_logo = true -- Redirects [S]uper key to Nvim (Win / Opt)
g.neovide_silent = true
g.neovide_cursor_antialiasing = true
g.neovide_cursor_unfocused_outline_width = 0.125
g.neovide_cursor_animation_length = 0
g.neovide_cursor_trail_length = 0
g.scroll_animation_length = 0
-- g.neovide_transparency = 0.80

vim.opt.wildignore = { "*.o", "*.a", "__pycache__" }
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

--[[
    @MikhailKuzntsov1
    @brief: these are very simple global lua functions for changing GUI font
--]]

Fontsize = 16

function IncreaseFontSize()
	Fontsize = Fontsize + 1
	vim.opt.guifont = string.format("FiraCode Nerd Font Mono:h%d", Fontsize)
end

function DecreaseFontSize()
	Fontsize = Fontsize - 1
	vim.opt.guifont = string.format("FiraCode Nerd Font Mono:h%d", Fontsize)
end

function SetFontSize(size)
	FontSize = size
	vim.opt.guifont = string.format("FiraCode Nerd Font Mono:h%d", Fontsize)
end
