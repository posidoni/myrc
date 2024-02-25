-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/clangd.lua

return {
    {
        'nvim-cmp',
        opts = function(_, opts)
            table.insert(
                opts.sorting.comparators,
                1,
                require('clangd_extensions.cmp_scores')
            )
        end,
    },
    {
        'p00f/clangd_extensions.nvim',
        lazy = true,
        opts = {
            inlay_hints = {
                inline = true,
            },
            ast = {
                role_icons = {
                    type = '',
                    declaration = '',
                    expression = '',
                    specifier = '',
                    statement = '',
                    ['template argument'] = '',
                },
                kind_icons = {
                    Compound = '',
                    Recovery = '',
                    TranslationUnit = '',
                    PackExpansion = '',
                    TemplateTypeParm = '',
                    TemplateTemplateParm = '',
                    TemplateParamObject = '',
                },
            },
        },
    },
    {
        'mfussenegger/nvim-dap',
        optional = true,
        dependencies = {
            -- Ensure C/C++ debugger is installed
            'williamboman/mason.nvim',
            optional = true,
            opts = function(_, opts)
                if type(opts.ensure_installed) == 'table' then
                    vim.list_extend(opts.ensure_installed, { 'codelldb' })
                end
            end,
        },
        opts = function()
            local dap = require('dap')
            if not dap.adapters['codelldb'] then
                require('dap').adapters['codelldb'] = {
                    type = 'server',
                    host = 'localhost',
                    port = '${port}',
                    executable = {
                        command = 'codelldb',
                        args = {
                            '--port',
                            '${port}',
                        },
                    },
                }
            end
            for _, lang in ipairs({ 'c', 'cpp' }) do
                dap.configurations[lang] = {
                    {
                        type = 'codelldb',
                        request = 'launch',
                        name = 'Launch file',
                        program = function()
                            return vim.fn.input(
                                'Path to executable: ',
                                vim.fn.getcwd() .. '/',
                                'file'
                            )
                        end,
                        cwd = '${workspaceFolder}',
                    },
                    {
                        type = 'codelldb',
                        request = 'attach',
                        name = 'Attach to process',
                        processId = require('dap.utils').pick_process,
                        cwd = '${workspaceFolder}',
                    },
                }
            end
        end,
    },
}
