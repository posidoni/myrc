local M = {}

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    return
end

local lsp_sig_ok, lsp_signature = pcall(require, 'settings.lsp.lsp_signature')
if not lsp_sig_ok then
    return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.setup = function()
    local signs = {
        { name = 'DiagnosticSignError', text = '' },
        { name = 'DiagnosticSignWarn', text = '' },
        { name = 'DiagnosticSignHint', text = '' },
        { name = 'DiagnosticSignInfo', text = '' },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(
            sign.name,
            { texthl = sign.name, text = sign.text, numhl = '' }
        )
    end

    vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, {
            border = 'rounded',
        })

    vim.lsp.handlers['textDocument/signatureHelp'] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = 'rounded',
        })

    vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = false,
            signs = {
                active = signs,
            },
            severity_sort = true,
            virtual_text = true,
            update_in_insert = false,
            float = {
                focusable = true,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
        })
end

-- LSPFormatAutocmdGroup = vim.api.nvim_create_augroup('LspFormatting', {})

M.format_filter = function(_)
    -- example: disabling specific clients
    -- rename '_' into client
    -- return client.name ~= 'null-ls' and client.name ~= 'foo-bar'
    return true
end

M.on_attach = function(client, bufnr)
    lsp_signature.on_attach(lsp_signature.config, bufnr)
    -- if client.supports_method('textDocument/formatting') then
    --     vim.api.nvim_clear_autocmds({
    --         group = LSPFormatAutocmdGroup,
    --         buffer = bufnr,
    --     })
    --     vim.api.nvim_create_autocmd('BufWritePre', {
    --         group = LSPFormatAutocmdGroup,
    --         buffer = bufnr,
    --         callback = function()
    --             vim.lsp.buf.format({
    --                 filter = M.format_filter,
    --                 bufnr = bufnr,
    --                 async = false,
    --             })
    --             vim.notify(string.format('[LSP][%s] %s', client.name, err), vim.log.levels.WARN)
    --         end,
    --     })
    -- end
end

return M
