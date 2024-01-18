return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            {
                'williamboman/mason-lspconfig.nvim',
                event = 'VeryLazy',
                opts = {

                    automatic_installation = true,
                    ensure_installed = {},
                },
            },
        },
        event = 'VeryLazy',
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        },
    },
}
