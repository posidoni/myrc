local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

toggleterm.setup({
    size = 5,
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = '/bin/bash', -- use non-default shell so terminal works instantly
    float_opts = {
        border = 'double',
        width = 130,
        height = 30,
        winblend = 10,
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
})

local Terminal = require('toggleterm.terminal').Terminal

local floating_term = Terminal:new({
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    float_opts = {
        border = 'single',
        width = 120,
        height = 30,
        winblend = 3,
        highlights = {
            border = 'FloatBorder',
            background = 'FloatBackground',
        },
    },
})

vim.keymap.set({ 'n' }, '<F4>', function()
    floating_term:toggle()
end, { noremap = false, silent = true, nowait = false })
