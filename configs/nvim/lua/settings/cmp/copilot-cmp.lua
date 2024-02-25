return {
    'zbirenbaum/copilot-cmp',
    lazy = true,
    config = function()
        require('copilot').setup({
            suggestion = { enabled = true },
            panel = { enabled = false },
            filetypes = {
                ['*'] = true, -- disable for all other filetypes and ignore default `filetypes`
            },
        })
    end,
}
