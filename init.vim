filetype plugin indent on

let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_matchparen=1
"let g:loaded_netrw = 1
"let g:loaded_netrwPlugin = 1
let g:sneak#label = 1
let g:sneak#prompt = '↯ '

if isdirectory('/opt/homebrew/opt/fzf')
    set rtp+=/opt/homebrew/opt/fzf
endif
if isdirectory('/usr/local/opt/fzf')
    set rtp+=/usr/local/opt/fzf
endif

packadd cfilter
packadd matchit

call plug#begin(expand('<sfile>:p')->resolve()->fnamemodify(':h') .. '/plugged')
Plug 'hashicorp/sentinel.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim' " requires vim-fugitive
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
if has('nvim')
    Plug 'simrat39/rust-tools.nvim'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter'
endif
call plug#end()

colorscheme mrak
nnoremap <leader>ff <cmd>Files<CR>
nnoremap <leader>fg <cmd>GFiles<CR>
nnoremap <leader>fb <cmd>Buffers<CR>
nnoremap <leader>fl <cmd>Lines<CR>
nnoremap <leader>ft <cmd>Tags<CR>
nnoremap <leader>fm <cmd>History<CR>
nnoremap <leader>fr <cmd>Rg<CR>

if has('nvim')
:lua << EOL
vim.diagnostic.config({ update_in_insert = false })
require'rust-tools'.setup{}
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'go', 'comment', 'rust', 'lua', 'vim', 'vimdoc', 'terraform', 'yaml' },
    auto_install = false,
    highlight = { enable = true }
}
require'ts_context_commentstring'.setup {
    enable = true,
    config = {
        terraform = '# %s',
    },
}

require'lspconfig.ui.windows'.default_options.border = 'single'
local lsp_augroup = vim.api.nvim_create_augroup('Mrak#LSP', {clear = true})
local lspc = require'lspconfig'
if vim.fn.executable('terraform-ls') == 1        then lspc.terraformls.setup{filetypes = {"terraform"}} end
if vim.fn.executable('tflint') == 1              then lspc.tflint.setup{} end
if vim.fn.executable('vim-langauge-server') == 1 then lspc.vimls.setup{} end
if vim.fn.executable('gopls') == 1               then
  lspc.gopls.setup({
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({async = false})
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
      end
      })
    end
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_augroup,
  callback = function(ev)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
EOL
endif
