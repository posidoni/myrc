return {
	settings = {
		cmd = { "clangd" , "--background-index" },
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
		root_dir = {
			  '.clangd',
			  '.clang-tidy',
			  '.clang-format',
			  'compile_commands.json',
			  'compile_flags.txt',
			  'configure.ac',
			  '.git'
			},
		single_file_support = true,
	},
}
