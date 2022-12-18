local ts_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ts_ok then
    return
end

treesitter.setup({
    ensure_installed = { 'bash', 'lua', 'go' }, -- :TSInstall all to install all
    sync_install = false,
    ignore_install = { 'phpdoc' },
    highlight = {
        enable = 'enable',
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { 'yaml' },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
