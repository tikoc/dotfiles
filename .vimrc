"config - Last Update: 11/01/2017 Tom Chung 
set nocompatible
set undofile
set noswapfile
if !isdirectory($HOME ."/.vim/backup")
	call mkdir($HOME . "/.vim/backup","p")
endif
if !isdirectory($HOME ."/.vim/undo")
	call mkdir($HOME . "/.vim/undo","p")
endif
set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
set undodir=~/.vim/undo//
" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
	execute 'mkdir -p ~/.vim/plugged'
execute 'mkdir -p ~/.vim/autoload'
" Download the actual plugin manager
execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'captbaritone/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'fxn/vim-monochrome'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf',{ 'rtp': 'vim/'}
" Plug 'jacoborus/tender'
Plug 'tikoc/tendercontrast.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'

" indent style
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'

" Make commenting easier
Plug 'tpope/vim-commentary'

" Split and join lines of code intelligently
Plug 'AndrewRadev/splitjoin.vim'

" Fancy statusline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vastly improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript'

" Change brackets and quotes
Plug 'tpope/vim-surround'
" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'

"Fuzzy file finder
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Scroll bar display (have performance issue when split)
" Plug 'lornix/vim-scrollbar'

" html MatchTag
Plug 'Valloric/MatchTagAlways'

" fugitive vim git plugin
Plug 'tpope/vim-fugitive'

" Unimpaired Vim bracket mappings
Plug 'tpope/vim-unimpaired'

"-----------------------------------------
" for block comment
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_php = 1
let g:NERDAltDelims_smarty = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'php': { 'left': '/**','right': '*/', 'leftAlt': '//' , 'rightAlt': '//'},
														\	'smarty': { 'left': '{{*', 'right': '*}}', 'leftAlt': '<!--', 'rightAlt': '-->' }
														\ }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"-----------------------------------------

" php coding standard fix (not yet install php-cs-fixer)
" Plug 'stephpy/vim-php-cs-fixer'

" XML HTML close tag
Plug 'sukima/xmledit'

" Emmet - html css abbreviations
" ctrl y ,
Plug 'mattn/emmet-vim'

" SCSS syntax color
Plug 'cakebaker/scss-syntax.vim'

" Class function explorer with ctags
Plug 'majutsushi/tagbar'

" Tabularize /=   to reformat .ini style
Plug 'godlygeek/tabular'

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Syntax highlight for vue
Plug 'posva/vim-vue'

" prettier
Plug 'prettier/vim-prettier'
nmap <Leader>t <Plug>(Prettier)


" ESlint 
Plug 'w0rp/ale'
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1



call plug#end()
filetype plugin on
set hidden
set tabstop=4
set shiftwidth=4
set backspace=2
set expandtab
set number
set t_Co=256
set cursorline
set hlsearch
syntax on
set clipboard=unnamed
set ignorecase
set smartcase
set smartindent
set cindent
set diffopt+=iwhite

" set incsearch
"php file also use html snippnets
autocmd BufRead,BufNewFile *.php set filetype=php.html
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
"ts file use js syntax
autocmd BufNewFile,BufRead *.ts set syntax=javascript
" <----- Key Map -----------

" inoremap <C-i> <Home>
map <F8> :w !php -l<CR>
" toggle line number
nmap \l :setlocal number!<CR>
" toggle paste
nmap \o :set paste!<CR>
" F5 change buffer with list
" nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <F11> :bp<CR>
nnoremap <silent> <C-h> :bp<CR>
nnoremap <silent> <F10> <C-w>w
" map <TAB> <C-w>w
" Up/ Down with wrapped lines
nnoremap j gj
nnoremap k gk
" fugitive Gdiff quickfix list 
nmap ]g :only\|cnext\|Gvdiff\|cc<CR>
nmap [g :only\|cprevious\|Gvdiff\|cc<CR>
" fugitive Gstatus
nmap <silent> <C-g> :Gstatus<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" ----- End of Key Map ----->
" Plugin Setting
let g:fzf_layout= { 'down' : '~100%'}
" enable tender airline theme
let g:tender_airline = 1
" set airline theme
let g:airline_theme = 'onehalfdark'
" show status
set laststatus=2
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = '>'
" set left separator which are not 
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
" Fix NERDTree Arrow dir
let g:NERDTreeDirArrows=0
" MatchTagAlways for html tag
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'tpl' : 1,
    \ 'php' : 1,
    \}
" MAtchTagAlways jump to tag
nnoremap <leader>5 :MtaJumpToOtherTag<cr>
" set background
set background=dark
" colorscheme
colorscheme tendercontrast
" set Indent guides
" set ts=2 sw=2 et
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#1c1c1c ctermbg=234
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#303030 ctermbg=236
" let g:indent_guides_start_level= 2
" let g:indent_guides_guide_size = 1

" Format setting / no auto comment next line
au FileType * set fo-=c fo-=r fo-=o

" Key binding
map <C-n> :NERDTreeToggle<CR>
" toggleScrollbar
" map <leader>sb :call ToggleScrollbar()<cr>

" Goto File and create if not exist
:map <leader>gf :e <cfile><cr>
