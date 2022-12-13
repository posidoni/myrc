local lsp_config_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_config_ok then
    return
end

-- @Warning. This is used servers. Any other servers are unused (even if installed)
local servers = {
    "sumneko_lua",
    "clangd",
    "bashls",
    "cmake",
    "jsonls",
    "yamlls",
    "dockerls",
    "gopls",
    "rust_analyzer"
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("settings.lsp.handlers").on_attach,
        capabilities = require("settings.lsp.handlers").capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, "settings.lsp.configs." .. server)

    if server == 'clangd' then
        opts.capabilities.offsetEncoding = 'utf-16'
    end

    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end

    lspconfig[server].setup(opts)
end


require("settings.lsp.handlers").setup()
require("settings.lsp.null-ls")
require("settings.lsp.mason")
