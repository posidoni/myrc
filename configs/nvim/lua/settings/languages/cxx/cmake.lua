return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = function(_, opts)
            if type(opts.ensure_installed) == 'table' then
                vim.list_extend(opts.ensure_installed, { 'cmake' })
            end
        end,
    },
    {
        'nvimtools/none-ls.nvim',
        optional = true,
        opts = function(_, opts)
            local nls = require('null-ls')
            opts.sources = vim.list_extend(opts.sources or {}, {
                nls.builtins.diagnostics.cmake_lint,
            })
        end,
    },
    {
        'mfussenegger/nvim-lint',
        optional = true,
        opts = {
            linters_by_ft = {
                cmake = { 'cmakelint' },
            },
        },
    },
    {
        'mason.nvim',
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { 'cmakelang', 'cmakelint' })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                neocmake = {},
            },
        },
    },
    {
        'Civitasv/cmake-tools.nvim',
        opts = {},
        event = 'LazyFile',
        config = function(_, opts)
            local map = vim.keymap.set

            map({ 'n' }, '<F1>', function()
                vim.cmd('make')
            end, opts)

            map({ 'n' }, '<F2>', function()
                vim.cmd('CMakeGenerate')
            end, opts)
            map({ 'n' }, '<F3>', function()
                vim.cmd('CMakeBuild')
            end, opts)
        end,
    },
}
