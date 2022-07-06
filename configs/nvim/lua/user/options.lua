local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-16", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    wildoptions = "pum",
    lazyredraw = false,
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
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = true, -- display lines as one long line
    scrolloff = 10, -- is one of my fav
    sidescrolloff = 8,
    timeoutlen = 300, -- Very important setting. Experiment with it. 300 feels comfortable & usable
    colorcolumn = "81",
    belloff = "all",
    spell = false,
    cursorline = true,
    foldmethod = "indent",
    foldnestmax = 2,
    foldenable = false,
    listchars = { trail = '·', tab = '» ', extends = '›', precedes = '‹', nbsp = '·' },

    -- This setting must be set for Neovide
    -- Syntax: "fontname:h<size>"
}

-- local get_os_type = function()
--     local tmp = os.execute('uname')
--     return tmp
-- end
--
-- vim.g.ostype = get_os_type()

local fontSize = 9

-- if vim.g.ostype == 'Linux' then
--     fontSize = 9
-- end

vim.opt.guifont = "Go Mono Nerd Font:h" .. fontSize

vim.g.myfonts = {
    'FiraCode Nerd Font',
    'Go Mono Nerd Font'
}

local g = vim.g

-- See @docs for reference on @Neovide configuration:
-- https://github.com/neovide/neovide/wiki/Configuration#multigrid
g.neovide_refresh_rate = 140
g.neovide_fullscreen = false -- If this is true, it is impossible to exit fullscreen mode of NeoVide. Not recommended.

--- Input settings
g.neovide_input_use_logo = true -- Redirects [S]uper key to Nvim (Win / Opt)
g.neovide_silent = true
g.neovide_cursor_antialiasing = true
g.neovide_cursor_unfocused_outline_width = 0.125
g.neovide_cursor_animation_length = 0.0
g.neovide_cursor_trail_length = 0
g.neovide_transparency = 0.80

if g.neovide_silent == false then
    g.neovide_cursor_animation_length = 0.13
    g.neovide_cursor_trail_length = 0.8
else
    g.neovide_cursor_animation_length = 0.0
    g.neovide_cursor_trail_length = 0
end

vim.opt.wildignore = { '*.o', '*.a', '__pycache__' }
vim.opt.shortmess:append "c"

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
    vim.opt.guifont = string.format("Go Mono Nerd Font:h%d", Fontsize)
end

function DecreaseFontSize()
    Fontsize = Fontsize - 1
    vim.opt.guifont = string.format("Go Mono Nerd Font:h%d", Fontsize)
end

function SetFontSize(size)
    FontSize = size
    vim.opt.guifont = string.format("Go Mono Nerd Font:h%d", Fontsize)
end
