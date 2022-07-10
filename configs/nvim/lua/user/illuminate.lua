vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
vim.api.nvim_set_keymap("n", "\\", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
