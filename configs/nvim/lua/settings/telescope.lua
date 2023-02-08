local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

-- Disable some builtin vim plugins

local actions = require('telescope.actions')

-- local _, builtin = pcall(require, 'telescope.builtin')
-- local _, finders = pcall(require, 'telescope.finders')
-- local _, pickers = pcall(require, 'telescope.pickers')
-- local _, sorters = pcall(require, 'telescope.sorters')
-- local _, themes = pcall(require, 'telescope.themes')
-- local _, actions = pcall(require, 'telescope.actions')
-- local _, previewers = pcall(require, 'telescope.previewers')
-- local _, make_entry = pcall(require, 'telescope.make_entry')

telescope.setup({
    defaults = {
        file_ignore_patterns = {
            '.git/',
            '.cache',
            '%.o',
            '%.a',
            '%.out',
            '%.class',
            '%.pdf',
            '%.mkv',
            '%.mp4',
            '%.zip',
            '%.exe',
            '%.png',
            '*/build/**',
        },
        selection_caret = '> ',
        prompt_prefix = ' ',
        path_display = { 'smart' },
        windblend = 0,
        intitial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        border = true,
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        vimgrep_arguments = {
            'rg',
            -- "--color=never",
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim', -- add this value
        },

        mappings = {
            i = {
                ['<C-n>'] = actions.move_selection_next,
                ['<C-p>'] = actions.move_selection_previous,
                ['<leader>q'] = actions.close,
                ['<CR>'] = actions.select_default,
                ['<C-s>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ['<Tab>'] = actions.toggle_selection
                    + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection
                    + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist
                    + actions.open_qflist,
                ['<C-l>'] = actions.complete_tag,
            },
            n = {
                ['<esc>'] = actions.close,
                ['<C-d>'] = actions.delete_buffer,
                ['<CR>'] = actions.select_default,
                ['ss'] = actions.select_horizontal,
                ['vv'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ['<Tab>'] = actions.toggle_selection
                    + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection
                    + actions.move_selection_better,

                -- @Mikhail:
                -- This keybinding essentially saves selected files to the list to work with them later.
                ['l'] = actions.send_selected_to_qflist + actions.open_qflist,

                ['j'] = actions.move_selection_next,
                ['k'] = actions.move_selection_previous,
                ['H'] = actions.move_to_top,
                ['M'] = actions.move_to_middle,
                ['L'] = actions.move_to_bottom,

                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,
                ['gg'] = actions.move_to_top,
                ['G'] = actions.move_to_bottom,

                ['?'] = actions.which_key,
            },
        },
    },
    pickers = {
        builtin = {
            previewer = false,
        },
        find_files = {
            theme = 'dropdown',
            hidden = true,
            previewer = false,
        },
        live_grep = {
            only_sort_text = true,
        },
        grep_string = {
            only_sort_text = true,
            theme = 'dropdown',
        },
        buffers = {
            theme = 'dropdown',
            previewer = false,
            initial_mode = 'normal',
            mappings = {
                i = {
                    ['<C-d>'] = actions.delete_buffer,
                },
                n = {
                    ['dd'] = actions.delete_buffer,
                },
            },
        },
        planets = {
            show_pluto = true,
            show_moon = true,
        },
        git_files = {
            theme = 'dropdown',
            hidden = true,
            previewer = false,
            show_untracked = true,
        },
        lsp_references = {
            theme = 'dropdown',
            initial_mode = 'normal',
        },
        lsp_definitions = {
            theme = 'dropdown',
            initial_mode = 'normal',
        },
        lsp_declarations = {
            theme = 'dropdown',
            initial_mode = 'normal',
        },
        lsp_implementations = {
            theme = 'dropdown',
            initial_mode = 'normal',
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
})

telescope.load_extension('fzf')
telescope.load_extension('goimpl')
