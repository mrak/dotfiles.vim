vim.diagnostic.config({ update_in_insert = false })

local ok, ts = pcall(require, 'nvim-treesitter.configs')
if not ok then
  print('Run :PlugInstall to install nvim-treesitter')
else
  ts.setup {
    ensure_installed = { 'go', 'comment', 'rust', 'vim', 'terraform', 'yaml' },
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
end

local lsp_augroup = vim.api.nvim_create_augroup('Mrak#LSP', {clear = true})

local ok, lspc = pcall(require, 'lspconfig')
if not ok then
  print('Run :PlugInstall to install nvim-lspconfig')
else
  require'lspconfig.ui.windows'.default_options.border = 'single'
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
end

local ok, ngo = pcall(require, 'go')
if not ok then
  print('Run :PlugInstall to install go.nvim')
  print('Afterward, run :GoInstallBinaries')
else
  ngo.setup()
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_augroup,
  callback = function(ev)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
