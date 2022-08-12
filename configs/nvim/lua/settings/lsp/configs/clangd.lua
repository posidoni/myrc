return {
	settings = {
		cmd = {
			"clangd",
			"--background-index",
			"--pch-storage=memory",
			"--suggest-missing-includes",
			"--clang-tidy",
			"--fallback-style=google",
			"--function-arg-placeholders",
			"--header-insertion=iwyu",
			"--header-insertion-decorators",
			"--cross-file-rename",
			"--completion-style=detailed",
			"--offset-encoding=utf-16",
			"-j=4",
		},
		init_options = {
			clangdFileStatus = true,
			usePlaceholders = true,
			completeUnimported = true,
			semanticHighlighting = true,
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "cc", "hpp", "h", "cxx" },
		root_dir = {
			".git",
			".clangd",
			".clang-tidy",
			".clang-format",
			"configure.ac",
			"build",
			"Build",
			"CMakeLists.txt",
		},
		single_file_support = true,
		offsetEncoding = { "utf-16" },
        flags = {
            debounce_text_change = 150,
        }
	},
}
