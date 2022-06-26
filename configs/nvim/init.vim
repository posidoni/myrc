" ==============================================================================
"                           Plugin Manager (vim-plug)
" ==============================================================================
            
if empty(glob('~/.vim/autoload/plug.vim'))	" Install plugin manager if needed
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install nvim plugin manager for linux
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim')) && has('unix')
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
" ==============================================================================
"                                  VIM Plugins
" ==============================================================================

call plug#begin('~/.vim/plugins')
    Plug 'sheerun/vim-polyglot'				" Syntax highlighting
    Plug 'cohama/lexima.vim'				" Auto close parentheses
    " Fira-code font with ligatures is recommended for icons to work
    Plug 'preservim/nerdtree'
    " Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug '907th/vim-auto-save'
    Plug 'vim-airline/vim-airline'			" Status line
    Plug 'vim-airline/vim-airline-themes'	" Status line themes
    Plug 'airblade/vim-gitgutter'			" Vim diff
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', { 'branch':'release',
                \ 'for': ['c', 'cpp', 'cmake', 'sh', 'json', 'vim'] }
	Plug 'navarasu/onedark.nvim'
	Plug 'tpope/vim-commentary'
    " [e - Killer feature of VsCode (line changing)
    " [<Space> , [x , [y & other
    Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
    " Adding parenthesis. Mnemonic: cs (change surround) from (a) to (b)
	Plug 'tpope/vim-surround'
    Plug 'kshenoy/vim-signature'
    " Knowledge management plugin. Fully compatible with Obsidian app links
    Plug 'vimwiki/vimwiki'

    " Note-taking & productivity plugins
    Plug 'MikhailKuzntsov1/vim_git_sync'
    Plug 'mattn/calendar-vim'
    Plug 'godlygeek/tabular', {'for':'markdown'}
    Plug 'preservim/vim-markdown', {'for':'markdown'}
    " :source %
    " :call mkdp#util#install()
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'ferrine/md-img-paste.vim', {'for':'markdown'} " <leader>ip -> img past
call plug#end()
" ==============================================================================
"                             General Configuration
" ==============================================================================
set colorcolumn=81							" Highlight 81 column
set list									" Show hidden characters
set listchars+=extends:›					" Set extends character
set listchars+=nbsp:·						" Set non-breakable space character
set listchars+=precedes:‹					" Set precedes character
set listchars+=trail:·						" Set trailing space character
set listchars+=tab:»\ |						" Set tab character
set mouse=a									" Enable mouse use in all modes
set noswapfile								" Turn off .swp file
set number									" Display line numbering
set relativenumber							" Display relative line numbering
set shiftwidth=4							" Number of spaces for autoindent
set showcmd									" Show (partial) command
set splitright								" Open new splits on the right
set splitbelow 								" Open new splits below
set tabstop=4								" Column count in tab character
set expandtab
set hidden
set nocompatible
set backspace=indent,eol,start
set clipboard=unnamedplus
set ignorecase
set smartcase
set encoding=utf-8
                                " CoC-specific configs
set nobackup
set nowritebackup
                                " Give more space for displaying messages.
set cmdheight=1
set updatetime=300
                            " Don't pass messages to |ins-completion-menu|.
set shortmess+=c
filetype plugin on
                                        " Remove trailing spaces

let g:trimFiles = [
    \"c",
    \"cpp",
    \"md",
    \"bash"
    \"wiki",
    \"vim",
    \"vimwiki",
            \]

execute "FileType " . join(g:trimFiles, ",") .
            \ " autocmd BufWritePre * %s/\s\+$//e"
" ==============================================================================
"                                  VIM Mapping
" ==============================================================================

                                        " ⭐️ Leader key
nnoremap <Space> <nop>
let mapleader=" "
                                        " Navigation between panes
map <C-H>		<C-W><C-H>
map <C-J>		<C-W><C-J>
map <C-K>		<C-W><C-K>
map <C-L>		<C-W><C-L>

nmap <silent><nowait> ss <C-W>s
nmap <silent><nowait> vv <C-W>v
nmap <silent><nowait> -- <C-W>-
nmap <silent><nowait> ++ <C-W>+
nmap <silent><nowait> >> <C-W>>
nmap <silent><nowait> << <C-W><
                            " Open NERDTree
map <leader>o		:NERDTreeToggle<CR>
                                    " Open Fuzzy Finder
map <leader>g	:FZF --preview cat\ {}<CR>
                                    " Edit vimrc quickly
map <leader>v :sp ~/.config/nvim/init.vim<CR>
noremap <TAB> %

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
                                                " Clear search highlighting
nmap <silent><esc> :noh <CR>
nmap <silent><nowait> <leader>t :vsplit term://zsh<CR>
nmap <silent><nowait> <leader>q :q<CR>
nmap <silent><nowait> <leader>y :CalendarH<CR>
" nmap <F3> :TagbarToggle<CR>
" ==============================================================================
"                             CoC Mapping & Config
" ==============================================================================
                                        " Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
                                        " Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
                                        " Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
                                        " Find symbol of current document.
nnoremap <silent><nowait> <space>u  :<C-u>CocList outline<cr>
                                        " Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
                                        " Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
                                        " Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
                                        " Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" ==============================================================================
"                                  Color Scheme & General Appearance
" ==============================================================================

let g:onedark_config = {
    \ 'style': 'deep',
    \ 'term_colors': v:true,
    \ 'ending_tildes': v:true,
    \ 'code_style' : {
        \ 'comments' : 'italic',
        \ 'keywords' : 'none',
        \ 'functions' : 'bold',
        \ 'strings' : 'italic',
        \ 'variables' : 'none',
    \    },
    \ 'diagnostics': {
        \ 'darker': v:true,
        \ 'background': v:true,
        \ 'undercurl': v:true,
    \ },
\ }
colorscheme onedark
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" let g:NERDTreeLimitedSyntax = 1 " May be turned on in case of lags
" ==============================================================================
"                                 C/C++ Development
" ==============================================================================

noremap <F1> :make<CR>
noremap <F2> :Neomake!<CR>
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
let g:neomake_open_list = 2

" ==============================================================================
"                              File System
" ==============================================================================

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
    \ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene |
    \ exe 'cd '.argv()[0] | endif
" Makes tree a bit prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" If I delete file in tree, the buffer gets closed & deleted as well
let NERDTreeAutoDeleteBuffer = 1
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
" This config is optimal to prevent save of 'utility buffers (e.g. nerdtree)'
let g:auto_save_events = [
        \ "InsertLeave",
        \"TextChanged"
        \]
let g:auto_save_write_all_buffers = 1
" Open the existing NERDTree on each new tab. (do not duplicate trees)
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" ==============================================================================
"                                  Status Line
" ==============================================================================

let g:airline#extensions#tabline#enabled=1	" Enable tab line
let g:airline#extensions#coc#enabled=1
let g:airline_theme='onedark'					" Setup Status line theme
" ==============================================================================
"                                  Git Gutter
" ==============================================================================

let g:gitgutter_max_signs=-1				" Removed limit of count signs
let g:gitgutter_sign_added='+'				" Changed sign_added
let g:gitgutter_sign_modified='>'			" Changed sign_modified
let g:gitgutter_sign_modified_removed='<'	" Changed sign_modified_removed
let g:gitgutter_sign_removed='-'			" Changed sign_removed
let g:gitgutter_sign_removed_first_line='^'	" Changed sign_removed_first_line
set signcolumn=yes							" Always have the sign column
set updatetime=250							" Update sign column
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterChangeDelete ctermfg=3
highlight GitGutterDelete ctermfg=1
" highlight SignColumn ctermbg=bg0
function! GitStatus()						" Git status to status line
let [a,m,r] = GitGutterGetHunkSummary()
return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
" ==============================================================================
"                               CoC
" ==============================================================================

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K  :call ShowDocumentation()<CR>
function! ShowDocumentation()
if CocAction('hasProvider', 'hover')
call CocActionAsync('doHover')
else
call feedkeys('K', 'in')
endif
endfunction
" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" ==============================================================================
"                               Scripts Executable
" ==============================================================================

function ChangeMode()						" Auto change of script permissions
if getline(1) =~ "^#!"
    if getline(1) =~ "bin/"
        silent !chmod a+x <afile>
    endif
endif
endfunction
autocmd BufWritePost * call ChangeMode()
" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>
" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
" ==============================================================================
"                             Vim Wiki
"                  https://github.com/vimwiki/vimwiki
" ==============================================================================

let g:vim_git_sync_dirs = [
    \"$HOME/Obsidian/",
    \"$HOME/myrc/",
\]
let g:vim_git_sync_branch = "main"
" Disables TemporaryWiki feature (every .md file considered as wiki)
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/Obsidian/',
                  \ 'syntax': 'markdown', 'ext': '.md'}]
" Image paste (Below are default variables)
autocmd FileType markdown nmap <buffer><silent> <leader>ip :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'assets'
" let g:mdip_imgname = 'image'
" MD preview (https://github.com/iamcco/markdown-preview.nvim)
nmap <C-p> <Plug>MarkdownPreview
nmap <C-m> <Plug>MarkdownPreviewStop
"" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '?${name}?'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'dark'
" ==============================================================================
"                                  Fuzzy Finder
" ==============================================================================
let g:fzf_colors = { 'fg':      ['fg', 'Normal'],
                \'bg':      ['bg', 'Normal'],
                \'hl':      ['fg', 'Comment'],
                \'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                \'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                \'hl+':     ['fg', 'Statement'],
                \'info':    ['fg', 'PreProc'],
                \'border':  ['fg', 'Ignore'],
                \'prompt':  ['fg', 'Conditional'],
                \'pointer': ['fg', 'Exception'],
                \'marker':  ['fg', 'Keyword'],
                \'spinner': ['fg', 'Label'],
                \'header':  ['fg', 'Comment'] }

let g:fuf_file_exclude = '\v\~$|*.o$|*.pdf$|*.bak$|*.swp$|*.class|*.png$'
" Search & explore current buffers
map <silent> <leader>b :Buffers<CR>
" Search & explore lines in current buffer
map <silent> <leader>l :BLines<CR>
" ==============================================================================
"                                 Git Fugitive
" ==============================================================================

nmap <silent> <F12> :Git split HEAD~1:%<CR>
nmap <silent> <F5>  :Gdiffsplit<CR>
nmap <silent> <F6>  :Git blame<CR>
" Commits fuzzy finder
map <silent> <leader>c :Commits<CR>
" ==============================================================================
"                          Vim Terminal Mode (not compatible with Vim)
" ==============================================================================

" Make terminal mode usable: map ESC -> return to normal mode
tnoremap <ESC> <C-\><C-n>

" Notes for future self: about configuring LLDB:

" You can define your own shortcuts (mappings) to control gdb, that can work in
" any window, using the TermDebugSendCommand() function.  Example: >
" 	map ,w :call TermDebugSendCommand('where')<CR>
" The argument is the gdb command.
