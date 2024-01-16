return {
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        opts = {
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'isort', 'black' },
                javascript = { 'prettierd', 'prettier' },
                go = { 'goimports-reviser', 'gofumpt' },
                c = { 'clang_format' },
                cpp = { 'clang_format' },
                cmake = { 'cmake_format' },
                sql = { 'sql_formatter' },
                bash = { 'shfmt' },

                -- Use the "*" filetype to run formatters on all filetypes.
                ['*'] = { 'codespell' },
                ['_'] = { 'trim_whitespace' },
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
