local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    return
end

local lps_installer_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not lps_installer_ok then
    return
end

local servers = {
    "sumneko_lua",
    "clangd",
    "pyright",
    "bashls",
    "eslint",
    "tsserver",
    "emmet_ls",
    "cmake",
    "jsonls",
    "yamlls",
    "html",
    "dockerls",
    "cssls",
    "marksman",
}
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

lsp_installer.setup({
    automatic_installation = true,
    ensure_installed = servers,
})

local lsp_config_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_config_ok then
    vim.notify("can't load lspconfig plugin :(")
    return
end

require("mason").setup()
-- @Warning. This is used servers. Any other servers are unused (even if installed)

lsp_installer.setup({
    ensure_installed = servers,
})

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("settings.lsp.handlers").on_attach,
        capabilities = require("settings.lsp.handlers").capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, "settings.lsp.configs." .. server)

    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end

    lspconfig[server].setup(opts)
end
require("settings.lsp.handlers").setup()
require("settings.lsp.null-ls")
