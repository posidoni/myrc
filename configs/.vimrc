"<< ==============================================================================
"                           Plugin Manager (vim-plug)
" ==============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))	" Install plugin manager if needed
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set backspace=indent,eol,start

" ==============================================================================
"                                  VIM Plugins
" ==============================================================================
call plug#begin('~/.vim/plugins')
	Plug 'morhetz/gruvbox'					" Color scheme
	Plug 'sheerun/vim-polyglot'				" Syntax highlighting
	Plug 'jceb/vim-orgmode'					" Org mode for Vim
	Plug 'cohama/lexima.vim'				" Auto close parentheses
	Plug 'preservim/nerdtree'				" File system explorer
	Plug 'junegunn/rainbow_parentheses.vim'	" Colored parentheses
	Plug 'vim-syntastic/syntastic'			" Syntax checks
	Plug 'vim-airline/vim-airline'			" Status line
	Plug 'vim-airline/vim-airline-themes'	" Status line themes
	Plug 'bfrg/vim-cpp-modern'				" C/C++ syntax
	Plug 'airblade/vim-gitgutter'			" Vim diff
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
set listchars=tab:»\ |						" Set tab character
set mouse=a									" Enable mouse use in all modes
set noswapfile								" Turn off .swp file
set number									" Display line numbering
set relativenumber							" Display relative line numbering
set shiftwidth=4							" Number of spaces for autoindent
set showcmd									" Show (partial) command
set splitright								" Open new splits on the right
set tabstop=4								" Column count in tab character
set hidden
set nocompatible
syntax on									" Syntax highlighting

" ==============================================================================
"                                  VIM Mapping
" ==============================================================================
											" Switch to left split
map <space> 	<leader>
map <C-H>		<C-W><C-H>
											" Switch to lower split
map <C-J>		<C-W><C-J>
											" Switch to upper split
map <C-K>		<C-W><C-K>
											" Switch to right split
map <C-L>		<C-W><C-L>
map <F7>		gg=G
											" Open NERDTree
map <leader>o		:NERDTreeToggle<CR>
											" Open Fuzzy Finder
map <leader>g	:FZF --preview cat\ {}<CR>

" Autosave all *md, *c, and other code files

" Edit vimrc quickly
map <leader>v :sp ~/.vimrc<cr>

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
"                                  Color Scheme
" ==============================================================================
let g:gruvbox_contrast_dark='hard'			" Dark mode contrast
let g:gruvbox_italic=1						" Enable italic text
let g:gruvbox_italicize_strings=1			" Enable italic for comments
set background=dark							" Change background color
colorscheme gruvbox							" Setup color scheme

" ==============================================================================
"                             Auto close parentheses
" ==============================================================================
let g:lexima_enable_basic_rules = 1			" Basic rules
let g:lexima_enable_newline_rules = 1		" New line rules

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
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>c :Commits<CR>

" ==============================================================================
"                              File System Explorer
" ==============================================================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
	\ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene |
	\ exe 'cd '.argv()[0] | endif

" ==============================================================================
"                              Rainbow parentheses
" ==============================================================================
augroup rainbow_parentheses					" Colored parentheses for *.c files
	autocmd! BufNewFile,BufRead *.c :RainbowParentheses
augroup END
let g:rainbow#blacklist = [248, 250]		" Exclude colors

" ==============================================================================
"                                   Syntastic
" ==============================================================================
"let g:syntastic_auto_loc_list=1				" Auto closing when no errors occur
let dirs=['../../include', '../../libft/include']	" Include dirs
let dirs=['../include', '../libft/include']	" Include dirs
let dirs+=['include', 'libft/include']		" Include dirs
let dirs+=['tests/include']					" Include test dirs
let g:syntastic_c_include_dirs=dirs			" Set include dirs
let g:syntastic_c_compiler_options='-ansi'	" ANSI C Standard
let g:syntastic_check_on_open=1				" Enable check on open
let g:syntastic_check_on_wq=0				" Disable check on exit
let g:syntastic_enable_highlighting=1		" Highlight errors
let g:syntastic_enable_signs=0				" Disable signs
function! SyntasticCheckHook(errors)		" Size for split of errors list
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction

" ==============================================================================
"                                  Status Line
" ==============================================================================
let g:airline#extensions#tabline#enabled=1	" Enable tab line
let g:airline_theme='deus'					" Setup Status line theme

" ==============================================================================
"                                  C/C++ Syntax
" ==============================================================================
let g:cpp_member_highlight=1				" Highlight structure member

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

