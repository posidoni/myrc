vim.g.gutentags_enabled = 1
vim.g.gutentags_add_default_project_roots = 1
vim.g.gutentags_project_root = {
	"Makefile",
	"CMakeLists.txt",
}

vim.g.ostype = vim.fn.system("uname")

vim.g.tagbar_ctags_bin = "/Volumes/MISHA/mybrew/bin/ctags"
vim.g.gutentags_ctags_executable = "/Volumes/MISHA/mybrew/bin/ctags"

vim.g.gutentags_cache_dir = os.getenv("HOME") .. "/.cache/vim/ctags"
vim.g.gutentags_generate_on_new = 1
vim.g.gutentags_generate_on_missing = 1
vim.g.gutentags_generate_on_write = 1
vim.g.gutentags_generate_on_empty_buffer = 0

vim.g.gutentags_ctags_extra_args = {
	"--tag-relative=yes",
	"--fields=+ailmnS",
}
