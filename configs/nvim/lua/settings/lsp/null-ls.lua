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
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local nulllsCapabilities = vim.lsp.protocol.make_client_capabilities()

null_ls.setup({
    debug = true,
    sources = {
        diagnostics.shellcheck.with({}),
        diagnostics.golangci_lint.with({}),
        diagnostics.cppcheck.with({
            extra_args = {
                "--enable=style,performance,portability,warning",
                "--std=c++",
            },
        }),
        formatting.rustfmt.with({}),
        formatting.goimports.with({}),
        -- @Mikhail: other viable options
        -- diagnostics.markdownlint,
        -- diagnostics.eslint,
    },
    capabilities = nulllsCapabilities,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = LSPFormatAutocmdGroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = LSPFormatAutocmdGroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = true })
                end,
            })
        end
    end,
})
