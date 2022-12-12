local status_ok, utils = pcall(require, "settings.util.utility")
if not status_ok then
    return
end

local autocmds = {
    {
        "TextYankPost",
        {
            group = "_general_settings",
            pattern = "*",
            desc = "Highlight text on yank",
            callback = function()
                require("vim.highlight").on_yank { higroup = "Search", timeout = 250 }
            end,
        },
    },
    {
        "FileType",
        {
            group = "_filetype_settings",
            pattern = "qf",
            command = "set nobuflisted",
        },
    },
    { --- Git commit messages
        "FileType",
        {
            group = "_filetype_settings",
            pattern = { "gitcommit", "markdown" },
            command = "setlocal wrap spell",
        },
    },
    {
        "FileType",
        {
            group = "_buffer_mappings",
            pattern = { "qf", "help", "man", "floaterm", "lspinfo", "lsp-installer", "null-ls-info" },
            command = "nnoremap <silent> <buffer> q :close<CR>",
        },
    },
    {
        { "BufWinEnter", "BufRead", "BufNewFile" },
        {
            group = "_format_options",
            pattern = "*",
            command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
        },
    },
    {
        "VimResized",
        {
            group = "_auto_resize",
            pattern = "*",
            command = "tabdo wincmd =",
        },
    },
    {
        "TabNewEntered",
        {
            group = "_change_cwd",
            pattern = "*",
            callback = function()
                local path = vim.fn.expand("<amatch>")
                if not utils.is_directory(path) then
                    path = vim.fn.fnamemodify(path, ":h")
                end
                vim.fn.execute("cd " .. "path")
            end,
        }
    },
    { -- Tabs are forces for shell scripts. Spaces break heredoc.
        "FileType",
        {
            group = "_filetype_settings",
            pattern = "sh",
            command = "set noexpandtab",
        },
    },
}

utils.define_autocmds(autocmds)
