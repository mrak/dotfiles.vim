vim.lsp.set_log_level("off")

if vim.fn.executable('tflint') == 1               then vim.lsp.enable('tflint')      end
if vim.fn.executable('vim-language-server') == 1  then vim.lsp.enable('vimls')       end
if vim.fn.executable('bash-language-server') == 1 then vim.lsp.enable('bashls')      end
if vim.fn.executable('fish-lsp') == 1             then vim.lsp.enable('fish_lsp')    end
if vim.fn.executable('pyright') == 1              then vim.lsp.enable('pyright')     end
if vim.fn.executable('terraform-ls') == 1         then vim.lsp.enable('terraformls') end
if vim.fn.executable('gopls') == 1                then vim.lsp.enable('gopls')       end
if vim.fn.executable('pest-language-server') == 1 then vim.lsp.enable('pest_ls')     end
if vim.fn.executable('lua-language-server') == 1  then vim.lsp.enable('lua_ls')      end

local lsp_augroup = vim.api.nvim_create_augroup('Mrak#LSP', {clear = true})
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_augroup,
  callback = function(ev)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, opts)
  end,
})
