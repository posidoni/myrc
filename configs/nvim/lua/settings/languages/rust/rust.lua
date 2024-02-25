return {
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
        dependencies = {
            {
                'saecki/crates.nvim',
                event = { 'BufRead Cargo.toml' },
                config = function()
                    require('crates').setup()
                end,
            },
        },
    },
    -- Extend auto completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                'Saecki/crates.nvim',
                event = { 'BufRead Cargo.toml' },
                opts = {
                    src = {
                        cmp = { enabled = true },
                    },
                },
            },
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, { name = 'crates' })
        end,
    },
}
