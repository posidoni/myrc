local opts = { noremap = true, silent = true }
local term_opts = { silent = true, nowait = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "<Nop>", { nowait = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- @Normal --
keymap("n", "<ESC>", ":noh<CR>", opts)
keymap("n", "<leader>q", ":q!<CR>", opts)
keymap("n", "<leader>a", ":Alpha<CR>", opts)
keymap("n", "<leader>n", "<C-W>n", opts)

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
keymap("n", "<S-Tab>", "<C-i>", opts)

-- @Folding
keymap("n", "ff", "za", opts)
keymap("n", "fg", "zA", opts)
keymap("n", "fj", "zj", opts) -- next folding
keymap("n", "fk", "zk", opts) -- prev folding
keymap("v", "f", "zf", opts)

-- these must be remapped like that
vim.keymap.set("n", "zO", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
keymap("n", "fo", "zR", opts) -- @Mnemonic: fold open
keymap("n", "fc", "zM", opts) -- @Mnemonic: fold close

-- @Insert mode
vim.cmd([[
    noremap! <C-BS> <C-w>
    noremap! <C-h> <C-w>
]])

-- @Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- @VisualBlock --
-- Move text up and down (J, K)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- @Terminal --

-- Open terminal from N mode
keymap("n", "<leader>t", ":vsplit term://zsh<CR>", opts)

-- Easier switching to terminal normal mode
keymap("n", "<leader>2", ":ToggleTerm<CR>", opts)
keymap("t", "<ESC>", "<C-\\><C-N>", term_opts)

-- Allows switching panes in terminal insert mode
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Disabling arrows --
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Up>", "<Nop>", opts)

keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)
keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)

keymap("v", "<Right>", "<Nop>", opts)
keymap("v", "<Up>", "<Nop>", opts)
keymap("v", "<Left>", "<Nop>", opts)
keymap("v", "<Right>", "<Nop>", opts)

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
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false}))<cr>",
	opts
)
keymap(
	"n",
	"<leader>d",
	"<cmd>lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_dropdown({ previewer = false}))<cr>",
	opts
)
keymap(
	"n",
	"<leader>b",
	"<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false}))<cr>",
	opts
)
keymap("n", "<leader>r", ":Telescope live_grep<CR>", opts)

-- @NvimTree --
keymap("n", "<leader>o", ":NvimTreeToggle<cr>", opts)

-- @Tagbar --
keymap("n", "<leader>1", ":TagbarToggle<cr>", opts)

-- @CMake --
keymap("n", "<F1>", ":make<cr>", opts)
keymap("n", "<F2>", "<Plug>(CMakeGenerate)", opts)
keymap("n", "<F3>", "<Plug>(CMakeBuild)", opts)
keymap("n", "<F4>", ":lua Launch_executable()<cr>", opts)
Launch_executable = function()
	CMAKECMD = "open -a 'Iterm.app' ~/s21_smart_calc/build/Debug/Bin/SmartCalc.app/Contents/MacOS/s21_smart_calc"
	local result = vim.fn.system(CMAKECMD)
	vim.notify(result)
end

-- @LSP_Diagnostics
keymap("n", "<leader>7", "<Plug>(toggle-lsp-diag)", opts)
