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
    ensure_installed = {
        'dockerfile-language-server',
        'awk-language-server',
        'bash-language-server',
        'chrome-debug-adapter',
        'clang-format',
        'clangd',
        'clojure-lsp',
        'cmake-language-server',
        'cmakelang',
        'codelldb',
        'codespell',
        'cpplint',
        'cpptools',
        'delve',
        'firefox-debug-adapter',
        'glow',
        'go-debug-adapter',
        'gofumpt',
        'goimports',
        'goimports-reviser',
        'golangci-lint',
        'golangci-lint-langserver',
        'golines',
        'gomodifytags',
        'gopls',
        'gotests',
        'gotestsum',
        'iferr',
        'impl',
        'json-lsp',
        'lua-language-server',
        'pyright',
        'rust-analyzer',
        'rustfmt',
        'shellcheck',
        'sqlls',
        'sqls',
        'stylua',
        'yaml-language-server',
        'yamlfmt',
        'yamllint',
    },
})
