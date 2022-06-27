local opts = { noremap = true, silent = true }
local term_opts = { silent = true, nowait = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<ESC>", ":noh<CR>", opts)
keymap("n", "<leader>q", ":q!<CR>", {noremap = true})
keymap("n", "ff", "zf", opts)
keymap("n", "fo", "zo", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Easier splits
keymap("n", "<C-s>", "<C-w>s", term_opts)
keymap("n", "<C-v>", "<C-w>v", term_opts)
keymap("n", "--", "<C-w>-", term_opts)
keymap("n", "++", "<C-w>+", term_opts)
keymap("n", ">>", "<C-w>>", term_opts)
keymap("n", "<<", "<C-w><", term_opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Switching CTRL + W and <BS>
-- keymap("i", "<BS>", "<C-w>", opts)
-- keymap("i", "<C-w>", "<BS>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down (J, K), insert space (P)
keymap("v", "p", '"_dP', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Terminal --

-- Open terminal from N mode
keymap("n", "<leader>t", ":vsplit term://zsh<CR>", opts)

-- Easier switching to terminal normal mode
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

-- Disable <Backspace> & <Del>
-- keymap("i", "<BS>", "<Nop>", opts)
keymap("i", "<Del>", "<Nop>", opts)

-- Wiki, Note-taking, Education


-- Telescope --
keymap("n", "<leader>y", "Telescope <CR>", opts)
keymap("n", "<leader>g", ":Telescope find_files<CR>", opts)
