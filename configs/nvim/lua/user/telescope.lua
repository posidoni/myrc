local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

-- @Mikhail:
-- :h telescope.setup for reference
-- I duplicated some default features to have a place where I can easily
-- tweak these settings & try out new layouts

telescope.setup {
  defaults = {
    -- Patterns use Lua regex syntax
    file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
        "%.pdf", "%.mkv", "%.mp4", "%.zip", "%.exe", "%.png"},

    selection_caret = "> ",
    prompt_prefix = "🔎",
    path_display = { "smart" },
    windblend = 10,
    intitial_mode = "insert",
    border = "true",

    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,

        ["<leader>q"] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
      },

    -- @Mikhail:
    -- few remarks on my telescope workflow
    -- the only option to quit telescope easily is from normal mode with esc
    -- this is done deliberately to motivate me use normal mode in telescope more often,
    -- since N-Telescope is extremely powerful

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["ss"] = actions.select_horizontal,
        ["vv"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

        -- @Mikhail:
        -- This keybinding essentially saves selected files to the list to work with them later.
        ["<leader>l"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        -- Telescope has great help menu. This thing is really worth using.
        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      preview = false,
      hidden = true
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
