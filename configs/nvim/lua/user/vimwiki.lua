vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
    {
        ['path'] = '~/Obsidian',
        ['syntax'] = 'markdown',
        ['ext'] = '.md'
    },
}

vim.g.vim_git_sync_dirs = {
    '$HOME/Obsidian/',
    '$HOME/myrc/',
    '$HOME/Codespace/',
}

-- TODO: add autocommands for configuring MD edit on these wiki files
-- in particular: remove spelling, remove column, wrap lines, set filetype
