local augroup = vim.api.nvim_create_augroup('Mrak#plugins', {clear=false})

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

-- treesitter
-- enablement
safe_require('nvim-treesitter', function(nt)
  local treesitter_languages = {
      awk           = {},
      bash          = {F=true},
      comment       = {},
      csv           = {},
      diff          = {F=true},
      dockerfile    = {},
      fish          = {F=true},
      git_config    = {F=true},
      git_rebase    = {},
      gitattributes = {},
      gitcommit     = {},
      gitignore     = {},
      gleam         = {F=true},
      go            = {F=true},
      gomod         = {},
      gosum         = {},
      gotmpl        = {F=true},
      groovy        = {F=true},
      haskell       = {F=true},
      hcl           = {F=true},
      helm          = {F=true},
      jq            = {},
      json          = {F=true},
      make          = {F=true},
      python        = {F=true},
      regex         = {},
      rego          = {},
      ruby          = {F=true},
      rust          = {F=true},
      ssh_config    = {F=true},
      terraform     = {F=true},
      tmux          = {},
      toml          = {F=true},
      yaml          = {F=true},
  }
  vim.api.nvim_create_autocmd({'FileType'}, {
    group = augroup,
    callback = function(ev)
      if not ev.match or ev.match == '' or ev.match == 'text' then
        vim.treesitter.stop()
      end
      pcall(function() vim.treesitter.start() end)
      if treesitter_languages[ev.match] ~= nil then
        -- folds
        if treesitter_languages[ev.match]['F'] ~= nil then
          vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.wo[0][0].foldmethod = 'expr'
        end
        -- indent
        if treesitter_languages[ev.match]['I'] ~= nil then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end
    end
  })
  local lang_list = {}
  for l,_ in pairs(treesitter_languages) do
    lang_list[#lang_list+1] = l
  end
  nt.install(lang_list)
end)
-- safe_require('nvim-treesitter.configs', {
--   textobjects = {
--     move = {
--       enable = true,
--       set_jumps = true,
--       goto_next_start = {
--         ["]f"] = "@function.outer",
--       },
--       goto_next_end = {
--         ["]F"] = "@function.outer",
--       },
--       goto_previous_start = {
--         ["[f"] = "@function.outer",
--       },
--       goto_previous_end = {
--         ["[F"] = "@function.outer",
--       },
--     },
--     select = {
--       enable = true,
--       lookahead = true,
--       keymaps = {
--         ["af"] = { query = "@function.outer", desc = "Select around function" },
--         ["if"] = { query = "@function.inner", desc = "Select inside function" },
--         ["ac"] = { query = "@class.outer", desc = "Select around class" },
--         ["ic"] = { query = "@class.inner", desc = "Select inside class" },
--         ["aa"] = { query = "@parameter.outer", desc = "Select around argument" },
--         ["ia"] = { query = "@parameter.inner", desc = "Select inside argument" },
--         ["ab"] = { query = "@block.outer", desc = "Select around block" },
--         ["ib"] = { query = "@block.inner", desc = "Select inside block" },
--       },
--       selection_scopes = {
--         ['@function.outer'] = 'V',
--       },
--     }
--   }
-- })


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
