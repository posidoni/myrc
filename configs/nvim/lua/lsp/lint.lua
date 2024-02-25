-- 'mfussenegger/nvim-lint' is an alternative to now deprecated 'null-ls'

-- Good reference:
-- https://github.com/doctorfree/nvim-lazyman/blob/main/lua/utils/linter.lua

return {
    'mfussenegger/nvim-lint',
    lazy = false,
    config = function()
        local lint = require('lint')
        local linters = require('lint').linters

        -- local linterConfig = vim.fn.stdpath('config') .. '.linter_configs'

        lint.linters_by_ft = {
            -- lua = { 'luacheck' },
            css = { 'stylelint' },
            sh = {},
            markdown = { 'markdownlint' },
            cpp = {
                'cpplint',
                'cppcheck',
                -- 'clangtidy'
            },
            go = { 'golangcilint' },
            yaml = { 'yamllint' },
            python = { 'pylint' },
            gitcommit = {},
            json = {
                'jsonlint',
            },
            javascript = {},
            typescript = {},
            toml = {},
            text = {},
        }

        -- use for codespell for all except bib and css
        for ft, _ in pairs(lint.linters_by_ft) do
            if ft ~= 'bib' and ft ~= 'css' then
                table.insert(lint.linters_by_ft[ft], 'codespell')
            end
        end

        linters.codespell.args = {
            '--ignore-words',
            '--builtin=rare,clear,informal,code,names,en-GB_to_en-US',
        }

        -- linters.yamllint.args = {
        --     '--config-file',
        --     linterConfig .. '/yamllint.yaml',
        --     '--format=parsable',
        --     '-',
        -- }

        -- linters.markdownlint.args = {
        --     '--disable=no-trailing-spaces', -- not disabled in config, so it's enabled for formatting
        --     '--disable=no-multiple-blanks',
        --     '--config=' .. linterConfig .. '/markdownlint.yaml',
        -- }

        vim.api.nvim_create_autocmd(
            { 'BufReadPost', 'InsertLeave', 'TextChanged', 'FocusGained' },
            {
                callback = function()
                    vim.defer_fn(require('lint').try_lint, 1)
                end,
            }
        )
    end,
}
