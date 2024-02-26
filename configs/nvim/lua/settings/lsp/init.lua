local lsp_config_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_config_ok then
    return
end

-- @Warning. These are used servers. Any other servers are unused (even if installed)
local servers = {
    -- C / C++ / ASM
    'clangd',
    'cmake',
    'asm_lsp',
    'autotools_ls',
    -- Shell
    'bashls',
    'awk_ls',
    -- Json / yaml / html
    'jsonls',
    'yamlls',
    'html',
    --
    'lua_ls',
    'gopls',
    'pyright',
    'solc',
    'eslint',
    'tsserver',
    'stylelint_lsp',
    -- 🐳 Docker
    'intelephense',
    'terraformls',
    'docker_compose_language_service',
    'dockerls',
    'cssls',
    'cssmodules_ls',
    'eslint',
    'html',
    -- 'rust_analyzer' <-- 🦀 Do not setup it yourself if using separate plugin
}

require('neodev').setup({}) -- must be called before lspconfig.sumneko_lua.setup({})

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

    lspconfig[server].setup(opts) -- call setup for each server
end

lsp_handlers.setup()
