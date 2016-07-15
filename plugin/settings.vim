set shell=/bin/sh
" super slow startup for ruby files with jruby unless this is set
"let g:ruby_path='/usr/bin'
" Basics =======================================================================
syntax on
set backspace=indent,eol,start
set ignorecase
set infercase
set smartcase
set noautochdir
set fileformats=unix,dos,mac
" Files/Directories ============================================================
set autoread
set undofile

if empty($XDG_CACHE_HOME)
    let s:cache_dir=fnameescape($HOME.'/.vim/cache/')
else
    let s:cache_dir=fnameescape($XDG_CACHE_HOME.'/vim/')
endif
if empty($XDG_DATA_HOME)
    let s:rtp_dir=fnameescape($HOME.'/.vim/')
else
    let s:rtp_dir=fnameescape($XDG_DATA_HOME.'/vim/')
endif

let s:backup_dir=s:cache_dir.'backup'
let s:swap_dir=s:cache_dir.'swap'
let s:undo_dir=s:cache_dir.'undo'

if !isdirectory(s:backup_dir)
    call mkdir(s:backup_dir, 'p', '0700')
endif
if !isdirectory(s:swap_dir)
    call mkdir(s:swap_dir, 'p', '0700')
endif
if !isdirectory(s:undo_dir)
    call mkdir(s:undo_dir, 'p', '0700')
endif
if !isdirectory(s:rtp_dir)
    call mkdir(s:rtp_dir, 'p')
endif

let &backupdir=s:backup_dir
set backupdir+=/tmp,~/
let &directory=s:swap_dir
set directory+=/tmp,~/
let &undodir=s:undo_dir
set undodir+=/tmp,~/
if !has('nvim')
    let &viminfo.=',n'.s:rtp_dir.'viminfo'
endif
" Font/Colors ==================================================================
set background=dark
set t_ut=
colorscheme mrak

if &term =~ '^xterm'
    " solid bar (Insert)
    let &t_SI .= "\<Esc>[6 q"
    " solid block (Normal)
    let &t_EI .= "\<Esc>[2 q"
endif
"if &term =~ '^rxvt'
    " blink underscore (Insert)
    "let &t_SI .= "\<Esc>[3 q"
    " blink block (Normal)
    "let &t_EI .= "\<Esc>[1 q"
"endif
if $TERM_PROGRAM == 'iTerm.app'
    " solid bar (Insert)
    let &t_SI .= "\<Esc>[6 q"
    " solid block (Normal)
    let &t_EI .= "\<Esc>[2 q"
endif
" Completion menus =============================================================
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
" Heads-up Display =============================================================
if has('nvim')
    set mouse=
else
    set ttymouse=sgr
endif
set hidden
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:\|-,trail:•,eol:↵,extends:>,precedes:<
set hlsearch
set nowrapscan
set nostartofline
set number
set numberwidth=3
set report=0
set scrolloff=5
set sidescrolloff=10
set shortmess=aOstT
if has("patch314")
    set shortmess+=c
endif
set showcmd
set noshowmode
let loaded_matchparen = 1
"let g:is_bash=1 " fixes syntax for shell scripts

set statusline=
set statusline+=\ %{mrak#Mode()} " vim mode
set statusline+=\ %f      " filename and [modified]
set statusline+=\ %=        " end left. start right
set statusline+=\ %l:%c     " line:column
set statusline+=\ %P        " percentage through
set statusline+=\ %y%r[%{&ff}]%m    " flags
" Indent/Folding ===============================================================
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
"
" Other ========================================================================
set ttimeoutlen=0
