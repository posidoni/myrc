local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

vim.cmd([[
    set termguicolors
]])

bufferline.setup({
    options = {
        themable = true,
        close_command = 'Bdelete! %d',
        show_close_icon = true,
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_tab_indicators = true,
        tab_size = 15,
        max_name_length = 18,
        always_show_bufferline = true,
        separator_style = 'thin',
        enforce_regular_tabs = false,
        style_preset = bufferline.style_preset.minimal,
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        truncate_names = true, -- whether or not tab names should be truncated
        diagnostics = 'nvim_lsp',
    },
    highlights = {
        indicator_selected = {
            guifg = {
                attribute = 'fg',
                highlight = 'Type',
            },
            guibg = {
                attribute = 'bg',
                highlight = 'Type',
            },
        },
    },
})
