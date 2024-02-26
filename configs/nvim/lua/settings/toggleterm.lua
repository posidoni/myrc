return {
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        opts = {
            open_mapping = '<leader>t',
            size = 10,
            display_name = '🚀 Terminal',
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            auto_scroll = true,
            persist_size = true,
            close_on_exit = true,
            dir = 'git_dir',
            direction = 'float',
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
            winbar = {
                enabled = false,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end,
            },
        },
        keys = {
            { '<leader>t', mode = 'n' },
            { '<leader>g', mode = 'n' },
            { '<leader>d', mode = 'n' },
            { '<leader>k', mode = 'n' },
        },
        config = function(_, opts)
            local toggleterm = require('toggleterm')
            toggleterm.setup(opts)

            local Terminal = require('toggleterm.terminal').Terminal

            local baseTerminal = Terminal:new({
                display_name = '🦀',
                hidden = true,
                dir = 'git_dir',
                close_on_exit = true,
                start_in_insert = true,
                insert_mappings = true,
            })

            local lazygit = vim.deepcopy(baseTerminal, false)
            local lazydocker = vim.deepcopy(baseTerminal, false)
            local k9s = vim.deepcopy(baseTerminal, false)

            lazydocker.cmd = 'lazydocker'
            lazygit.cmd = 'lazygit'
            k9s.cmd = 'k9s'

            lazydocker.display_name = '🐳 Containerd'
            lazygit.display_name = '🔮 Git'
            k9s.display_name = '🚀 K8s'

            vim.keymap.set('n', '<leader>g', function()
                lazygit:toggle(10, 'float')
            end, { noremap = true, silent = true })

            vim.keymap.set('n', '<leader>d', function()
                lazydocker:toggle(10, 'float')
            end, { noremap = true, silent = true })

            vim.keymap.set('n', '<leader>k', function()
                k9s:toggle(10, 'float')
            end, { noremap = true, silent = true })
        end,
    },
}
