_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath("cache") .. "/luacache_chunks",
	},
	modpaths = {
		enable = true,
		path = vim.fn.stdpath("cache") .. "/luacache_modpaths",
	},
}

require("user.impatient")
require("user.plugins")
require("user.options")
require("user.keymaps")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.lualine")
require("user.project")
require("user.alpha")
require("user.whichkey")
require("user.autocommands")
require("user.bufferline")
require("user.indentline")
require("user.cmake")
require("user.toggleterm")
require("user.folding")
require("user.webdev")
require("user.symbols-outline")
require("user.toggletasks")
require("user.neorg")
-- require("user.dap")
