return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    opts = {
        action = 'toggle',
        source = 'filesystem',
        position = 'left',
        reveal_force_cwd = true,
        window = {
            mappings = {
                ['s'] = {
                    'open_split',
                },
                ['v'] = {
                    'open_vsplit',
                },
            },
        },
        source_selector = {
            winbar = true, -- toggle to show selector on winbar
            statusline = true, -- toggle to show selector on statusline
            show_scrolled_off_parent_node = false, -- boolean
            sources = { -- table
                {
                    source = 'filesystem', -- string
                    display_name = ' 󰉓 Files ', -- string | nil
                },
                {
                    source = 'buffers', -- string
                    display_name = ' 󰈚 Buffers ', -- string | nil
                },
                {
                    source = 'git_status', -- string
                    display_name = ' 󰊢 Git ', -- string | nil
                },
            },
            content_layout = 'start', -- string
            tabs_layout = 'equal', -- string
            truncation_character = '…', -- string
            tabs_min_width = nil, -- int | nil
            tabs_max_width = nil, -- int | nil
            padding = 4, -- int | { left: int, right: int }
            separator = { left = '▏', right = '▕' }, -- string | { left: string, right: string, override: string | nil }
            separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
            show_separator_on_edge = true, -- boolean
            highlight_tab = 'NeoTreeTabInactive', -- string
            highlight_tab_active = 'NeoTreeTabActive', -- string
            highlight_background = 'NeoTreeTabInactive', -- string
            highlight_separator = 'NeoTreeTabSeparatorInactive', -- string
            highlight_separator_active = 'NeoTreeTabSeparatorActive', -- string
        },
    },
    config = function(_, opts)
        vim.keymap.set(
            'n',
            '<leader>o',
            ':Neotree filesystem toggle left<CR>',
            {}
        )
        vim.keymap.set(
            'n',
            '<leader>b',
            ':Neotree buffers reveal float<CR>',
            {}
        )
    end,
}
