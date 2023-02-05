local rust_tools_found, rust = pcall(require, 'rust-tools')
if not rust_tools_found then
    vim.notify('Rust tools not found', vim.log.levels.WARN)
    return
end

rust.setup({
    tools = { -- rust-tools options
        -- how to execute terminal commands
        -- options right now: termopen / quickfix
        executor = require('rust-tools/executors').termopen,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,

        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = '<- ',

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = '=> ',

            -- whether to align to the lenght of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = 'Comment',
        },

        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {

            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                { '╭', 'FloatBorder' },
                { '─', 'FloatBorder' },
                { '╮', 'FloatBorder' },
                { '│', 'FloatBorder' },
                { '╯', 'FloatBorder' },
                { '─', 'FloatBorder' },
                { '╰', 'FloatBorder' },
                { '│', 'FloatBorder' },
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false,
        },

        crate_graph = {
            backend = 'x11',
            output = nil,
            full = true,
            enabled_graphviz_backends = {
                'bmp',
                'cgimage',
                'canon',
                'dot',
                'gv',
                'xdot',
                'xdot1.2',
                'xdot1.4',
                'eps',
                'exr',
                'fig',
                'gd',
                'gd2',
                'gif',
                'gtk',
                'ico',
                'cmap',
                'ismap',
                'imap',
                'cmapx',
                'imap_np',
                'cmapx_np',
                'jpg',
                'jpeg',
                'jpe',
                'jp2',
                'json',
                'json0',
                'dot_json',
                'xdot_json',
                'pdf',
                'pic',
                'pct',
                'pict',
                'plain',
                'plain-ext',
                'png',
                'pov',
                'ps',
                'ps2',
                'psd',
                'sgi',
                'svg',
                'svgz',
                'tga',
                'tiff',
                'tif',
                'tk',
                'vml',
                'vmlz',
                'wbmp',
                'webp',
                'xlib',
                'x11',
            },
        },
    },
    server = {
        standalone = true,
        checkOnSave = {
            allFeatures = true,
        },
    },
    dap = {
        adapter = {
            type = 'executable',
            command = 'lldb-vscode',
            name = 'rt_lldb',
        },
    },
})
