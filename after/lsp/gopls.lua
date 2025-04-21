return {
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
}
