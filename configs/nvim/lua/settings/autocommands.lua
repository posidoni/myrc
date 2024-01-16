local status_ok, utils = pcall(require, 'settings.util.utility')
if not status_ok then
    vim.notify('failed to load settings.util.utility', vim.log.levels.ERROR)
    return
end

local highlight_ok, vim_highlight = pcall(require, 'vim.highlight')
if not highlight_ok then
    vim.notify('failed to load vim.highlight', vim.log.levels.ERROR)
    return
end

local autocmds = {
    {
        { 'BufRead', 'BufNewFile' },
        {
            group = '_general_settings',
            pattern = '*/node_modules/*',
            desc = 'disable diagnostic inside node modules',
            callback = function()
                vim.diagnostic.disable(0)
            end,
        },
    },
    {
        'TextYankPost',
        {
            group = '_general_settings',
            pattern = '*',
            desc = 'Highlight text on yank',
            callback = function()
                vim_highlight.on_yank({
                    higroup = 'Search',
                    timeout = 250,
                })
            end,
        },
    },
    {
        'FileType',
        {
            group = '_filetype_settings',
            pattern = 'qf',
            command = 'set nobuflisted',
        },
    },
    {
        'FileType',
        {
            group = '_filetype_settings',
            pattern = { 'gitcommit' },
            command = 'setlocal wrap spell',
        },
    },
    {
        'FileType',
        {
            group = '_buffer_mappings',
            pattern = {
                'qf',
                'help',
                'man',
                'floaterm',
                'lspinfo',
                'lsp-installer',
                'null-ls-info',
                'sqls_output',
            },
            command = 'nnoremap <silent> <buffer> q :close<CR>',
        },
    },
    {
        { 'BufWinEnter', 'BufRead', 'BufNewFile' },
        {
            group = '_format_options',
            pattern = '*',
            command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
        },
    },
    {
        'VimResized',
        {
            group = '_auto_resize',
            pattern = '*',
            command = 'tabdo wincmd =',
        },
    },
    { -- Tabs are forces for shell scripts. Spaces break heredoc.
        'FileType',
        {
            group = '_filetype_settings',
            pattern = 'sh',
            command = 'set noexpandtab',
        },
    },
}

utils.define_autocmds(autocmds)
