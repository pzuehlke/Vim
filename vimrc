"         _                        
"        (_)                       
" __   __ _  _ __ ___   _ __   ___ 
" \ \ / /| || '_ ` _ \ | '__| / __|
"  \ V / | || | | | | || |   | (__ 
"   \_/  |_||_| |_| |_||_|    \___|
"                                 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> 00 - Vundle settings
"    -> 01 - General
"    -> 02 - VIM user interface
"    -> 03 - Colors and Fonts
"    -> 04 - Files and backups
"    -> 05 - Text, tab and indent related
"    -> 06 - Visual mode related
"    -> 07 - Moving around, tabs and buffers
"    -> 08 - Status line
"    -> 09 - Editing mappings
"    -> 10 - Spell checking
"    -> 11 - Misc
"    -> 12 - Helper functions
"    -> 13 - Python configuration
"    -> 14 - C configuration
"    -> 15 - Haskell configuration
"    -> 16 - Ultisnips configuration
"    -> 17 - LaTeX configuration


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""
" => 00 - VUNDLE SETTINGS  "
""""""""""""""""""""""""""""
set nocompatible                 " be iMproved, required
filetype off                     " required
set rtp+=~/.vim/bundle/Vundle.vim    " add Vundle to runtime path
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'      " let Vundle manage Vundle, required
Plugin 'SirVer/ultisnips'          " UltiSnips
Plugin 'honza/vim-snippets'        " Collection of snippets for UltiSnips
Plugin 'tpope/vim-surround'        " Parentheses, brackets, quotes, and more
Plugin 'flazz/vim-colorschemes'    " Large collection of colorschemes
" Plugin 'dense-analysis/ale'        " Syntax checking plugin for Vim
Plugin 'scrooloose/nerdtree'       " Project and file navigation
Plugin 'bling/vim-airline'         " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
Plugin 'lervag/vimtex'             " VimTeX
Plugin 'klen/python-mode'          " Python mode (docs, refactor, lints...)
Plugin 'nvie/vim-flake8'           " Syntax and style checker for Python
Plugin 'rhysd/vim-clang-format'    " Filetype plugin for C
Plugin 'neovimhaskell/haskell-vim' " Filetype plugin for Haskell
Plugin 'wlangstroth/vim-racket'    " Filetype plugin for Racket

" All of your Plugins must be added before the following line:
call vundle#end()               " required

" Brief help for Vundle:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate     - updates plugins
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" see :h vundle for more details or wiki for FAQ


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""
" => 01 - GENERAL  "
""""""""""""""""""""
" Sets how many lines of history VIM has to remember:
set history=500

" Enable filetype plugins:
filetype plugin indent on

" Set to auto read when a file is changed from the outside:
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file:
let mapleader = "\\"

" Fast saving:
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""
"  => 02 - VIM USER INTERFACE  "
""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k;
set so=7

" Avoid garbled characters in Chinese language windows OS:
let $LANG='de'
set langmenu=de
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu:
set wildmenu

" Ignore compiled files:
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position:
set ruler

" Height of the command bar:
set cmdheight=2

" A buffer becomes hidden when it is abandoned:
set hidden

" Configure backspace so it acts as it should act:
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching:
" set ignorecase

" When searching try to be smart about cases:
set smartcase

" Highlight search results:
set hlsearch

" Activates incremental searching:
set incsearch

" Don't redraw while executing macros (good performance config):
set lazyredraw

" For regular expressions turn magic on:
set magic

" Show matching brackets when text indicator is over them:
set showmatch

" How many tenths of a second to blink when matching brackets:
set mat=2

" No annoying sound on errors:
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left:
set foldcolumn=1

" Enable folding:
set foldmethod=indent
" set foldlevel=99

" Set number of columns:
set columns=91

" Set number of lines:
set lines=53

" Set width of a line:
set textwidth=79

" Display a ruler highlighting delimiting column:
set colorcolumn=79

" Set width and height of window:
set winwidth=91
set winheight=57

" Display numbers relative to the current line:
set number relativenumber

" Force the current line to be displayed in the center of the screen:
set scrolloff=999


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""
" => 03 - COLORS AND FONTS  "
"""""""""""""""""""""""""""""
" Enable syntax highlighting:
syntax enable

" Set regular expression engine automatically:
set regexpengine=0

" Enable 256 colors palette in Gnome Terminal:
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set dark background:
set background=dark

try
colorscheme gruvbox
catch
endtry
" Other nice dark colorschemes: 
" onehalfdark badwolf tender molokai zenburn autumnleaf dawn pyte dracula
" desert jellylight jellybeans solarized Tomorrow-Night purify inkpot


" Set font:
set guifont=Hack\ Regular\ 11

" Set extra options when running in GUI mode:
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language:
set encoding=utf8

" Use Unix as the standard file type:
set ffs=unix,dos,mac

" Highlight text that goes over prescribed length:
highlight OverLength ctermbg=gray ctermfg=white guibg=#93a1a1
match OverLength /\%81v.\+/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""
" => 04 - FILES, BACKUPS AND UNDOS  "
"""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...:
" set nobackup
" set nowb
" set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" => 05 - TEXT, TABS AND INDENTATION  "
"""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs:
set expandtab

" Be smart when using tabs:
set smarttab

" 1 tab == 4 spaces:
set shiftwidth=4
set tabstop=4

" Enable linebreaks:
set lbr

set ai   "Auto indent
set si   "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""
" =>  06 - VISUAL MODE  "
"""""""""""""""""""""""""
" While in Visual mode, pressing * or # searches for the current selection:
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 07 -  MOVING AROUND, TABS, WINDOWS AND BUFFERS  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search):
" map <space> /
" map <C-space> ?

" Disable highlight when <leader><cr> is pressed:
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer:
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers:
map <leader>ba :bufdo bd<cr>

" Move to next and previous buffer:
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs:
map <leader>tn :tabnew
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab:
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path:
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer:
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers:
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!):
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Setting horizontal and vertical splits:
" set splitbelow
" set splitright

" Split navigations:
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""
" => 08 - STATUS LINE  "
""""""""""""""""""""""""
" Always show the status line:
set laststatus=2

" Format the status line:
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""
" => 09 - EDITING MAPPINGS  "
"""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character:
" map 0 ^

" Delete trailing white space on save, useful for some filetypes:
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""
" => 10 - SPELL-CHECKING  "
"""""""""""""""""""""""""""
" Pressing <leader>ss will toggle and untoggle spell checking:
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>:
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""
" => 11 - MISCELLANEOUS  "
""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up:
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble:
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble:
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off:
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""
" => 12 - HELPER FUNCTIONS  "
"""""""""""""""""""""""""""""
" Returns true if paste mode is enabled:
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer:
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""
" => 13 - PYTHON CONFIGURATION  "
"""""""""""""""""""""""""""""""""
" Configure <F5> to run a Python program:
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""
" => 14 - C CONFIGURATION  "
""""""""""""""""""""""""""""
" Configure <F8> to run a C program:
map <F8> :w <CR> :!gcc -g -Wall % && ./a.out <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""
" => 15 - HASKELL CONFIGURATION  "
""""""""""""""""""""""""""""""""""
" Haskell highlighting:
" enable highlighting of `forall`:
let g:haskell_enable_quantification = 1   
" enable highlighting of `mdo` and `rec`:
let g:haskell_enable_recursivedo = 1      
" enable highlighting of `proc`:
let g:haskell_enable_arrowsyntax = 1      
" enable highlighting of `pattern`:
let g:haskell_enable_pattern_synonyms = 1 
" enable highlighting of type roles:
let g:haskell_enable_typeroles = 1        
" enable highlighting of `static`:
let g:haskell_enable_static_pointers = 1  
" enable highlighting of backpack keywords:
let g:haskell_backpack = 1                

" Haskel indentation:
let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 4
let g:haskell_indent_after_bare_where = 4
let g:haskell_indent_do = 4
let g:haskell_indent_in = 4
let g:haskell_indent_guard = 4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""
" => 17 - ULTISNIPS CONFIGURATION  "
""""""""""""""""""""""""""""""""""""
" Set Ultisnips triggers:
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
" Set Ultisnips directories:
let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/UltiSnips', 'UltiSnips']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""
" => 18 - LATEX CONFIGURATION  "
""""""""""""""""""""""""""""""""
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Setup for syncing with pdf viewer:
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-pdf',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

" Disable messy latex indentations:
autocmd FileType tex setlocal shiftwidth=0 

" Turn on and configure default VimTeX folding:
let g:tex_fold_enabled = 0
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
        \ 'preamble' : {'enabled':1},
        \ 'comments' : {'enabled' : 1},
        \ 'envs' : {
        \   'blacklist' : [],
        \   'whitelist' : [],
        \ },
        \ 'env_options' : {},
        \ 'markers' : {},
        \ 'sections' : {
        \   'parse_levels' : 1,
        \   'sections' : [
        \     'part',
        \     'chapter',
        \     'section',
        \     'subsection',
        \     'subsubsection',
        \   ],
        \   'parts' : [
        \     'appendix',
        \     'frontmatter',
        \     'mainmatter',
        \     'backmatter',
        \   ],
        \ }
        \}
let g:vimtex_fold_manual = 1


" CREDITS:
" Initially based on the 'basic vimrc' found at:
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" For the VimTeX configuration part, see:
" https://github.com/lervag/vimtex
