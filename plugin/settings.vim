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
set spelllang=en_us
let &spellfile=expand('<sfile>:h:h') . '/spell/en.utf-8.add'
" Files/Directories ============================================================
set autoread
set undofile
set backupdir=$XDG_CACHE_HOME/vim,/tmp,~/
set directory=$XDG_CACHE_HOME/vim,/tmp,~/
set undodir=$XDG_CACHE_HOME/vim,/tmp,~/
if !has('nvim')
    set viminfo+=n$XDG_DATA_HOME/vim/viminfo
endif
set runtimepath+=$XDG_DATA_HOME/vim
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
set wildignore+=.stack-work      " haskell
set wildmode=list:longest
set nrformats=hex
" Heads-up Display =============================================================
if !has('nvim')
    set ttymouse=sgr
endif
set hidden
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:>-,trail:•,eol:¬,extends:~,precedes:~
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
set shiftwidth=0 " default to tabstop
set softtabstop=4
set tabstop=4
"
" Other ========================================================================
set ttimeoutlen=0
