local lsp_config_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_config_ok then
    return
end

-- @Warning. This is used servers. Any other servers are unused (even if installed)
local servers = {
    'sumneko_lua',
    'clangd',
    'bashls',
    'cmake',
    'jsonls',
    'yamlls',
    'dockerls',
    'gopls',
    'awk_ls',
    'pyright',
    -- 'rust_analyzer' <-- Do not setup it yourself if using 'rust-tools' plugin
}

require('neodev').setup({}) -- must be setup before lspconfig.sumneko_lua.setup({}{)

local lsp_handlers = require('settings.lsp.handlers')

for _, server in pairs(servers) do
    local opts = {
        on_attach = lsp_handlers.on_attach,
        capabilities = lsp_handlers.capabilities,
    }

    local has_custom_opts, server_custom_opts =
        pcall(require, 'settings.lsp.configs.' .. server)

    if has_custom_opts then
        opts = vim.tbl_deep_extend('force', server_custom_opts, opts)

        if opts.patch_default_opts ~= nil then
            opts:patch_default_opts()
        end
    end

    lspconfig[server].setup(opts)
end

lsp_handlers.setup()
require('settings.lsp.null-ls')
