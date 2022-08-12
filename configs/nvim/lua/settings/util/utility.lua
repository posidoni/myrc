local M = {}
local uv = vim.loop

--- Checks whether a given path exists and is a file.
--@param path (string) path to check
--@returns (bool)
function M.is_file(path)
    local stat = uv.fs_stat(path)
    return stat and stat.type == "file" or false
end

--- Checks whether a given path exists and is a directory
--@param path (string) path to check
--@returns (bool)
function M.is_directory(path)
    local stat = uv.fs_stat(path)
    return stat and stat.type == "directory" or false
end

--- Clean autocommand in a group if it exists
--- This is safer than trying to delete the augroup itself
---@param name string the augroup name
function M.clear_augroup(name)
    -- defer the function in case the autocommand is still in-use
    local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = name })
    if not exists then
        Log:debug("ignoring request to clear autocmds from non-existent group " .. name)
        return
    end
    vim.schedule(function()
        local status_ok, _ = xpcall(function()
            vim.api.nvim_clear_autocmds { group = name }
        end, debug.traceback)
        if not status_ok then
            Log:warn("problems detected while clearing autocmds from " .. name)
            Log:debug(debug.traceback())
        end
    end)
end

--- Create autocommand groups based on the passed definitions
--- Also creates the augroup automatically if it doesn't exist
---@param definitions table contains a tuple of event, opts, see `:h nvim_create_autocmd`
function M.define_autocmds(definitions)
    for _, entry in ipairs(definitions) do
        local event = entry[1]
        local opts = entry[2]
        if type(opts.group) == "string" and opts.group ~= "" then
            local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
            if not exists then
                vim.api.nvim_create_augroup(opts.group, {})
            end
        end
        vim.api.nvim_create_autocmd(event, opts)
    end
end

M.opts = { noremap = true, silent = true }
M.term_opts = { silent = true, nowait = true }
M.map = function(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, M.opts)
end

M.keymap = vim.api.nvim_set_keymap


return M
