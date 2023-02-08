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
        -- formatting.gofumpt.with({}), -- already defined in gopls
        -- formatting.golines.with({}),
        -- '--enable-all',
        -- '-build-tags e2e,integration,smoke',
        formatting.goimports_reviser.with({
            extra_args = {
                '-rm-unused',
                '-excludes ".git/,mocks/*go"',
                '-format',
                '-set-alias',
                '-use-cache',
            }
        }),
        diagnostics.shellcheck.with({}),
        diagnostics.cppcheck.with({
            extra_args = {
                '--enable=style,performance,portability,warning',
                '--std=c++',
            },
        }),
        -- formatting.stylua.with({}),
        formatting.rustfmt.with({}),
        formatting.autoflake.with({}),
        -- formatting.clang_format.with({
        --     -- filetypes = { 'proto', 'pb', 'protobuf' },
        -- }),
    },
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
})
