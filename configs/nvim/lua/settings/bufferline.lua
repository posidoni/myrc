local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

bufferline.setup({
    options = {
        numbers = 'ordinal',
        themable = true,
        close_command = 'Bdelete! %d',
        show_close_icon = false,
        color_icons = false, -- whether or not to add the filetype icon highlights
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        modified_icon = '*',
        tab_size = 15,
        max_name_length = 18,
        always_show_bufferline = true,
        separator_style = 'thin',
        enforce_regular_tabs = false,
    },
    highlights = {
        buffer_selected = {
            bold = true,
            italic = true,
        },
    },
})
