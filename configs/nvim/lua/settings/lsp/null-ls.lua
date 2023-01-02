local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
    return
end

-- For list of builtins check:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local lsp_handlers = require('settings.lsp.handlers')

null_ls.setup({
    debug = true,
    sources = {
        diagnostics.shellcheck.with({}),
        diagnostics.golangci_lint.with({
            command = { 'golangci-lint' },
            args = {
                'run',
                '--fix=false',
                '--fast',
                '--out-format=json',
                '--path-prefix',
            },
        }),
        diagnostics.cppcheck.with({
            extra_args = {
                '--enable=style,performance,portability,warning',
                '--std=c++',
            },
        }),
        formatting.rustfmt.with({}),
        formatting.goimports.with({}),
        formatting.stylua.with({}),
    },
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
})
