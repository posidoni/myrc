return {
    patch_default_opts = function(default_opts)
        -- Null-ls provides essential tools for C/C++ development,
        -- however, null-ls forces 'utf-16' encoding which results in conflicts
        -- with clangd. Thus, clangd is asked to enable utf-16
        default_opts.capabilities.offsetEncoding = 'utf-16'
        default_opts.filetypes = {
            -- hack to remove 'proto' files from default
            -- filetypes (since we need to overwrite default values)
            'c',
            'cpp',
            'cuda',
            'cc',
            'hpp',
            'h',
            'cxx',
        }
    end,
    cmd = {
        'clangd',
        '--background-index',
        '--pch-storage=memory',
        '--suggest-missing-includes',
        '--clang-tidy',
        '--clang-tidy-checks=*',
        '--completion-style=detailed',
        '--header-insertion-decorators',
        '--fallback-style=google',
        '--function-arg-placeholders',
        '--header-insertion=iwyu',
        '--header-insertion-decorators',
        '--completion-style=detailed',
        '--offset-encoding=utf-16',
        '-j=4',
    },
    extensions = {
        autoSetHints = false,
        inlay_hints = {
            only_current_line = false,
            only_current_line_autocmd = 'CursorHold',
            show_parameter_hints = true,
            parameter_hints_prefix = '<- ',
            other_hints_prefix = '=> ',
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = 'Keyword',
            priority = 100,
        },
    },
    settings = {
        clangd = {
            init_options = {
                clangdFileStatus = true,
                usePlaceholders = true,
                completeUnimported = true,
                semanticHighlighting = true,
            },
            filetype = {
                'c',
                'cpp',
                'cuda',
                'cc',
                'hpp',
                'h',
                'cxx',
            },
            root_dir = {
                '.git',
                '.clangd',
                '.clang-tidy',
                '.clang-format',
                'configure.ac',
                'build/',
                'Build/',
                'CMakeLists.txt',
            },
            single_file_support = true,
            flags = {
                debounce_text_change = 150,
            },
        },
    },
}
