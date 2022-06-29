local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- @Important:
-- These 'builtins' are simply name aliases. Using them DOES NOT mean
-- that we include all built-in formatters & diagnostics providers
-- these two links contain lists of tools that null-ls supports

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        diagnostics.flake8,
        code_actions.shellcheck,
        diagnostics.shellcheck,
        diagnostics.cppcheck,

        -- @Mikhail: other viable options
        -- formatting.cmake_format
        -- formatting.markdownlint
        -- diagnostics.eslint
        -- diagnostics.markdownlint
    },
})
