require('settings.impatient')
require('settings.packer')
-----------------------------------
require('settings.plugins')
require('settings.colorscheme')
require('settings.options')
require('settings.keymaps')
require('settings.cmp')
require('settings.lsp')
require('settings.ufo')
require('settings.telescope')
require('settings.autopairs')
require('settings.todo-comments')
require('settings.treesitter')
require('settings.illuminate')
require('settings.comment')
require('settings.gitsigns')
require('settings.nvim-tree')
require('settings.lualine')
require('settings.project')
require('settings.alpha')
require('settings.autocommands')
require('settings.bufferline')
require('settings.indentline')
require('settings.cmake')
require('settings.toggleterm')
require('settings.trouble')
require('settings.dap')
require('settings.lsp.go')
require('settings.lsp.sql')
require('settings.lsp.mason')
require('settings.lsp.rust')

vim.cmd([[
    if exists('g:started_by_firenvim')
        au TextChanged * ++nested write
        au TextChangedI * ++nested write
        let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
        let g:EditorConfig_disable_rules = ['']
    endif
]])
