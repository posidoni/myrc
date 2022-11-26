local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- @Important:
-- These 'builtins' are simply name aliases. Using them DOES NOT mean
-- that we include all built-in formatters & diagnostics providers
-- these two links contain lists of tools that null-ls supports

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local _ = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        diagnostics.shellcheck.with({
        }),
        diagnostics.golangci_lint.with({
            cmd = { "golangci-lint" },
        }),

        -- @Mikhail: other viable options
        -- diagnostics.markdownlint,
        -- diagnostics.eslint,
    }
})
