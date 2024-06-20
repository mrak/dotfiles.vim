filetype plugin indent on

let s:config_dir = expand('<sfile>:p')->resolve()->fnamemodify(':h')

" Plugins {{{

let g:did_install_default_menus = 1 " dissble GUI menus
let g:did_install_syntax_menu = 1   " disable GUI menus for syntax
let g:loaded_python3_provider = 0   " disable python plugin client
let g:loaded_ruby_provider = 0      " disable ruby plugin client
let g:loaded_node_provider = 0      " disable node plugin client
let g:loaded_perl_provider = 0      " disable perl plugin client
let g:loaded_matchparen=1           " disable matching paren highlighting
let g:is_posix = 1                  " Correctly highlight $() and other modern affordances in filetype=sh.
let g:sneak#label = 1               " use label mode with vim-sneak
let g:sneak#prompt = '↯ '           " command area prompt when using sneak
"let g:loaded_netrw = 1             " comment out to keep autoload functions for fugitive
let g:loaded_netrwPlugin = 1        " disable main netrw plugin
let g:netrw_altfile=1               " make CTRL-^ work
let g:netrw_banner=0                " disable the banner
let g:netrw_liststyle = 0           " one file per line
let g:disable_lsp_highlights = 1    " lua/plugins.lua, remove LSP highlight groups
let g:markdown_fenced_languages = ['ruby', 'javascript', 'java', 'html', 'bash=sh', 'yaml']

packadd cfilter " :Cfilter[!] for pruning quickfix/locationlist
packadd matchit " additional matching macros for %

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

" Boostrap vim-plug and plugins on new system
let s:plug_path = s:config_dir .. '/autoload/plug.vim'
if empty(glob(s:plug_path))
  let s:choice = inputlist(['Install plugins?', '1. yes'])
  if s:choice == 1
    silent execute '!curl -fLo '.s:plug_path.' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  else
    command! -nargs=+ -bar Plug echom 'Skipping Plug '..<q-args>
  endif
endif

call plug#begin(s:config_dir .. '/plugged')
Plug 'hashicorp/sentinel.vim' " support for sentinel language
Plug 'junegunn/fzf'           " main fzf plugin
Plug 'junegunn/fzf.vim'       " fzf helper functions added to mappings
Plug 'justinmk/vim-dirvish'   " file browser
Plug 'justinmk/vim-sneak'     " s replacement for hopping around a buffer
Plug 'tpope/vim-eunuch'       " GNU CLI wrappers
Plug 'tpope/vim-fugitive'     " Git manipulation
Plug 'tpope/vim-rhubarb'      " GitHub support for fugitive
Plug 'rbong/vim-flog'         " Git log viewer
Plug 'tpope/vim-repeat'       " Allows repeat of plugin actions
Plug 'tpope/vim-surround'     " manipulate wrapper tokens like []
Plug 'tpope/vim-unimpaired'   " nice assistance bindings
Plug 'tpope/vim-obsession'    " session management made easy
Plug 'mg979/vim-visual-multi' " mulitple cursors
if has('nvim')
  Plug 'neovim/nvim-lspconfig'                                  " LSP configs
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " tree-sitter setup
  Plug 'ray-x/go.nvim', { 'do': ':GoInstallBinaries' }          " additional LSP code actions for go
else
  Plug 'tpope/vim-commentary' " included by default with nvim
endif
call plug#end()

" Use fd or rg with fzf if available
if executable('fd')
    let $FZF_DEFAULT_COMMAND = "fd --type file --follow --hidden --exclude .git"
elseif executable('rg')
    let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
endif

" Set conceal cchar for dirvish files
try
  function! s:dirvish_icon_fn(p)
    if getftype(a:p) ==# 'link' | return '⚠' | endif
    return executable(a:p) && !isdirectory(a:p) ? '•' : ' '
  endfunction
  call dirvish#add_icon_fn(function('s:dirvish_icon_fn'))
catch
  echomsg "Run :PlugInstall to install justinmk/vim-dirvish"
endtry

" lua plugin setup in lua/plugins.lua
if has('nvim')
  lua require('plugins')
endif

" Plugins }}}
" Settings {{{

colorscheme mrak

if !has('nvim')
  " These are all set by default in nvim
  if &compatible | set nocompatible | endif
  syntax on
  set autoindent
  set autoread
  set background=dark
  set backspace=indent,eol,start
  set belloff=all
  set complete-=i
  set display+=lastline
  set hidden
  set history=10000
  set hlsearch
  set incsearch
  set nojoinspaces
  set langnoremap
  set nolangremap
  set laststatus=2
  set mouse=nvi
  set mousemodel=popup_setpos
  set nrformats-=octal
  set ruler
  set sessionoptions-=options
  set showcmd
  set sidescroll=1
  set smarttab
  set nostartofline
  set switchbuf=uselast
  " Allow color schemes to do bright colors without forcing bold.
  if &t_Co == 8 && $TERM !~# '^Eterm'
    set t_Co=16
  endif
  set t_ut= " clearing uses the current background color
  set tabpagemax=50
  set tags=./tags;,tags
  set termguicolors
  set ttimeout
  set ttymouse=sgr
  set viewoptions-=options
  set viminfo+=!
  let &viminfofile = s:config_dir .. '/viminfo'
  let &undodir = s:config_dir .. '/undo'
  set wildmenu
  set wildoptions=pum,tagfile
endif

set autoindent     " tabs: copy indent from current line when creating new line
set expandtab      " tabs: spaces instead of tabs
set shiftround     " tabs: indent to the neareast 'tabstop'
set shiftwidth=0   " tabs: indent 'tabstop' columns
set smarttab       " tabs: <Tab>/<BS> in front of a line inserts/deletes 'shifwidth'
set smartindent    " tabs: do smart autoindenting when starting a new line
set softtabstop=-1 " tabs: <Tab>/<BS> inserts/deletes 'shiftwidth'
set tabstop=2      " tabs: width of tab character

set noerrorbells   " bells: disable the bell for some things
set belloff=all    " bells: disable it everywhere, dammit
set visualbell     " bells: use visual bell instead of beeping

set completeopt=menu,longest
set display+=truncate
set fileformats=unix,dos,mac
set fillchars+=vert:\ ,fold:-,stlnc:=
set foldmethod=indent
set foldlevelstart=99
set formatoptions=tcqjr
set guitablabel=%{mrak#tabtitle#get()}
set guioptions+=e
if executable('rg')
  set grepprg=rg\ --vimgrep\ --hidden\ --smart-case\ -g\ !.git
  set grepformat+=%f:%l:%c:%m
endif
set ignorecase
set infercase
set nolist
set listchars=tab:\|-,trail:•,eol:↵,extends:>,precedes:<
set nrformats=hex
set number
set numberwidth=3
set report=0
set scrolloff=5
set shortmess=aOstT
if has("patch314")
  set shortmess+=c
endif
set noshowmode
set sidescrolloff=10
set signcolumn=yes
set smartcase
let &spellfile = s:config_dir .. '/spell/personal.utf-8.add'
set statusline=
set statusline+=\ %{mrak#mode#fn()} " vim mode
set statusline+=\ %f                " filename and [modified]
set statusline+=\ %=                " end left. start right
set statusline+=\ %l:%c             " line:column
set statusline+=\ %P                " percentage through
set statusline+=\ %y%r%m            " flags
set tabline=%!mrak#tabline#main()
set ttimeoutlen=0
set undofile
set whichwrap=b,s,<,>,~,[,]
set wildignore=*.jpg,*.gif,*.png " pictures
set wildignore+=*.dll,*.exe      " windows
set wildignore+=*.pyc,*.class    " bytecode
set wildignore+=*.o,*.obj,*.hi   " intermediary files
set wildignore+=*.bak,*.lock     " misc
set wildmode=list:longest
set wildoptions+=fuzzy
set nowrap
set nowrapscan

" Settings }}}
" Mappings {{{

" Also use space as leader
map <space> <leader>
" override defaults
nnoremap Y y$
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" Pasting over content does not replace register contents
xnoremap <expr> p 'pgv"'.v:register.'y'
" F keys
nnoremap <F2> <cmd>call mrak#quickfixtoggle#fn()<CR>
inoremap <F2> <cmd>call mrak#quickfixtoggle#fn()<CR>
nnoremap <F3> <cmd>call mrak#locationtoggle#fn()<CR>
inoremap <F3> <cmd>call mrak#locationtoggle#fn()<CR>
noremap  <F5> <cmd>checktime<CR>
"formatting code
nnoremap <leader>= <cmd>call mrak#equalprgfile#fn()<CR>
nnoremap <leader>e <cmd>Lexplore<CR>
" CTRL-Space for normal mode in the terminal pane
tnoremap <silent> <c-space> <C-\><C-n>
if has('nvim')
  " terminal window commands
  tnoremap <silent> <c-w>h <C-\><C-n><c-w>h
  tnoremap <silent> <c-w>j <C-\><C-n><c-w>j
  tnoremap <silent> <c-w>k <C-\><C-n><c-w>k
  tnoremap <silent> <c-w>l <C-\><C-n><c-w>l
  tnoremap <silent> <c-w><c-w> <C-\><C-n><c-w><c-w>
  tnoremap <silent> <c-w>s <C-\><C-n><c-w>s
  tnoremap <silent> <c-w>v <C-\><C-n><c-w>v
  tnoremap <silent> <c-w>c <cmd>bw!<CR>
endif
" Diagnostics
nnoremap <leader>do <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <leader>dn <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>dp <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>dl <cmd>lua vim.diagnostic.setloclist()<CR>
" Git
nnoremap git <cmd> call mrak#git#openfugitive()<CR>
" FZF
nnoremap <leader>ff <cmd>Files<CR>
nnoremap <leader>fg <cmd>GFiles<CR>
nnoremap <leader>fb <cmd>Buffers<CR>
nnoremap <leader>fl <cmd>Lines<CR>
nnoremap <leader>ft <cmd>Tags<CR>
nnoremap <leader>fm <cmd>History<CR>
nnoremap <leader>fr <cmd>Rg<CR>

" Mappings }}}
" Commands {{{

" Use :SudoWrite from vim-eunuch instead
"command! Sudo %!sudo tee > /dev/null %
command! Cd cd %:h
command! -nargs=* TabTitle call mrak#tabtitle#set(<f-args>)
command! -bang -nargs=0 -bar PruneBuffers call mrak#prunebuffers#fn(<bang>0)

" Commands }}}
" Autocommands {{{

augroup Mrak#autocmd
    autocmd!
    autocmd VimResized * wincmd =
    autocmd BufNewFile *.sh 0put = '#!/bin/sh' | norm j
    autocmd ModeChanged *:* call mrak#statuslinecolor#mode(v:event.new_mode)
    " autocmd InsertEnter * call mrak#statuslinecolor#ins(v:insertmode)
    " autocmd InsertChange * call mrak#statuslinecolor#ins(v:insertmode)
    " autocmd InsertLeave * highlight! link StatusLine StatusLineNor
    autocmd FocusLost * silent! wa
    autocmd BufEnter * silent! checktime %
    autocmd BufWritePre * :call mrak#trimtrailingwhitespace#fn()

    if has('nvim') " nvim terminal
        autocmd TermOpen * setlocal statusline=\ %{mrak#mode#fn()}\ %{b:term_title}
        autocmd TermOpen * set signcolumn=no
        autocmd TermOpen * set nonumber
        autocmd TermOpen * startinsert
    endif

    autocmd BufNewFile *.js 0put = \"'use strict';\" | norm j
    autocmd BufRead,BufNewFile ~/.xmonad/* call mrak#addxmonadpath#fn()
augroup END

" Autocommands }}}
" Signs {{{

for [type, text] in items(#{Error: '■', Warn: '▲', Info: '●', Hint: '♦'})
    let s:hl = "DiagnosticSign".type
    exe 'sign define '.s:hl.' text='.text.' texthl='.s:hl.' numhl='.s:hl
endfor

" Signs }}}
