return {
    {
        'hrsh7th/nvim-cmp',
        version = false, -- last release is way too old
        lazy = false,
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            -- require('settings.cmp.copilot'),
        },
        config = function(_, _)
            local cmp = require('cmp')
            local kind_icons = {
                Text = '󰉿',
                Method = 'm',
                Function = '󰊕',
                Constructor = '',
                Field = '',
                Variable = '󰆧',
                Class = '󰌗',
                Interface = '',
                Module = '',
                Property = '',
                Unit = '',
                Value = '󰎠',
                Enum = '',
                Keyword = '󰌋',
                Snippet = '',
                Color = '󰏘',
                File = '󰈙',
                Reference = '',
                Folder = '󰉋',
                EnumMember = '',
                Constant = '󰇽',
                Struct = '',
                Event = '',
                Operator = '󰆕',
                TypeParameter = '󰊄',
            }
            -- If you want insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
            cmp.setup({
                mapping = {
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-b>'] = cmp.mapping(
                        cmp.mapping.scroll_docs(-1),
                        { 'i', 'c' }
                    ),
                    ['<C-f>'] = cmp.mapping(
                        cmp.mapping.scroll_docs(1),
                        { 'i', 'c' }
                    ),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, {
                        'i',
                        's',
                    }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, {
                        'i',
                        's',
                    }),
                },
                formatting = {
                    fields = { 'kind', 'abbr', 'menu' },
                    format = function(entry, vim_item)
                        vim_item.kind =
                            string.format('%s', kind_icons[vim_item.kind])
                        vim_item.menu = ({
                            nvim_lsp = '[LSP]',
                            copilot = '[CP]',
                            buffer = '[Buffer]',
                            path = '[Path]',
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sources = {
                    { name = 'copilot' },
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                    { name = 'path' },
                    { name = 'buffer' },
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                experimental = {
                    ghost_text = false,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                completion = {
                    border = 'rounded',
                },
                snippet = {
                    expand = function(args)
                        vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
                    end,
                },
            })

            -- `/` cmdline setup.
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                },
            })

            -- `:` cmdline setup.
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline({
                    ['<C-p>'] = cmp.mapping(
                        cmp.mapping.select_prev_item(),
                        { 'i', 'c' }
                    ),
                    ['<C-n>'] = cmp.mapping(
                        cmp.mapping.select_next_item(),
                        { 'i', 'c' }
                    ),
                }),
                sources = cmp.config.sources({
                    { name = 'path' },
                }, {
                    { name = 'cmdline' },
                }),
            })
        end,
    },
}
