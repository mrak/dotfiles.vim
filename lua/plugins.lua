-- pass arg 2 as a function to receive a handle to the module as the function arg
-- pass arg 2 as a table to automatically call module.setup(arg)
local function safe_require(module, fn)
  local ok, maybe_module = pcall(require, module)
  if ok then
    if type(fn) == "function" then
      fn(maybe_module)
    else
      maybe_module.setup(fn)
    end
    return
  end
  if string.find(maybe_module, "module '" .. module .. "' not found:") == nil then
    print(maybe_module)
  else
    print('Run make to install ' .. module)
  end
end

vim.g.rustaceanvim = {
  server = {
    on_init = function(client,_)
      client.server_capabilities.semanticTokensProvider = nil -- terrible symantic highlighting, use treesitter
    end,
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  }
}

local lsp_augroup = vim.api.nvim_create_augroup('Mrak#LSP', {clear = true})
vim.diagnostic.config({ update_in_insert = false })

safe_require('dapui', {
  icons = {
    collapsed = "⏵︎",
    current_frame = "→",
    expanded = "⏷︎"
  },
  controls = {
    icons = {
      disconnect = "×",
      pause = "⏸︎",
      play = "⏵︎",
      run_last = "⟳",
      step_back = "←",
      step_into = "↓",
      step_out = "↑",
      step_over = "→",
      terminate = "◼︎"
    }
  }
})

safe_require('nvim-treesitter.configs', {
  ensure_installed = {
    'awk',
    'bash',
    'comment',
    'csv',
    'diff',
    'dockerfile',
    'fish',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
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
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "Select around function" },
        ["if"] = { query = "@function.inner", desc = "Select inside function" },
        ["at"] = { query = "@class.outer", desc = "Select around type/class" },
        ["it"] = { query = "@class.inner", desc = "Select inside type/class" },
        ["ac"] = { query = "@comment.outer", desc = "Select comment" },
        ["as"] = { query = "@local.scope", desc = "Select language scope" },
        ["ia"] = { query = "@parameter.inner", desc = "Select parameter/argument" },
      },
      selection_scopes = {
        ['@function.outer'] = 'V',
      },
    }
  }
})

safe_require('lspconfig', function(lspc)
  require'lspconfig.ui.windows'.default_options.border = 'single'
  if vim.fn.executable('tflint') == 1               then lspc.tflint.setup{} end
  if vim.fn.executable('vim-language-server') == 1  then lspc.vimls.setup{} end
  if vim.fn.executable('bash-language-server') == 1 then lspc.bashls.setup{} end
  if vim.fn.executable('pyright') == 1              then lspc.pyright.setup{} end

  if vim.fn.executable('terraform-ls') == 1 then
    lspc.terraformls.setup{
      on_init = function(client,_)
        client.server_capabilities.semanticTokensProvider = nil -- terraform-ls has terrible symantic highlighting, use treesitter
      end,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd({"BufWritePre"}, {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    }
  end

  if vim.fn.executable('gopls') == 1 then
    lspc.gopls.setup({
      diagnosticTrigger = "Save",
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
end)

if vim.fn.executable('pest-language-server') == 1 then
  safe_require('pest-vim', {})
end

safe_require('go', {})

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
