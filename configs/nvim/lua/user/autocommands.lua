vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _comp_prog
    autocmd!
    " autocmd BufRead,BufNewFile */Codespace/** <Plug>(toggle-lsp-diag-off)
  augroup end
]]
--
---------k-------------------------------------------------------------------------------------------
-- VIM GIT SYNC PLUGIN
----------------------------------------------------------------------------------------------------

--[[
    @TODO:
    Implement sync of all specified branches.
    Make vim git sync branch an array.

    This probably might be complicated & slow due to the nature
    of git commit. Although, it is definitely worth implementing the feature
    to allow working with multiple git branches.

    vim.g.sync_all_branches = true
--]]
-- asdf
vim.g.vim_git_sync_branch = 'main'
vim.g.vim_sync_commit_msg = ' [Sync] ' .. os.date()

vim.g.pull_events = {
    -- 'BufReadPre', -- before starting to edit a new buffer, before reading file into memory
    'VimEnter',
}

vim.g.commit_events = {
    'VimLeave',
}

vim.g.push_events = {
    'VimLeave',
}

local syncBuffers = {
    '*.vimwiki',
    '*.md',
    '*.txt',
    '*.html',
    '*.lua'
}

vim.g.vim_git_sync_dirs = {
    '$HOME/Obsidian/',
    '/home/posidoni/myrc/',
    '$HOME/Codespace/',
}

-- Lua functions
PullAll = function()
    for _, dir in ipairs(vim.g.vim_git_sync_dirs) do
        vim.fn.system("git -C " .. dir .. " pull origin " .. vim.g.vim_git_sync_branch .. " ")
    end
end

CommitAll = function()
    for _, dir in ipairs(vim.g.vim_git_sync_dirs) do
        vim.fn.system("git -C " .. dir .. " commit -am \'" .. vim.g.vim_sync_commit_msg .. "\' ")
    end
end
-- asdfasd
PushAll = function()
    CommitAll()

    for _, dir in ipairs(vim.g.vim_git_sync_dirs) do
        vim.fn.system("git -C " .. dir .. " push origin " .. vim.g.vim_git_sync_branch .. " ")
    end
end

local GitSyncGroupID = vim.api.nvim_create_augroup("VimGitSync", {
    clear = true
})

vim.api.nvim_create_autocmd(vim.g.pull_events, {
    group = GitSyncGroupID,
    desc = 'Pulls git repositories for specified dirs on \
    start of the development sessions (launching Vim)',
    pattern = syncBuffers,
    callback = PullAll,
})

-- vim.api.nvim_create_autocmd(vim.g.commit_events, {
--     group = GitSyncGroupID,
--     desc = 'Commits changes in all git repositories for specified dirs \
--     at the end of the development session (exiting Vim)',
--     pattern = syncBuffers,
--     callback = CommitAll,
-- }) -

vim.api.nvim_create_autocmd(vim.g.push_events, {
    group = GitSyncGroupID,
    desc = 'Pushes changed in all git repositories for specified dirs \
    at the end of the development sessios (exiting Vim)',
    pattern = syncBuffers,
    callback = PushAll,
})
