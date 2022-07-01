return {
    settings = {
        cmd = {
            "clangd",
            "--background-index",
            "--pch-storage=memory",
            "--clang-tidy",
            "--suggest-missing-includes",
            "--cross-file-rename",
            "--completion-style=detailed",
            "--offset-encoding=utf-16",
        },
        init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = true,
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_dir = {
            '.clangd',
            '.clang-tidy',
            '.clang-format',
            'compile_commands.json',
            'src/compile_commands.json',
            'compile_flags.txt',
            'configure.ac',
            '.git',
            'build/',
            'Build',
            'CMakeLists.txt'
        },
        single_file_support = true,
        offsetEncoding = "utf-16",
    },
}
