local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
    vim.notify('Dap not found', 'error')
    return
end
local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
    vim.notify('DapUI not found', 'error')
    return
end
local dap_vtext_ok, dap_vtext = pcall(require, 'nvim-dap-virtual-text')
if not dap_vtext_ok then
    vim.notify('Dap Virtual Text not found please install it!')
    return
end
local ok, tscope = pcall(require, 'telescope')
if ok then
    tscope.load_extension('dap')
end

local set = vim.keymap.set
local opts = { noremap = false, silent = true }

set('n', '<leader>bb', dap.toggle_breakpoint, opts)
set('n', '<leader>bl', dap.list_breakpoints, opts)
set('n', '<leader>bc', dap.clear_breakpoints, opts)
set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition:'))
end, opts)
set('n', '<leader>si', dap.step_into, opts)
set('n', '<leader>ss', dap.step_over, opts)
set('n', '<leader>so', dap.step_out, opts)
set('n', '<leader>sb', dap.step_back, opts)
set('n', '<leader>co', dap.continue, opts)
set('n', '<leader>cl', dap.terminate, opts)
set('n', '<leader>\\', dapui.toggle, opts)

require('dap-go').setup({
    on_attach = function() end,
})

local conf = {
    adapters = {
        lldb = { type = 'executable', command = 'lldb-vscode', name = 'lldb' },
    },
    configurations = {
        cpp = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input(
                        'Path to executable: ',
                        vim.fn.getcwd() .. '/',
                        'file'
                    )
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        },
    },
}
conf.configurations.c = conf.configurations.cpp

vim.fn.sign_define(
    'DapBreakpoint',
    { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' }
)

dapui.setup()
dap_vtext.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

vim.tbl_deep_extend('force', dap, conf)
