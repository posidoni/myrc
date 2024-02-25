local map = vim.keymap.set
local opts = { noremap = false, silent = true, nowait = false }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- @Normal --
map({ 'n' }, '<ESC>', ':noh<CR>', opts)
map({ 'n' }, '<leader>q', ':q!<CR>', opts)
map({ 'n' }, '<leader>a', ':Alpha<CR>', opts)
map({ 'n' }, '<leader>n', '<C-W>n', opts)

-- close all buffers except current & restore cursor position in current buffer
map({ 'n' }, '<F6>', ':%bd |e# | bd#<cr> |\'"', opts)
map({ 'n' }, 'Y', 'yg$', opts)
map({ 'n' }, '0', '^', opts)

local lsp = vim.lsp.buf
local lenses = vim.lsp.codelens
map({ 'n' }, 'K', lsp.hover, opts)
map({ 'n' }, 'gD', lsp.declaration, opts)
map({ 'n' }, 'gd', lsp.definition, opts)
map({ 'n' }, 'gou', lsp.outgoing_calls, opts)
map({ 'n' }, 'gin', lsp.incoming_calls, opts)
map({ 'n' }, '<C-Space>', lsp.completion, opts)
map({ 'n' }, '<M-CR>', lsp.code_action, opts)
map({ 'n' }, '<leader>ll', lenses.get, opts)
map({ 'n' }, '<leader>rn', lsp.rename, opts)

map({ 'n' }, 'gi', '<cmd>TroubleToggle lsp_implementations<cr>', opts)
map({ 'n' }, 'gr', '<cmd>TroubleToggle lsp_references<cr>', opts)
map({ 'n' }, '<leader>F', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
map({ 'n' }, '<leader>f', '<cmd>TroubleToggle document_diagnostics<cr>', opts)

map({ 'n' }, '<leader>8', function()
    vim.cmd([[ LspRestart ]])
end, opts)

-- Better wrap navigation
map({ 'n' }, 'j', 'gj', opts)
map({ 'n' }, 'k', 'gk', opts)

-- Easier scrolling
map({ 'n' }, '^', '<C-d>', opts)
map({ 'n' }, '&', '<C-u>', opts)

-- Better window navigation
map({ 'n' }, '<C-h>', '<cmd>TmuxNavigateLeft<cr>', opts)
map({ 'n' }, '<C-j>', '<cmd>TmuxNavigateDown<cr>', opts)
map({ 'n' }, '<C-k>', '<cmd>TmuxNavigateUp<cr>', opts)
map({ 'n' }, '<C-l>', '<cmd>TmuxNavigateRight<cr>', opts)

-- Easier splits
map({ 'n' }, 'ss', '<C-w>s', opts)
map({ 'n' }, 'vv', '<C-w>v', opts)
map({ 'n' }, '--', '<C-w>-', opts)
map({ 'n' }, '++', '<C-w>+', opts)
map({ 'n' }, '>>', '<C-w>>', opts)
map({ 'n' }, '<<', '<C-w><', opts)

-- Navigate buffers
map({ 'n' }, '<S-l>', ':bnext<CR>', opts)
map({ 'n' }, '<S-h>', ':bprevious<CR>', opts)

-- Navigate places
map({ 'n' }, '<Tab>', '<C-o>', opts)
-- fix annoying thing when I press indent earlier than enter insert
map({ 'n' }, '<Tab>i', 'i<Tab>', opts)
map({ 'n' }, '<S-Tab>', '<C-i>', opts)

-- @Insert mode
map('i', '<C-BS>', '<C-w>', opts)
map('i', '<C-h>', '<C-w>', opts)

-- @Visual --
-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
-- Don't copy on paste
map('v', 'p', '"_dP', opts)

-- @VisualBlock --
-- Move text up and down (J, K)
map('x', 'J', ":move '>+1<CR>gv-gv", opts)
map('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- @Terminal --

-- Open terminal from N mode
map({ 'n' }, '<leader>t', ':Toggleterm float<CR>', opts)

map('t', '<ESC>', '<C-\\><C-N>', opts)
map('t', '<C-h>', '<C-\\><C-N><C-w>h', opts)
map('t', '<C-j>', '<C-\\><C-N><C-w>j', opts)
map('t', '<C-k>', '<C-\\><C-N><C-w>k', opts)
map('t', '<C-l>', '<C-\\><C-N><C-w>l', opts)

-- Disable <Backspace> & <Del>
-- keymap("i", "<BS>", "<Nop>", opts)
map('i', '<Del>', '<Nop>', opts)

--  Telescope --
local telescope = require('telescope')
local tbuiltin = require('telescope.builtin')

map(
    { 'n' },
    '<leader>im',
    telescope.extensions.goimpl.goimpl,
    { silent = true }
)

map({ 'n' }, '<leader>y', tbuiltin.builtin, opts)
map({ 'n' }, '<leader><leader>', tbuiltin.find_files, opts)
map({ 'n' }, '<leader>d', function()
    vim.cmd([[ DevdocsOpen ]])
end, opts)
map({ 'n' }, '<leader>r', tbuiltin.live_grep, opts)

-- @NvimTree --
-- local tree = require('nvim-tree.api')
-- map({ 'n' }, '<leader>o', tree.tree.toggle, { silent = true })

-- @CMake --
map({ 'n' }, '<F1>', function()
    vim.cmd('make')
end, opts)

map({ 'n' }, '<F2>', function()
    vim.cmd('CMakeGenerate')
end, opts)
map({ 'n' }, '<F3>', function()
    vim.cmd('CMakeBuild')
end, opts)

-- 🤖 @Command --
-- keymap("c", "++", "%!sudo tee > /dev/null %", opts)
-- keymap("c", "<leader><leader>", "<C-R>+", opts)
