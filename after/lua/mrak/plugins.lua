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

safe_require('dap', function(dap)
  safe_require('dapui', function(dapui)
    dapui.setup({
      icons = {
        collapsed = "⏵︎",
        current_frame = "→",
        expanded = "⏷︎"
      },
      expand_lines = false,
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
        },
      }
    })
    vim.fn.sign_define('DapBreakpoint', {text='●', texthl='Error', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='→', texthl='Error', linehl='', numhl=''})
    vim.fn.sign_define('DapBreakpointCondition', {text='?', texthl='Error', linehl='', numhl=''})
    dap.listeners.before.attach.dapui_config = function() dapui.open()  end
    dap.listeners.before.launch.dapui_config = function() dapui.open()  end
  end)
end)
safe_require('dap-go', {})

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
    'make',
    'python',
    'regex',
    'rego',
    'ruby',
    'rust',
    'ssh_config',
    'terraform',
    'tmux',
    'toml',
    'yaml',
  },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "Select around function" },
        ["if"] = { query = "@function.inner", desc = "Select inside function" },
        ["ac"] = { query = "@class.outer", desc = "Select around class" },
        ["ic"] = { query = "@class.inner", desc = "Select inside class" },
        ["aa"] = { query = "@parameter.outer", desc = "Select around argument" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inside argument" },
        ["ab"] = { query = "@block.outer", desc = "Select around block" },
        ["ib"] = { query = "@block.inner", desc = "Select inside block" },
      },
      selection_scopes = {
        ['@function.outer'] = 'V',
      },
    }
  }
})

-- configure this last to avoid others from overwriting
vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '■',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.INFO] = '●',
      [vim.diagnostic.severity.HINT] = '♦',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
      [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
    },
  },
})
