local M = {}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
M.capabilities.offsetEncoding = { "utf-16 " }

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text / enable
        virtual_text = true, -- virtual text is colored text that is displayed on the right
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    local status_ok2, illuminate = pcall(require, "illuminate")
    if not status_ok2 then
        return
    end
    illuminate.on_attach(client)
    -- end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

    -- TODO: try this out with different keybinding (C-K) doesn't work as expected
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>da", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "dp", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)

    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gl",
        '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "dn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    -- @Mikhail: this line is very important. By default LSP diagnostics (for some reason?) appear in location list
    -- but it would be really clever to populate quickfix list with diagnotic.
    -- for reference see:
    --      :h vim.diagnostic.setqflist()
    --      https://github.com/neovim/neovim/pull/14736
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
end

-- @Mikhail: this variable is needed by @formattingOnSave
-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.set_contains = function(set, val)
    -- slightly modified pair here, _ is not used
    for _, value in pairs(set) do
        if value == val then return true end
    end
    return false
end

function M.set_default_formatter_for_filetypes(language_server_name, filetypes)
    if not M.set_contains(filetypes, vim.bo.filetype) then
        return
    end

    local active_servers = {}

    vim.lsp.for_each_buffer_client(0, function(client)
        table.insert(active_servers, client.config.name)
    end)

    if not M.set_contains(active_servers, language_server_name) then
        return
    end

    vim.lsp.for_each_buffer_client(0, function(client)
        if client.name ~= language_server_name then
            -- TODO FIX THIS
            -- client.resolved_capabilities = {
            --     document_formatting = false,
            --     document_range_formatting = false
            -- }

            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
    end)
end

-- ues this function to configure on configure on attach events for language serevers:
M.on_attach = function(client, bufnr)
    -- @Formatting avoid language server / formatters conflicts
    -- @cSpecific: for C/C++ formatting clangd works great, so null-ls
    -- solutions are turned off
    M.set_default_formatter_for_filetypes('sumneko_lua', { 'lua' })
    M.set_default_formatter_for_filetypes('clangd', { 'c', 'cpp' })

    -- @FormattingOnSave
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }) == 0 then
                    vim.lsp.buf.formatting_sync()
                    -- vim.lsp.buf.format({ bufnr = bufnr })
                else
                    vim.notify("Can't save current buffer! Error exists. Please, fix them first.")
                end
            end,
        })
    end

    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

return M
