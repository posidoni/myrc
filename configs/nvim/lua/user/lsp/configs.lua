-- @Warning. This is used servers. Any other servers are unused (even if installed)
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
require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}
require("mason-lspconfig").setup {
    ensure_installed = servers,
}
local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
    return
end


for _, server in pairs(servers) do
    local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)

    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end

    lspconfig[server].setup(opts)
end
