" ==============================================================================
"                           Plugin Manager (vim-plug)
" ==============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))	" Install plugin manager if needed
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==============================================================================
"                                  VIM Plugins
" ==============================================================================
call plug#begin('~/.vim/plugins')
	Plug 'sheerun/vim-polyglot'				" Syntax highlighting
	Plug 'cohama/lexima.vim'				" Auto close parentheses
	Plug 'preservim/nerdtree'				" File system explorer
	Plug 'vim-airline/vim-airline'			" Status line
	Plug 'vim-airline/vim-airline-themes'	" Status line themes
	Plug 'airblade/vim-gitgutter'			" Vim diff
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
<<<<<<< HEAD
	Plug 'navarasu/onedark.nvim'
=======
>>>>>>> 69bf3f08059c0cf461aea95aa66e47832a5c8a68
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'chaoren/vim-wordmotion'
	Plug 'tpope/vim-rhubarb' 	" GitHub extension for fugitive.vim
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-surround' " Adding parenthesis
<<<<<<< HEAD
=======
	Plug 'joshdick/onedark.vim'
>>>>>>> 69bf3f08059c0cf461aea95aa66e47832a5c8a68
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
set tabstop=4								" Column count in tab character
set encoding=utf-8
set hidden
set nocompatible
set backspace=indent,eol,start
set clipboard=unnamedplus
" ==============================================================================
"                                  VIM Mapping
" ==============================================================================

map <space> 	<leader>
											" Navigating between panes
map <C-H>		<C-W><C-H>
map <C-J>		<C-W><C-J>
map <C-K>		<C-W><C-K>
map <C-L>		<C-W><C-L>
											" Open NERDTree
map <leader>o		:NERDTreeToggle<CR>
											" Open Fuzzy Finder
map <leader>g	:FZF --preview cat\ {}<CR>
											" Edit vimrc quickly
map <leader>v :sp ~/.vimrc<cr>
map <F1> :make
" ==============================================================================
"                                  Color Scheme
" ==============================================================================
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark
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

let g:fuf_file_exclude = '\v\~$|\.o$|\.pdf$|\.bak$|\.swp$|\.class|\.png$'

" Search & explore current buffers
nnoremap <silent> <Leader>b :Buffers<CR>
" Search & explore lines in current buffer
nnoremap <silent> <Leader>l :BLines<CR>
nnoremap <silent> <Leader>c :Commits<CR>

" ==============================================================================
"                              File System Explorer
" ==============================================================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
	\ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene |
	\ exe 'cd '.argv()[0] | endif
" ==============================================================================
"                                  Status Line
" ==============================================================================
let g:airline#extensions#tabline#enabled=1	" Enable tab line
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
highlight SignColumn ctermbg=bg
function! GitStatus()						" Git status to status line
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

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
