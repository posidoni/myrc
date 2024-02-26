return {
    {
        'ray-x/go.nvim',
        dependencies = { -- optional packages
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('go').setup({
                disable_defaults = false,
                go = 'go',
                goimport = 'goimports',
                fillstruct = 'fillstruct',
                gofmt = 'gofumpt',
                tag_transform = 'snakecase',
                tag_options = 'json=omitempty', -- sets options sent to gomodifytags, i.e., json=omitempty
                gotests_template = '', -- sets gotests -template parameter (check gotests for details)
                gotests_template_dir = '', -- sets gotests -template_dir parameter (check gotests for details)
                comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. 󰟓       
                icons = { breakpoint = '🧘', currentpos = '🏃' }, -- setup to `false` to disable icons setup
                verbose = false,
                lsp_cfg = { -- this extends default GOPLS conf from here: 'https://github.com/ray-x/go.nvim/blob/master/README.md'
                    settings = {
                        gopls = {
                            ['local'] = 'gitlab.o3.ru/,gitlab.com/gotbitio,go.avito.ru,github.com,gitlab.com',
                            gofumpt = true,
                            analyses = {
                                stubmethods = true,
                                unreachable = true,
                                assign = true,
                                atomic = true,
                                bools = true,
                                atomicalign = true,
                                buildtag = true,
                                cgocalls = true,
                                composites = true,
                                copylocks = true,
                                deepequalerrors = true,
                                embed = true,
                                errorsas = true,
                                fieldalignment = false,
                                httpresponse = true,
                                ifaceassert = true,
                                loopclosure = true,
                                lostcancel = true,
                                shadow = false,
                                unusedparams = true,
                                useany = true,
                                unusedwrite = true,
                                unusedvariable = true,
                            },
                            experimentalPostfixCompletions = true,
                        },
                    },
                },
                lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
                lsp_on_attach = nil,
                lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
                lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
                diagnostic = false,
                lsp_document_formatting = true,
                lsp_inlay_hints = {
                    enable = true,
                    style = 'eol',
                    only_current_line = false,
                    show_variable_name = true,
                    parameter_hints_prefix = '󰊕 ',
                    show_parameter_hints = true,
                    other_hints_prefix = '=> ',
                    max_len_align = false,
                    max_len_align_padding = 1,
                    right_align = true,
                    right_align_padding = 6,
                    highlight = 'Comment',
                },
                gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
                gopls_remote_auto = true, -- add -remote=auto to gopls
                gocoverage_sign = '█',
                sign_priority = 5, -- change to a higher number to override other signs
                dap_debug = true, -- set to false to disable dap
                dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
                dap_debug_gui = {}, -- bool|table put your dap-ui setup here set to false to disable
                dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

                dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pick up a random port
                dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
                dap_retries = 20, -- see dap option max_retries
                build_tags = 'e2e,integration', -- set default build tags
                textobjects = true,
                test_runner = 'go', -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
                verbose_tests = true, -- set to add verbose flag to tests deprecated, see '-v' option
                run_in_floaterm = true, -- set to true to run in a float window. :GoTermClose closes the floatterm
                floaterm = { -- position
                    posititon = 'left', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
                    width = 0.45, -- width of float window if not auto
                    height = 0.98, -- height of float window if not auto
                    title_colors = 'nord', -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
                    -- can also set to a list of colors to define colors to choose from
                    -- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
                },
                trouble = true, -- true: use trouble to open quickfix
                test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
                luasnip = false, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
                iferr_vertical_shift = 4, -- defines where the cursor will end up vertically from the beginning of if err statement
            })

            local format_sync_grp = vim.api.nvim_create_augroup('GoImport', {})
            vim.api.nvim_create_autocmd('BufWritePre', {
                pattern = '*.go',
                callback = function()
                    require('go.format').goimport()
                end,
                group = format_sync_grp,
            })
        end,
        ft = { 'go', 'gomod' },
        lazy = false,
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
    {
        'edolphin-ydf/goimpl.nvim',
        ft = { 'go' },
        lazy = true,
    },
    {
        'olexsmir/gopher.nvim',
        requires = { -- dependencies
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
    },
}
