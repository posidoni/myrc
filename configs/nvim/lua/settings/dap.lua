local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then
    vim.notify('Dap not found', vim.log.levels.ERROR)
    return
end
local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then
    vim.notify('DapUI not found', vim.log.levels.ERROR)
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

set('n', '<leader>b', dap.toggle_breakpoint, opts)
set('n', '<leader>cc', dap.clear_breakpoints, opts)
set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition:'))
end, opts)

set('n', '<leader>ss', dap.step_over, opts) -- next (next source line)
set('n', '<F5>', dap.continue, opts) -- till next breakpoint
set('n', '<F6>', dap.step_over, opts) -- next (next source line, do not step into fns)
set('n', '<F7>', dap.step_into, opts) -- next source line, step into fns
set('n', '<leader>so', dap.step_out, opts)

-- set('n', '<leader>bl', dap.list_breakpoints, opts)
-- set('n', '<leader>cl', dap.terminate, opts)
-- set('n', '<leader>sb', dap.step_back, opts)

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

dapui.setup({
    controls = {
        element = 'repl',
        enabled = true,
        icons = {
            pause = '',
            play = '',
            run_last = '',
            step_back = '',
            step_into = '',
            step_out = '',
            step_over = '',
            terminate = '',
        },
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
        border = 'single',
        mappings = {
            close = { 'q', '<Esc>' },
        },
    },
    force_buffers = true,
    icons = {
        collapsed = '',
        current_frame = '',
        expanded = '',
    },
    layouts = {
        {
            elements = {
                {
                    id = 'scopes',
                    size = 0.25,
                },
                {
                    id = 'breakpoints',
                    size = 0.25,
                },
                {
                    id = 'stacks',
                    size = 0.25,
                },
            },
            position = 'left',
            size = 60,
        },
        {
            elements = {
                {
                    id = 'repl',
                    size = 0.5,
                },
                {
                    id = 'console',
                    size = 0.5,
                },
                {
                    id = 'watches',
                    size = 0.25,
                },
            },
            position = 'bottom',
            size = 10,
        },
    },
    mappings = {
        edit = 'e',
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        repl = 'r',
        toggle = 't',
    },
    render = {
        indent = 1,
        max_value_lines = 100,
    },
})

dap_vtext.setup()

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close() -- do not close DAP UI after process is terminated
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

vim.tbl_deep_extend('force', dap, conf)
