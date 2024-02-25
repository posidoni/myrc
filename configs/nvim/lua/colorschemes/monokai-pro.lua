return {
    'loctvl842/monokai-pro.nvim',
    lazy = true,
    priority = 1000,
    config = function()
        require('monokai-pro').setup({
            transparent_background = false,
            terminal_colors = true,
            devicons = true, -- highlight the icons of `nvim-web-devicons`
            styles = {
                comment = {
                    underline = true,
                    italic = true,
                },
                keyword = { strikethrough = true }, -- any other keyword
                type = { bold = true }, -- (preferred) int, long, char, etc
                storageclass = { italic = true }, -- static, register, volatile, etc
                structure = { bold = true }, -- struct, union, enum, etc
                parameter = { italic = true }, -- parameter pass in function
                annotation = { italic = true },
                tag_attribute = { italic = true }, -- attribute of tag in reactjs
            },
            filter = 'classic', -- classic | octagon | pro | machine | ristretto | spectrum
            inc_search = 'background', -- underline | background
            background_clear = {
                'float_win',
                'telescope',
                'notify',
                'bufferline', -- better used if background of `neo-tree` or `nvim-tree` is cleared
                'which-key',
                -- "toggleterm",
                -- "renamer",
                -- "nvim-tree",
                -- "neo-tree",
            },
            plugins = {
                bufferline = {},
                indent_blankline = {
                    context_highlight = 'pro', -- default | pro
                    context_start_underline = true,
                },
            },
            override = function(c)
                return {
                    ColorColumn = { bg = c.base.magenta },
                    -- Mine
                    DashboardRecent = { fg = c.base.magenta },
                    DashboardProject = { fg = c.base.blue },
                    DashboardConfiguration = { fg = c.base.white },
                    DashboardSession = { fg = c.base.green },
                    DashboardLazy = { fg = c.base.cyan },
                    DashboardServer = { fg = c.base.yellow },
                    DashboardQuit = { fg = c.base.red },
                    -- Codeium Icon
                    CmpItemKindVariable = { fg = '#09B6A2' },
                    IndentBlanklineChar = { fg = c.base.dimmed4 },
                }
            end,
        })

        vim.cmd([[ colorscheme monokai-pro ]])
    end,
}
