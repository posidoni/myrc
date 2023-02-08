local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set(
        'n',
        '<C-e>',
        api.node.open.replace_tree_buffer,
        opts('Open: In Place')
    )
    vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
    vim.keymap.set(
        'n',
        '<C-r>',
        api.fs.rename_sub,
        opts('Rename: Omit Filename')
    )
    vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set(
        'n',
        'v',
        api.node.open.vertical,
        opts('Open: Vertical Split')
    )
    vim.keymap.set(
        'n',
        's',
        api.node.open.horizontal,
        opts('Open: Horizontal Split')
    )
    vim.keymap.set(
        'n',
        '<BS>',
        api.node.navigate.parent_close,
        opts('Close Directory')
    )
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
    vim.keymap.set(
        'n',
        '>',
        api.node.navigate.sibling.next,
        opts('Next Sibling')
    )
    vim.keymap.set(
        'n',
        '<',
        api.node.navigate.sibling.prev,
        opts('Previous Sibling')
    )
    vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
    vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
    vim.keymap.set(
        'n',
        'B',
        api.tree.toggle_no_buffer_filter,
        opts('Toggle No Buffer')
    )
    vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
    vim.keymap.set(
        'n',
        'C',
        api.tree.toggle_git_clean_filter,
        opts('Toggle Git Clean')
    )
    vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
    vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
    vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
    vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
    vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
    vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
    vim.keymap.set(
        'n',
        ']e',
        api.node.navigate.diagnostics.next,
        opts('Next Diagnostic')
    )
    vim.keymap.set(
        'n',
        '[e',
        api.node.navigate.diagnostics.prev,
        opts('Prev Diagnostic')
    )
    vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
    vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
    vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set(
        'n',
        'gy',
        api.fs.copy.absolute_path,
        opts('Copy Absolute Path')
    )
    vim.keymap.set(
        'n',
        'H',
        api.tree.toggle_hidden_filter,
        opts('Toggle Dotfiles')
    )
    vim.keymap.set(
        'n',
        'I',
        api.tree.toggle_gitignore_filter,
        opts('Toggle Git Ignore')
    )
    vim.keymap.set(
        'n',
        'J',
        api.node.navigate.sibling.last,
        opts('Last Sibling')
    )
    vim.keymap.set(
        'n',
        'K',
        api.node.navigate.sibling.first,
        opts('First Sibling')
    )
    vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
    vim.keymap.set(
        'n',
        'O',
        api.node.open.no_window_picker,
        opts('Open: No Window Picker')
    )
    vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
    vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
    vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
    -- vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
    vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
    vim.keymap.set(
        'n',
        'U',
        api.tree.toggle_custom_filter,
        opts('Toggle Hidden')
    )
    vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
    vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
    vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
    vim.keymap.set(
        'n',
        'Y',
        api.fs.copy.relative_path,
        opts('Copy Relative Path')
    )
    vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
    vim.keymap.set(
        'n',
        '<2-RightMouse>',
        api.tree.change_root_to_node,
        opts('CD')
    )
end

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    on_attach = my_on_attach,
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = {
        cmd = 'open',
        args = {},
    },
    filters = {
        dotfiles = false, -- false means DO NOT filter dot files (show them)
        custom = { 'node_modules', '\\.cache', '^\\.git$' },
        exclude = { '.gitignore', '.gitkeep' },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        side = 'left',
        number = false,
        relativenumber = false,
        adaptive_size = false, -- resizes window based on the longest file name
    },
    trash = {
        cmd = 'trash',
        require_confirm = true,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            -- @Mikhail: based on my workflow changing dirs feels better off
            -- If the buffer is not inside current tree, DO NOT change tree to this buffer's
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
        },
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = false,
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = 'none',
        root_folder_modifier = ':~',
        -- @Mikhail: this setting draws lines
        indent_markers = {
            enable = true,
            icons = {
                corner = '└ ',
                edge = '¦ ',
                item = '¦ ',
                none = '  ',
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = 'before',
            padding = ' ',
            symlink_arrow = ' ➛ ',
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = '',
                symlink = '',
                folder = {
                    arrow_closed = '',
                    arrow_open = '',
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = '',
                },
                git = {
                    unstaged = '',
                    staged = '',
                    unmerged = '',
                    renamed = '➜',
                    deleted = '',
                    untracked = 'U',
                    ignored = '◌',
                },
            },
        },
        -- @Mikhail: special files are underlined
        -- This feature looks absolutely great!
        special_files = {
            'Cargo.toml',
            'build/',
            'Makefile',
            'Dockerfile',
            'CMakeLists.txt',
            'CMakeLists',
        },
    },
})
