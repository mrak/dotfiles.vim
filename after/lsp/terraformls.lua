return {
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
