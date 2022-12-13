local lsp_config_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_config_ok then
    return
end

-- IMPORTANT: SQLS does not support some of the default capabilities,
-- thus, default LSP configuration procedure can't be applied to SQLS.
-- It must be configured separately.
lspconfig.sqls.setup({
    cmd = { 'sqls', '-c', '~/.config/sqls/config.yaml' },
    filetypes = { 'sql', 'mysql', 'psql', 'pgsql' },
    single_file_support = true,
    settings = {},
})
