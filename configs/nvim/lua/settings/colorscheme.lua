local M = {}

M.tokyo = function()
    local ok_t, tokyo = pcall(require, 'tokyonight')
    if not ok_t then
        vim.notify('Failed to init tokyonight')
    end
    tokyo.setup({
        style = 'night',
        transparent = false,
        terminal_colors = true,
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
            functions = {},
            variables = {},
            sidebars = 'dark',
            floats = 'dark',
        },
        sidebars = { 'qf', 'help' },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false, -- dims inactive windows
        lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
    })
end

M.onedark = function()
    local ok, onedark = pcall(require, 'onedark')
    if not ok then
        vim.notify('Failed to init colorscheme')
    end
    onedark.setup({
        style = 'deep',
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        cmp_itemkind_reverse = false,
        code_style = {
            comments = 'none',
            keywords = 'bold',
            functions = 'bold',
            strings = 'none',
            variables = 'none',
        },
        diagnostics = {
            darker = true,
            undercurl = true,
            background = true,
        },
    })
end

M.onedark()
M.tokyo()

return M
