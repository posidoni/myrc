return {
    {
        'stevearc/conform.nvim',
        lazy = false,
        config = function(_, opts)
            local c = require('conform')

            c.formatters.shfmt = {
                prepend_args = { '-i', '2' },
            }

            c.formatters.sqlfluff = {
                inherit = true,
                ignore_errors = true,
                args = {
                    'fix',
                    '--force',
                    '--dialect=postgres',
                    '-',
                },
                config = require('conform.util').root_file({ '.sqlfluff' }),
            }

            c.setup(opts)
        end,
        opts = {
            log_level = vim.log.levels.DEBUG,
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'isort', 'black' },
                javascript = { 'prettierd', 'prettier' },
                go = {
                    -- 'goimports-reviser',
                    -- 'gofumpt',
                },
                c = { 'clang_format' },
                json = { 'fixjson' },
                cpp = { 'clang_format' },
                cmake = { 'cmake_format' },
                bash = {
                    'shellharden',
                },
                sql = {
                    'sqlfluff',
                },
                -- ['*'] = { 'codespell' },
                -- ['*'] = { 'injected' }, -- enables injected-lang formatting for all filetypes
            },
            format_on_save = { -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
            ignore_errors = false,
            lang_to_ext = {
                bash = { 'zsh', 'sh' },
                c_sharp = 'cs',
                elixir = 'exs',
                javascript = 'js',
                julia = 'jl',
                sql = 'sql',
                latex = 'tex',
                markdown = 'md',
                python = 'py',
                ruby = 'rb',
                rust = 'rs',
                teal = 'tl',
                typescript = 'ts',
            },
        },
    },
}
