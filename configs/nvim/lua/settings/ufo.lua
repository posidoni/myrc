return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async',
    },
    event = 'VeryLazy',
    opts = {
        provider_selector = function()
            return { 'treesitter', 'indent' }
        end,
    },

    init = function()
        -- TODO: move this to options.lua
        -- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        -- vim.o.foldlevelstart = 99
        -- vim.o.foldenable = true
        -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

        -- TODO: move this to keymaps.lua
        -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

        -- require('ufo').setup({
        --     provider_selector = function(_bufnr, _filetype, _buftype)
        --         return { 'treesitter', 'indent' }
        --     end,
        -- })
    end,
}
