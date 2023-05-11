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
" No bells ===================================================================
set belloff=all
set noerrorbells
set visualbell
" Other ======================================================================
set ttimeoutlen=0
" Netrw ======================================================================
"let g:loaded_netrw = 1
"let g:loaded_netrwPlugin = 1
let g:netrw_altfile=1
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = -25
let g:netrw_wiw = -25
let g:netrw_banner = 0
" MatchParen builtin plugin disable ==========================================
let g:loaded_matchparen=1
" Markdown ===================================================================
let g:markdown_fenced_languages = ['ruby', 'javascript', 'java', 'html', 'sh', 'yaml']
" Ripgrep ====================================================================
if executable('rg')
    let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
    set grepprg=rg\ --vimgrep\ --hidden\ --smart-case
    set grepformat+=%f:%l:%c:%m
endif
" vim-sensitble ==============================================================
" Correctly highlight $() and other modern affordances in filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix = 1
endif
" If the running Vim lacks support for the Fish shell, use Bash instead.
if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif
