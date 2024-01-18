return {
    {
        'folke/todo-comments.nvim',
        lazy = true,
        opts = {

            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                FIX = {
                    icon = ' ', -- icon used for the sign, and in search results
                    color = 'error', -- can be a hex color, or a named color (see below)
                    alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = {
                    icon = ' ',
                    color = 'info',
                    alt = { 'imp', 'important', 'see', 'DOC', 'SEE', 'INF' },
                },
                NOTE = { icon = '󰍨 ', color = 'hint', alt = { 'INFO' } },
                HACK = {
                    icon = ' ',
                    color = 'warning',
                    alt = { 'safety', 'Safety' },
                },
                SAFETY = { icon = ' ', color = 'warning' },
                WARN = {
                    icon = ' ',
                    color = 'warning',
                    alt = { 'WARNING', 'XXX' },
                },
                PERF = {
                    icon = '󰅒 ',
                    alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
                },
            },
            merge_keywords = true,
            highlight = {
                before = '',
                keyword = 'wide',
                after = 'fg',
                pattern = [[.*<(KEYWORDS)\s*:]],
                comments_only = true,
                max_line_len = 400,
                exclude = {},
            },
            colors = {
                error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
                warning = { 'DiagnosticWarning', 'WarningMsg', '#FBBF24' },
                info = { 'DiagnosticInfo', '#2563EB' },
                hint = { 'DiagnosticHint', '#10B981' },
                default = { 'Identifier', '#7C3AED' },
            },
            search = {
                command = 'rg',
                args = {
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                },
                pattern = [[\b(KEYWORDS):]],
            },
        },
    },
}
