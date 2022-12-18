local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

toggleterm.setup({
    size = 5,
    open_mapping = '<F5>',
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
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
