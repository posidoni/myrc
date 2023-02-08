local options = {
    backup = false, -- creates a backup file
    background = 'dark',
    clipboard = 'unnamedplus',
    cmdheight = 1,
    completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
    -- fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    incsearch = true,
    ignorecase = true,                       -- ignore case in search patterns
    mouse = 'a',                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    wildoptions = 'pum',
    lazyredraw = false,
    conceallevel = 0,
    cdhome = true,
    concealcursor = 'n',
    autoread = true,
    autowrite = true,
    autowriteall = true,
    list = true,
    pumblend = 10,          -- Intellisense menu blenging
    showmode = false,       -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,
    smartcase = true,       -- smart case
    smartindent = true,     -- make indenting smarter again
    splitbelow = true,      -- force all horizontal splits to go below current window
    splitright = true,      -- force all vertical splits to go to the right of current window
    swapfile = false,       -- creates a swapfile
    -- termguicolors = true, -- set term gui colors (most terminals support this)
    undofile = true,        -- enable persistent undo
    updatetime = 300,       -- faster completion (4000ms default)
    writebackup = false,    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,       -- convert tabs to spaces
    shiftwidth = 4,         -- the number of spaces inserted for each indentation
    tabstop = 4,            -- insert 2 spaces for a tab
    number = true,          -- set numbered lines
    relativenumber = false, -- set relative numbered lines
    numberwidth = 2,        -- set number column width to 2 {default 4}
    wrap = true,            -- display lines as one long line
    linebreak = true,       -- doesn't break words when wraps lines. To move through breaked (not numbered) lines use: gj gk g$ ...
    scrolloff = 8,          -- There always be N lines belove/above cursor while scrolling
    sidescrolloff = 8,
    timeoutlen = 250,       -- Very important setting. Experiment with it. 300 feels comfortable & usable
    ttimeoutlen = 30,
    colorcolumn = '',
    belloff = 'all',
    spell = false,
    cursorline = true,
    listchars = {
        trail = '·',
        tab = '» ',
        extends = '›',
        precedes = '‹',
        nbsp = '·',
    },
    nrformats = '', -- disables vim support for binary/hex numbers (allows incrementing numbers with trailing spaces 0001, etc.)
    -- @Warning! This setting 'merges' all columns into one (i.e. folds, warnings, numbers, etc.)
    -- alternative: 'yes' (always show, to prevent screen jumping)
    signcolumn = 'yes',
}

vim.cmd([[ set termguicolors ]])

vim.opt.wildignore = { '*.o', '*.a', '__pycache__', '*node_modules/**' }

vim.opt.shortmess:append('c');
vim.opt.fillchars:append('stl: ');
vim.opt.fillchars:append('eob: ');

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

for k, v in pairs(options) do
    vim.opt[k] = v
end
