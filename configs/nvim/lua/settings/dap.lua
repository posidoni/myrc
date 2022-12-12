local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
    vim.notify("Dap not found please install it!")
    return
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

map("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<leader>bl", "<cmd>lua require'dap'.list_breakpoints()<cr>", opts)
map("n", "<leader>bc", "<cmd>lua require'dap'.clear_breakpoints()<cr>", opts)
map("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
map("n", "<leader>si", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<leader>ss", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<leader>so", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "<leader>sb", "<cmd>lua require'dap'.step_back()<cr>", opts)
map("n", "<leader>co", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<leader>cl", "<cmd>lua require'dap'.terminate()<cr>", opts)
map("n", "<leader>\\", "<cmd>lua require'dapui'.toggle()<cr>", opts)

require('dap-go').setup({
    on_attach = function()
    end
})

dap.adapters.lldb = { type = "executable", command = 'lldb-vscode', name = "lldb" }
-- Dap Setup

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp

-- 
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
    vim.notify("Dapui not found please install it!")
    return
end

dapui.setup()

local dap_vtext_ok, dap_vtext = pcall(require, "nvim-dap-virtual-text")
if not dap_vtext_ok then
    vim.notify("Dap Virtual Text not found please install it!")
    return
end

dap_vtext.setup()

-- Open UI on debugging start
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
