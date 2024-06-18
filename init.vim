filetype plugin indent on

let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_matchparen=1
"let g:loaded_netrw = 1 " comment out to keep autoload functions for fugitive
let g:loaded_netrwPlugin = 1
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
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'mg979/vim-visual-multi'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'ray-x/go.nvim'
else
  Plug 'tpope/vim-commentary'
endif
call plug#end()

function s:dirvish_icon_fn(p)
  if getftype(a:p) ==# 'link'
    return '▹'
  elseif executable(a:p) && !isdirectory(a:p)
    return '•'
  endif
  return ' '
endfunction
call dirvish#add_icon_fn(function('s:dirvish_icon_fn'))

if has('nvim')
:lua << EOL
vim.diagnostic.config({ update_in_insert = false })
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'go', 'comment', 'rust', 'vim', 'terraform', 'yaml' },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

require'lspconfig.ui.windows'.default_options.border = 'single'
local lsp_augroup = vim.api.nvim_create_augroup('Mrak#LSP', {clear = true})
local lspc = require'lspconfig'
if vim.fn.executable('tflint') == 1              then lspc.tflint.setup{} end
if vim.fn.executable('vim-language-server') == 1 then lspc.vimls.setup{} end

if vim.fn.executable('terraform-ls') == 1 then
  lspc.terraformls.setup{}
  vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.tf", "*.tfvars"},
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

require('go').setup()
if vim.fn.executable('gopls') == 1 then
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
    if vim.fn.getbufvar(ev.buf, '&filetype') == 'vim' then
      vim.keymap.del('n', 'K', opts)
    end
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
EOL
endif
