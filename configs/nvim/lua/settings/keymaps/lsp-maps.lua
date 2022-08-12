-- local function lsp_keymaps(bufnr)
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
keymap("n", "<leader>77", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "gdn", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
keymap("n", "gdp", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader7>", ":lua toggle_diagnostic()<CR>", opts)
-- end
