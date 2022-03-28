set nocompatible              " be iMproved, required
filetype off                  " required
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-latex/vim-latex'
Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim' 
" Plugin 'klen/python-mode'
Plugin 'chriskempson/tomorrow-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'tmhedberg/SimpylFold'
" Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" setting horizontal and vertical splits
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
	syntax on
endif

" setting up pyflakes

let python_highlight_all=1
syntax on

" nerd tree settings
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NE

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
" if has("autocmd") au BufReadPost * if line("'\"") > 1 && line("'\"") <=
" line("$") | exe "normal! g'\"" | endif
" endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set guifont=Hack\ Regular\ 11
set showcmd		" Show (partial) command in status line.
let loaded_mathparen = 1
set wildmode=longest,list
" set showmatch		" Show matching brackets.
" set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set backspace=indent,eol,start
set hidden		" Hide buffers when they are abandoned
" set mouse=a		" Enable mouse usage (all modes)
set ruler
set columns=91
set lines=56
set textwidth=79
set formatoptions+=t
set colorcolumn=79
set winwidth=91
set winheight=57
" Highlight text that goes over prescribed length
highlight OverLength ctermbg=gray ctermfg=white guibg=#93a1a1
match OverLength /\%81v.\+/
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
syntax enable
set autoread
" let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme gruvbox
" colorscheme base16-tomorrow-night
" autumnleaf dawn pyte jellylight jellybeans gruvbox Tomorrow-Night

set scrolloff=999

" Source a global configuration file if available
if filereadable("/etc/vimrc.local")
  source /etc/vimrc.local
endif

set number relativenumber

" ##################### Latex-Suite #############################
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 -src-specials -interaction=nonstopmode'
let g:Tex_GotoError=0
let g:Imap_FreezeImap=1
let g:Tex_SmartKeyBS = 0
let g:Tex_SmartKeyQuote = 0
let g:Tex_SmartKeyDot = 0
let g:Imap_UsePlaceHolders = 0
let g:Tex_Menus = 0
"
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
" Setting ultisnips directories
let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/UltiSnips', 'UltiSnips']


" ##################### Key Remaps #############################
" nmap oo ok
" nmap OO Oj
map <leader>c :w<cr><leader>ll
map gb lbi{ea}
" map g$ lbi$ ea $
map Y y$
" map gp lbi(ea)
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <buffer> <Leader>p :w <bar> exec '!python3' shellescape(@%, 1)<cr>
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

" ##################### Synctex #############################
let g:Tex_DefaultTargetFormat='pdf' 
let g:Tex_CompileRule_dvi='latex -synctex=1 --interaction=nonstopmode --src-specials $*'
let g:Tex_CompileRule_pdf='pdflatex -synctex=1 -src-specials -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf= 'okular --unique'
" acroread
" let g:Tex_ViewRule_pdf= 'qpdfview'
function! SyncTexForward()
     let execstr = "silent !okular --unique %:p:r.pdf\\#src:".line(".")."%:p &"
     exec execstr
endfunction
nmap <Leader>f :call SyncTexForward()<CR>

" #################### Python ################################
" Configure <F9> to run a Python program
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
