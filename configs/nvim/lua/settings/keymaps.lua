local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true, nowait = true }
--Remap space as leader key
keymap("n", "<Space>", "<Nop>", { nowait = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- @Normal --
keymap("n", "<ESC>", ":noh<CR>", opts)
keymap("n", "<leader>q", ":q!<CR>", opts)
keymap("n", "<leader>a", ":Alpha<CR>", opts)
keymap("n", "<leader>n", "<C-W>n", opts)
keymap("n", "<F7>", ":%bd |e# | bd#<cr> |'\"", opts) -- close all buffers except current & restore cursor position in current buffer
keymap("n", "Y", "yg$", opts)
keymap("n", "0", "^", opts)

keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "dn", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
keymap("n", "dp", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>f", "<cmd>Trouble<cr>", opts)
keymap('n', '<leader>im', [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
    { noremap = true, silent = true })
-- Better wrap navigation
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Easier scrolling
keymap("n", "^", "<C-d>", opts)
keymap("n", "&", "<C-u>", opts)

-- Easier paragraphs
keymap("n", "<F8>", "}", opts)
keymap("n", "<F9>", "{", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Easier splits
keymap("n", "ss", "<C-w>s", term_opts)
keymap("n", "vv", "<C-w>v", term_opts)
keymap("n", "--", "<C-w>-", term_opts)
keymap("n", "++", "<C-w>+", term_opts)
keymap("n", ">>", "<C-w>>", term_opts)
keymap("n", "<<", "<C-w><", term_opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Navigate places
keymap("n", "<Tab>", "<C-o>", opts)
-- fix annoying thing when I press indent earlier than enter insert
keymap("n", "<Tab>i", "i<Tab>", opts)
keymap("n", "<S-Tab>", "<C-i>", opts)

-- @Insert mode
vim.cmd([[
    noremap! <C-BS> <C-w>
    noremap! <C-h> <C-w>
]])

-- @Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Don't copy on paste
keymap("v", "p", '"_dP', opts)

-- @VisualBlock --
-- Move text up and down (J, K)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- @Terminal --
-- Open terminal from N mode
keymap("n", "<leader>t", ":vsplit term://zsh<CR>", opts)

-- Easier switching to terminal normal mode
keymap("n", "<leader>2", ":ToggleTerm<CR>", opts)
keymap("n", "<F6>", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("t", "<ESC>", "<C-\\><C-N>", term_opts)

-- Allows switching panes in terminal insert mode
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Change font size
-- @Mikhail: these bindings use custom lua
-- functions that I've defined in @file options.lua
keymap("n", "<leader>=", ":lua IncreaseFontSize()<cr>", opts)
keymap("n", "<leader>-", ":lua DecreaseFontSize()<cr>", opts)

-- Disable <Backspace> & <Del>
-- keymap("i", "<BS>", "<Nop>", opts)
keymap("i", "<Del>", "<Nop>", opts)

-- Wiki, Note-taking, Education
keymap("n", "<leader>tc", ":VimwikiTOC<CR>", opts)

-- Telescope --
keymap(
    "n",
    "<leader>y",
    "<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    opts
)

keymap(
    "n",
    "<leader><leader>",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false}))<cr>"
    ,
    opts
)
keymap(
    "n",
    "<leader>d",
    "<cmd>lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_dropdown({ previewer = false}))<cr>"
    ,
    opts
)
keymap(
    "n",
    "<leader>b",
    "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false}))<cr>",
    opts
)
keymap("n", "<leader>r", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>8", ":Telescope symbols<CR>", opts)

-- @NvimTree --
keymap("n", "<leader>o", ":NvimTreeToggle<cr>", opts)

-- @Tagbar --
keymap("n", "<leader>1", ":SymbolsOutline<cr>", opts)

-- @CMake --
keymap("n", "<F1>", ":lua Build_Current_File()<cr>", opts)
keymap("n", "<F2>", ":lua CMakeGenerate()<cr>", opts)
keymap("n", "<F3>", ":lua CMakeBuild()<cr>", opts)
keymap("n", "<F4>", ":lua Launch_executable()<cr>", opts)

-- 🤖 @Command --
-- keymap("c", "++", "%!sudo tee > /dev/null %", opts)
-- keymap("c", "<leader><leader>", "<C-R>+", opts)

Launch_executable = function()
    CMAKECMD = "open -a 'Iterm.app' ~/s21_smart_calc/build/Debug/Bin/SmartCalc.app/Contents/MacOS/SmartCalc"
    local result = vim.fn.system(CMAKECMD)
    vim.notify(result)
end

CMakeGenerate = function()
    vim.cmd("CMakeGenerate")
end

CMakeBuild = function()
    vim.cmd("CMakeBuild")
end

Build_Current_File = function()
    vim.cmd("make")
end
