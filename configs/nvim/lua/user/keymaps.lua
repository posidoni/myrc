local opts = { noremap = true, silent = true }
local term_opts = { silent = true, nowait = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "<Nop>", { nowait = true })
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
keymap("n", "<leader>q", ":q!<CR>", opts)
keymap("n", "ff", "zf", opts)
keymap("n", "fo", "zo", opts)

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

-- Insert --
-- Switching CTRL + W and <BS>
-- keymap("i", "<BS>", "<C-w>", opts)
-- keymap("i", "<C-w>", "<BS>", opts)
-- keymap("i", "<C-w>", "<C-BS>", opts)

-- Workaround for mapping CTRL + BS in terminal vim
-- https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word

vim.cmd [[
    noremap! <C-BS> <C-w>
    noremap! <C-h> <C-w>
]]

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

-- Change font size
-- @Mikhail: these bindings use custom lua
-- functions that I've defined in @file options.lua
keymap("n", "<leader>+", ":lua IncreaseFontSize()<cr>", opts)
keymap("n", "<leader>-", ":lua DecreaseFontSize()<cr>", opts)

-- Disable <Backspace> & <Del>
-- keymap("i", "<BS>", "<Nop>", opts)
keymap("i", "<Del>", "<Nop>", opts)

-- Wiki, Note-taking, Education


-- Telescope --
keymap("n", "<leader>y", ":Telescope <CR>", opts)
keymap("n", "<leader>g",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false}))<cr>"
    , opts)
keymap("n", "<leader>d",
    "<cmd>lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_dropdown({ previewer = false}))<cr>"
    , opts)
keymap("n", "<leader>b",
    "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false}))<cr>",
    opts)
keymap("n", "<leader>r", ":Telescope live_grep<CR>", opts)

-- @NvimTree --
keymap("n", "<leader>o", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>1", ":TagbarToggle<cr>", opts)

-- @Copilot --
--                                                 *g:copilot_filetypes*
-- g:copilot_filetypes     A dictionary mapping file types to their enabled
--                         status.  Most file types are enabled by default, so
--                         generally this is used for opting out.
-- >
--                         let g:copilot_filetypes = {
--                               \ 'xml': v:false,
--                               \ }
-- <
--                         Disabling all file types can be done by setting the
--                         special key "*".  File types can then be turned back
--                         on individually.
-- >
--                         let g:copilot_filetypes = {
--                               \ '*': v:false,
--                               \ 'python': v:true,
--                               \ }
-- <
--                                                 *b:copilot_enabled*
-- b:copilot_enabled       Set to v:false to disable GitHub Copilot for the
--                         current buffer.  Or set to v:true to force enabling
--                         it, overriding g:copilot_filetypes.
--
--                                                 *g:copilot_node_command*
-- g:copilot_node_command  Tell Copilot what `node` binary to use with
--                         g:copilot_node_command. This is useful if the `node`
--                         in your PATH is an unsupported version.
-- >
--                         let g:copilot_node_command =
--                               \ "~/.nodenv/versions/16.15.0/bin/node"
keymap("i", "<leader>3", ":call copilot#Accept(\"<TAB>\")<CR>", opts)
vim.g.copilot_no_tab_map = true
--
-- MAPS                                            *copilot-maps*
--
--                                                 *copilot-i_<Tab>*
-- Copilot.vim uses <Tab> to accept the current suggestion.  If you have an
-- existing <Tab> map, that will be used as the fallback when no suggestion is
-- displayed.
--
--                                                 *copilot#Accept()*
-- If you'd rather use a key that isn't <Tab>, define an <expr> map that calls
-- copilot#Accept().  Here's an example with CTRL-J:
-- >
--         imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
--         let g:copilot_no_tab_map = v:true
-- <
-- The argument to copilot#Accept() is the fallback for when no suggestion is
-- displayed.  In this example, a regular carriage return is used.  If no
-- fallback is desired, use an argument of "" (an empty string).
--
-- Other Maps ~
--
--                                                 *copilot-i_CTRL-]*
-- <C-]>                   Dismiss the current suggestion.
-- <Plug>(copilot-dismiss)
--
--                                                 *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)
