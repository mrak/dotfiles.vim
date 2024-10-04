let s:config_dir = expand('<sfile>:p')->resolve()->fnamemodify(':h')

" Plugins {{{

let g:did_install_default_menus = 1 " dissble GUI menus
let g:did_install_syntax_menu = 1   " disable GUI menus for syntax
let g:loaded_python3_provider = 0   " disable python plugin client
let g:loaded_ruby_provider = 0      " disable ruby plugin client
let g:loaded_node_provider = 0      " disable node plugin client
let g:loaded_perl_provider = 0      " disable perl plugin client
let g:loaded_remote_plugins = 1     " all diabled above anyway
let g:loaded_matchparen=1           " disable matching paren highlighting
let g:loaded_tutor_mode_plugin = 1  " disable vim tutor
let g:loaded_2html_plugin = 1       " disable :TOhtml
let g:is_posix = 1                  " Correctly highlight $() and other modern affordances in filetype=sh.
let g:sneak#label = 1               " use label mode with vim-sneak
let g:sneak#prompt = '↯ '           " command area prompt when using sneak
let g:loaded_netrw = 1              " use custom :Browse instead of netrw for fugitive
let g:loaded_netrwPlugin = 1        " disable main netrw plugin
let g:netrw_altfile = 1             " make CTRL-^ work
let g:netrw_banner = 0              " disable the banner
let g:netrw_liststyle = 0           " one file per line
let g:markdown_fenced_languages = ['ruby', 'javascript', 'java', 'html', 'bash=sh', 'yaml']

" Turn of auto-sourcing of ftplugin/ and indent/ until after all plugins added.
" Turning it on after all :packadd! ensures ftplugin/ scripts are loaded.
" See :help :packadd
filetype off
packadd! cfilter           " builtin: :Cfilter[!] for pruning quickfix/locationlist
packadd! sentinel.vim      " hashicorp: sentinel language support
packadd! fzf               " junegunn: main fzf plugin
packadd! fzf.vim           " junegunn: fzf helper functions
packadd! vim-dirvish       " justinmk: file browser
packadd! vim-sneak         " justinmk: 's' replacement motion
packadd! vim-eunuch        " tpope: move/delete/ helpers
packadd! vim-fugitive      " tpope: git inside vim
packadd! vim-rhubarb       " tpope: github support for fugitive
packadd! vim-flog          " rbong: git log viewer
packadd! vim-repeat        " tpope: allows repeat plugin actions
packadd! vim-surround      " tpope: manipulate wrapper tokens/brackets
packadd! vim-unimpaired    " tpope: nice assistance bindings
packadd! vim-obsession     " tpope: vim session management
packadd! vim-visual-multi  " mg979: mulicursor
if has('nvim')
  packadd! nvim-lspconfig  " neovim: LSP client configs
  packadd! nvim-treesitter " nvim-treesitter: tree-sitter setup. Run :TSUpdate afterward
  packadd! nvim-dap        " mfussenegger: debug adapter protocol
  packadd! nvim-nio        " nvim-neotest: dependency of nvim-dap-ui
  packadd! nvim-dap-ui     " rcarriga: variable/stack sidebars while debugging
  packadd! go.nvim         " ray-x: Golang LSP code actions. Run :GoInstallBinaries
  packadd! rustaceanvim    " mrcjkb: rust LSP setup
  packadd! pest.vim        " pest-parser: rust pest parsing crate LSP support
else
  runtime ftplugin/man.vim " builtin: :Man support
  packadd! matchit         " builtin: extended matching with %. Nvim enables by default
  packadd! vim-commentary  " tpope: mappings for (un)commenting
endif
" Now source all ftplugin/ and indent/ files.
filetype plugin indent on

" Use fd or rg with fzf if available
if executable('fd')
    let $FZF_DEFAULT_COMMAND = "fd --type file --follow --hidden --exclude .git"
elseif executable('rg')
    let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
endif

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
  let &backupdir = s:config_dir .. '/vim/backup'
  set belloff=all
  set commentstring=
  set complete-=i
  set define=
  let &directory = s:config_dir .. '/vim/swap'
  set display=lastline
  set encoding=utf-8
  set formatoptions=tcqj
  set hidden
  set history=10000
  set hlsearch
  set include=
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
  let &viminfofile = s:config_dir .. '/vim/viminfo'
  let &undodir = s:config_dir .. '/vim/undo'
  set wildmenu
  set wildoptions=pum,tagfile
  if executable('rg')
    set grepprg=rg\ --vimgrep\ -uu
    set grepformat+=%f:%l:%c:%m
  endif
endif

" Tab/indent
set autoindent     " copy indent from current line when creating new line
set expandtab      " spaces instead of tabs
set shiftround     " indent to the neareast 'tabstop'
set shiftwidth=0   " indent 'tabstop' columns
set smarttab       " <Tab>/<BS> in front of a line inserts/deletes 'shifwidth'
set smartindent    " do smart autoindenting when starting a new line
set softtabstop=-1 " <Tab>/<BS> inserts/deletes 'shiftwidth'
set tabstop=2      " width of tab character
" Bell
set noerrorbells   " disable the bell for some things
set belloff=all    " disable it everywhere, dammit
set visualbell     " use visual bell instead of beeping
" Case sensitivity
set ignorecase     " ignore case in search patterns
set smartcase      " override ignorecase if search has upper case letter
" UI messaging
set nolist           " hide listchars by default
set report=0         " always show '# of lines changed' reports
set noshowmode       " i.e. '-- INSERT --' on last line
set shortmess=aOstTI " shorten or remove some UI messaging
if has("patch314") | set shortmess+=cC | endif
" Tabline/statusline
set statusline=
set statusline+=\ %{mrak#mode#fn()} " vim mode
set statusline+=\ %f                " filename and [modified]
set statusline+=\ %=                " end left. start right
set statusline+=\ %l:%c             " line:column
set statusline+=\ %P                " percentage through
set statusline+=\ %y%r%m            " flags
set tabline=%!mrak#tabline#main()
set guioptions-=e " use a text-based tabline in the GUI
" Gutter options
set number         " show line numbers
set numberwidth=3  " use at least 3 columns for line numbers
set signcolumn=yes " always show a column for signs
" Completion
set completeopt=menu,longest
set wildignore=*.jpg,*.gif,*.png " pictures
set wildignore+=*.dll,*.exe      " windows
set wildignore+=*.pyc,*.class    " bytecode
set wildignore+=*.o,*.obj,*.hi   " intermediary files
set wildignore+=*.bak,*.lock     " misc
set wildoptions+=fuzzy           " fuzzy complete in command-line mode
" Cursor/line boundaries
set display+=truncate " show @@@ at the beginning if last line long
set scrolloff=5       " always show X lines above/below cursor
set sidescrolloff=10  " always show X columns around cursor
set synmaxcol=400     " don't highlight long lines
set nowrap            " don't wrap lines by default
" Whilespace/filler/folds
set fileformats=unix,dos,mac
set fillchars+=vert:\ ,fold:-,stlnc:=
set listchars=tab:\|-,trail:•,eol:↵,extends:>,precedes:<
set foldmethod=syntax " works well for most C-style bracketed languages
set foldlevelstart=99 " fully expand folds to start
" Misc
set nrformats=hex           " CTRL-A/X: don't try to interpret numbers as octal/binary
set ttimeoutlen=0           " don't wait for ESC detection
set undofile                " persist undo history
set whichwrap=b,s,<,>,~,[,] " motions that line-wrap
set nowrapscan              " don't jump to beginning after reaching end while searching
set formatoptions=tcqjr
let &spellfile = s:config_dir .. '/spell/personal.utf-8.add'

" Settings }}}
" Mappings {{{

" Also using space as leader, too
map <space> <leader>
" override defaults
nnoremap Y y$
nnoremap / ms/
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" Pasting over content does not replace register contents
xnoremap <expr> p 'pgv"'.v:register.'y'
" F keys
nnoremap <F2> <cmd>call mrak#quickfixtoggle#fn()<CR>
inoremap <F2> <cmd>call mrak#quickfixtoggle#fn()<CR>
nnoremap <F3> <cmd>call mrak#locationtoggle#fn()<CR>
inoremap <F3> <cmd>call mrak#locationtoggle#fn()<CR>
nnoremap <F4> <cmd>call mrak#prunebuffers#fn(0)<CR>
noremap  <F5> <cmd>checktime<CR>
"formatting code
nnoremap <leader>= <cmd>call mrak#equalprgfile#fn()<CR>
if has('nvim') || has('terminal')
  " CTRL-Space for normal mode in the terminal pane
  tnoremap <silent> <c-space> <C-\><C-n>
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
if has('nvim')
  nnoremap <leader>do <cmd>lua vim.diagnostic.open_float()<CR>
  nnoremap <leader>dn <cmd>lua vim.diagnostic.goto_next()<CR>
  nnoremap <leader>dp <cmd>lua vim.diagnostic.goto_prev()<CR>
  nnoremap <leader>dl <cmd>lua vim.diagnostic.setloclist()<CR>
endif
" Git
nnoremap git <cmd> call mrak#git#openfugitive()<CR>
" FZF
nnoremap <leader>ff <cmd>Files<CR>
nnoremap <leader>fc <cmd>Commands<CR>
nnoremap <leader>fg <cmd>GFiles<CR>
nnoremap <leader>fb <cmd>Buffers<CR>
nnoremap <leader>fl <cmd>Lines<CR>
nnoremap <leader>ft <cmd>Tags<CR>
nnoremap <leader>fm <cmd>History<CR>
nnoremap <leader>fr <cmd>Rg<CR>
nnoremap <leader>fh <cmd>Helptags<CR>

" Mappings }}}
" Commands {{{

" Use :SudoWrite from vim-eunuch instead
"command! Sudo %!sudo tee > /dev/null %
command! Cd cd %:h
command! -nargs=* TabTitle call mrak#tabtitle#set(<f-args>)
command! -bang -nargs=0 -bar PruneBuffers call mrak#prunebuffers#fn(<bang>0)
command! -nargs=1 Browse call mrak#browse#fn(shellescape(<q-args>,1))

" Commands }}}
" Autocommands {{{

augroup Mrak#autocmd
    autocmd!
    autocmd VimResized * wincmd =
    autocmd BufNewFile *.sh 0put = '#!/bin/sh' | norm j
    autocmd ModeChanged *:* call mrak#statuslinecolor#mode(v:event.new_mode)
    autocmd FocusLost * silent! wa
    autocmd BufEnter * silent! checktime %
    autocmd BufWritePre * call mrak#trimtrailingwhitespace#fn()

    if has('nvim') " nvim terminal
        autocmd TermOpen * setlocal statusline=\ %{mrak#mode#fn()}\ %{b:term_title}
        autocmd TermOpen * set signcolumn=no
        autocmd TermOpen * set nonumber
        autocmd TermOpen * startinsert
    endif

    autocmd BufNewFile *.js 0put = \"'use strict';\" | norm j
    autocmd BufRead,BufNewFile ~/.xmonad/* call mrak#addxmonadpath#fn()
    autocmd DiffUpdated * call mrak#diff#setup()
augroup END

" Autocommands }}}
" Signs {{{

for [type, text] in items(#{Error: '■', Warn: '▲', Info: '●', Hint: '♦'})
    let s:hl = "DiagnosticSign".type
    exe 'sign define '.s:hl.' text='.text.' texthl='.s:hl.' numhl='.s:hl
endfor

" Signs }}}
