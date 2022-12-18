local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    vim.notify('Error! Packer has failed to init!')
    return
end

local plugins_found, plugins = pcall(require, 'settings.plugins')
if not plugins_found then
    vim.notify('Plugins not found', 'critical')
    return
end

-- Have packer use a popup window
packer.init({
    ensure_dependencies = true, -- Should packer install plugin dependencies?
    snapshot = nil, -- Name of the snapshot you would like to load at startup
    --  snapshot_path        = join_paths(stdpath 'cache', 'packer.nvim'), -- Default save directory for snapshots
    --   package_root         = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
    --    compile_path         = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
    plugin_package = 'packer', -- The default package for plugins
    max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
    auto_clean = true, -- During sync(), remove unused plugins
    compile_on_sync = true, -- During sync(), run packer.compile()
    disable_commands = false, -- Disable creating commands
    opt_default = false, -- Default to using opt (as opposed to start) plugins
    transitive_opt = true, -- Make dependencies of opt plugins also opt by default
    transitive_disable = true, -- Automatically disable dependencies of disabled plugins
    auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
    preview_updates = false, -- If true, always preview updates before choosing which plugins to update, same as `PackerUpdate --preview`.
    git = {
        cmd = 'git', -- The base command for git operations
        subcommands = { -- Format strings for git subcommands
            update = 'pull --ff-only --progress --rebase=false',
            install = 'clone --depth %i --no-single-branch --progress',
            fetch = 'fetch --depth 999999 --progress',
            checkout = 'checkout %s --',
            update_branch = 'merge --ff-only @{u}',
            current_branch = 'branch --show-current',
            diff = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
            diff_fmt = '%%h %%s (%%cr)',
            get_rev = 'rev-parse --short HEAD',
            get_msg = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
            submodules = 'submodule update --init --recursive --progress',
        },
        depth = 1, -- Git clone depth
        clone_timeout = 60, -- Timeout, in seconds, for git clones
        default_url_format = 'https://github.com/%s', -- Lua format string used for "aaa/bbb" style plugins
    },
    display = {
        non_interactive = false, -- If true, disable display windows for all operations
        compact = false, -- If true, fold updates results by default
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
        open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
        working_sym = '⟳', -- The symbol for a plugin being installed/updated
        error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
        done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
        removed_sym = '-', -- The symbol for an unused plugin which was removed
        moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
        header_sym = '━', -- The symbol for the header line in packer's display
        show_all_info = true, -- Should packer show all update details automatically?
        prompt_border = 'double', -- Border style of prompt popups.
        keybindings = { -- Keybindings for the display window
            quit = 'q',
            toggle_update = 'u', -- only in preview
            continue = 'c', -- only in preview
            toggle_info = '<CR>',
            diff = 'd',
            prompt_revert = 'r',
        },
    },
    luarocks = {
        python_cmd = 'python', -- Set the python command to use for running hererocks
    },
    log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
    profile = {
        enable = false,
        threshold = 0, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
    },
    autoremove = false, -- Remove disabled or unused plugins without prompting the user
})

local disabled_built_ins = {
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logipat',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'matchit',
    'matchparen',
    'tar',
    'tarPlugin',
    'rrhelper',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin',
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g['loaded_' .. plugin] = 1
end

packer.startup(plugins)
