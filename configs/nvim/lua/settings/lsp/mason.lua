-- Mason is a handy LSP installer - `:Mason`
local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
    return
end

local mason_installer_ok, mason_installer = pcall(require, 'mason-lspconfig')
if not mason_installer_ok then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
})

mason_installer.setup({
    automatic_installation = true,
    ensure_installed = {},
})
