local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  wildoptions = "pum",
  lazyredraw = true,
  list = true,
  pumblend = 10,                           -- Intellisense menu blenging
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  number = true,                           -- set numbered lines
  relativenumber = true,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  timeoutlen = 300,			               -- Very important setting. Experiment with it. 300 feels comfortable & usable
  listchars = { trail = '·', tab = '» ', extends = '›', precedes = '‹', nbsp = '·' },

  -- This setting must be set for Neovide
  -- Syntax: "fontname:h<size>"
  guifont = "FiraCode Nerd Font:h15",
}

local g = vim.g

-- https://github.com/neovide/neovide/wiki/Configuration#multigrid
g.neovide_refresh_rate = 140
g.neovide_fullscree = true

--- Input settings
g.neovide_input_use_logo = true -- Redirects [S]uper key to Nvim (Win / Opt)

-- Cursor settings. Applicable only in Neovide
if g.neovide == true then
    g.neovide_cursor_animation_length = 0.13
    g.neovide_cursor_trail_length = 0.8
    g.neovide_cursor_antialiasing = true
    g.neovide_cursor_unfocused_outline_width = 0.125
end


-- @Mikhail:
-- let g:neovide_silent = v:true disables all neovide fancy cursor things
if g.neovide_silent == true then
    
end

vim.opt.wildignore = { '*.o', '*.a', '__pycache__' }
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[
    function! AdjustFontSize(amount)
    if !has("gui_running")
        return
    endif

    let l:min_font_size = 5
    let l:max_font_size = 23

    let l:font_info = GetFontInfo()
    if l:font_info.name == '' || l:font_info.size == ''
        return
    endif

    let l:font_name = l:font_info.name
    let l:font_size = l:font_info.size

    " Decrease font size.
    if a:amount == '-'
        let l:font_size = l:font_size - 1

    " Increase font size.
    elseif a:amount == '+'
        let l:font_size = l:font_size + 1

    " Use a specific font size.
    elseif str2nr(a:amount)
        let l:font_size = str2nr(a:amount)
    endif

    " Clamp font size.
    let l:font_size = max([l:min_font_size, min([l:max_font_size, l:font_size])])

    if matchstr(&guifont, ':') == '' " Linux guifont style.
        " \v           Very magical.
        " (\d+$)       Capture group:       Match [0-9] one-or-more times, at the end of the string.
        let l:font_size_pattern = '\v(\d+$)'
    else " Windows and macOS guifont style.
        " \v           Very magical.
        " (:h)@<=      Positive lookbehind: Match ':h'.
        " (\d+)        Capture group:       Match [0-9] one-or-more times.
        let l:font_size_pattern = '\v(:h)@<=(\d+)'
    endif

    " Update vim font size.
    let &guifont = substitute(&guifont, l:font_size_pattern, l:font_size, '')

    call DisplayFontInfo()
    endfunction

    function! DisplayFontSelector()
    if !has("gui_running")
        return
    endif

    " Display font selector.
    " NOTE: This only changes &guifont to '*' in terminal vim.
    set guifont=*

    call DisplayFontInfo()
    endfunction

    function! DisplayFontInfo()
    let l:font_info = GetFontInfo()
    if l:font_info.name == '' || l:font_info.size == ''
        return
    endif

    " Display font name and size.
    redraw | echomsg l:font_info.name . ' ' . l:font_info.size . '%'
    endfunction

    function! GetFontInfo()
    " Windows and macOS &guifont: Hack NF:h11:cANSI
    "                             3270Medium_NF:h10:W500:cANSI:qDRAFT
    " Linux &guifont: Hack Nerd Font Mono Regular 10

    if matchstr(&guifont, ':') == '' " Linux guifont style.
        " \v           Very magical.
        " (^.{-1,})    Capture group:       Anchored at the start of the string, match any character one-or-more times non-greedy.
        " ( \d+$)@=    Positive lookahead:  Match ' ' followed by [0-9] one-or-more times, at the end of the string.
        let l:font_name_pattern = '\v(^.{-1,})( \d+$)@='

        " \v           Very magical.
        " (\d+$)       Capture group:       Match [0-9] one-or-more times, at the end of the string.
        let l:font_size_pattern = '\v(\d+$)'
    else " Windows and macOS guifont style.
        " \v           Very magical.
        " (^.{-1,})    Capture group:       Anchored at the start of the string, match any character one-or-more times non-greedy.
        " (:)@=        Positive lookahead:  Match ':'.
        let l:font_name_pattern = '\v(^.{-1,})(:)@='

        " \v           Very magical.
        " (:h)@<=      Positive lookbehind: Match ':h'.
        " (\d+)        Capture group:       Match [0-9] one-or-more times.
        let l:font_size_pattern = '\v(:h)@<=(\d+)'
    endif

    let l:font_name = matchstr(&guifont, l:font_name_pattern)
    let l:font_size = matchstr(&guifont, l:font_size_pattern)

    return { 'name' : l:font_name, 'size' : l:font_size }
    endfunction

    " Bind Control + Mouse-wheel to zoom text.
    " NOTE: This event only works in Linux and macOS. SEE: :h scroll-mouse-wheel
    map <silent> <C-ScrollWheelDown> :call AdjustFontSize('-')<CR>
    map <silent> <C-ScrollWheelUp> :call AdjustFontSize('+')<CR>

    " Decrease font size.
    nnoremap <silent> <F11> :call AdjustFontSize('-')<CR>
    inoremap <silent> <F11> <Esc>:call AdjustFontSize('-')<CR>
    vnoremap <silent> <F11> <Esc>:call AdjustFontSize('-')<CR>
    cnoremap <silent> <F11> <Esc>:call AdjustFontSize('-')<CR>
    onoremap <silent> <F11> <Esc>:call AdjustFontSize('-')<CR>

    " Increase font size.
    nnoremap <silent> <F12> :call AdjustFontSize('+')<CR>
    inoremap <silent> <F12> <Esc>:call AdjustFontSize('+')<CR>
    vnoremap <silent> <F12> <Esc>:call AdjustFontSize('+')<CR>
    cnoremap <silent> <F12> <Esc>:call AdjustFontSize('+')<CR>
    onoremap <silent> <F12> <Esc>:call AdjustFontSize('+')<CR>

    " Set font size to my preferred size.
    nnoremap <silent> <S-F11> :call AdjustFontSize(10)<CR>
    inoremap <silent> <S-F11> <Esc>:call AdjustFontSize(10)<CR>
    vnoremap <silent> <S-F11> <Esc>:call AdjustFontSize(10)<CR>
    cnoremap <silent> <S-F11> <Esc>:call AdjustFontSize(10)<CR>
    onoremap <silent> <S-F11> <Esc>:call AdjustFontSize(10)<CR>

    " Display font selector.
    nnoremap <silent> <S-F12> :call DisplayFontSelector()<CR>
    inoremap <silent> <S-F12> <Esc>:call DisplayFontSelector()<CR>
    vnoremap <silent> <S-F12> <Esc>:call DisplayFontSelector()<CR>
    cnoremap <silent> <S-F12> <Esc>:call DisplayFontSelector()<CR>
    onoremap <silent> <S-F12> <Esc>:call DisplayFontSelector()<CR>
]]

-- vim.cmd "set whichwrap+=<,>,[,],h,l" -- when cursor reaches end of line, it goes to the next
-- vim.cmd [[set iskeyword+=-]]

-- For reference see this PR: https://github.com/neovim/neovim/pull/13479
