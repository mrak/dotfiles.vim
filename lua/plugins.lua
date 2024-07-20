local lsp_augroup = vim.api.nvim_create_augroup('Mrak#LSP', {clear = true})
vim.diagnostic.config({ update_in_insert = false })

local function try_require(module)
  local ok, maybe_module = pcall(require, module)
  if ok then
    return ok, maybe_module
  end
  if string.find(maybe_module, "module '" .. module .. "' not found:") == nil then
    print(maybe_module)
  else
    print('Run make to install ' .. module)
  end
end

local ok, ts = try_require('nvim-treesitter.configs')
if ok then
  ts.setup {
    ensure_installed = {
      'bash',
      'comment',
      'diff',
      'dockerfile',
      'fish',
      'git_config',
      'gitignore',
      'gitcommit',
      'go',
      'gomod',
      'gosum',
      'gotmpl',
      'groovy',
      'hcl',
      'helm',
      'jq',
      'json',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'python',
      'regex',
      'rego',
      'ruby',
      'rust',
      'ssh_config',
      'terraform',
      'tmux',
      'toml',
      'vim',
      'vimdoc',
      'yaml',
    },
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
end

local ok, lspc = try_require('lspconfig')
if ok then
  require'lspconfig.ui.windows'.default_options.border = 'single'
  if vim.fn.executable('tflint') == 1              then lspc.tflint.setup{} end
  if vim.fn.executable('vim-language-server') == 1 then lspc.vimls.setup{} end

  if vim.fn.executable('terraform-ls') == 1 then
    lspc.terraformls.setup{
      on_init = function(client,_)
        client.server_capabilities.semanticTokensProvider = nil -- terraform-ls has terrible symantic highlighting, use treesitter
      end
    }
    vim.api.nvim_create_autocmd({"BufWritePre"}, {
      pattern = {"*.tf", "*.tfvars"},
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end

  if vim.fn.executable('rust-analyzer') == 1 then
    lspc.rust_analyzer.setup{
      on_init = function(client,_)
        client.server_capabilities.semanticTokensProvider = nil -- terrible symantic highlighting, use treesitter
      end
    }
    vim.api.nvim_create_autocmd({"BufWritePre"}, {
      pattern = {"*.rs"},
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

if vim.fn.executable('pest-language-server') == 1 then
  local ok, pest = try_require('pest-vim')
  if ok then
      pest.setup{}
  end
end

local ok, ngo = try_require('go')
if ok then
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
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
