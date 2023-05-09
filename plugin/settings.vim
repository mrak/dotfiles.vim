set shell=/bin/sh
" super slow startup for ruby files with jruby unless this is set
"let g:ruby_path='/usr/bin'
" Basics =====================================================================
syntax on
set backspace=indent,eol,start
set ignorecase
set infercase
set smartcase
set noautochdir
set fileformats=unix,dos,mac
" Files/Directories ==========================================================
set autoread
set undofile
" Font/Colors ================================================================
set termguicolors
set background=dark
set t_ut=
" vertical separator
set fillchars+=vert:\ ,fold:-
" Completion menus ===========================================================
set cpoptions=aABceFsmq
set completeopt=menu,longest
set wildmenu
set wildignore=*.jpg,*.gif,*.png " pictures
set wildignore+=*.dll,*.exe      " windows
set wildignore+=*.pyc,*.class    " bytecode
set wildignore+=*.o,*.obj,*.hi   " intermediary files
set wildignore+=*.bak,*.lock     " misc
set wildmode=list:longest
set nrformats=hex
" Heads-up Display ===========================================================
if !has('nvim')
    set ttymouse=sgr
endif
set hidden
set incsearch
set laststatus=2
"set lazyredraw
set list
set listchars=tab:\|-,trail:•,eol:↵,extends:>,precedes:<
set hlsearch
set nowrapscan
set nostartofline
set number
set numberwidth=3
set signcolumn=yes
set report=0
set scrolloff=5
set sidescrolloff=10
set shortmess=aOstT
if has("patch314")
    set shortmess+=c
endif
set showcmd
set noshowmode
"let g:is_bash=1 " fixes syntax for shell scripts
set statusline=
set statusline+=\ %{mrak#Mode()} " vim mode
set statusline+=\ %f      " filename and [modified]
set statusline+=\ %=        " end left. start right
set statusline+=\ %l:%c     " line:column
set statusline+=\ %P        " percentage through
set statusline+=\ %y%r%m    " flags
" Indent/Folding =============================================================
set autoindent
set smartindent
set foldmethod=indent
set foldlevelstart=99
set expandtab
set formatoptions=tcqjr
set nowrap
set whichwrap=b,s,<,>,~,[,]
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Other ======================================================================
set ttimeoutlen=0
" Netrw ======================================================================
let g:netrw_altfile=1
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = -25
let g:netrw_wiw = -25
let g:netrw_banner = 0
" Markdown ===================================================================
let g:markdown_fenced_languages = ['ruby', 'javascript', 'java', 'html', 'sh', 'yaml']
" Ripgrep ====================================================================
if executable('rg')
    let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
    set grepprg=rg\ --vimgrep\ --hidden\ --smart-case
    set grepformat+=%f:%l:%c:%m
endif
