local lspconfig = require('lspconfig')
lspconfig.pylsp.setup({
  on_attach = function(client, bufnr)
    -- Customize diagnostic messages
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual text
        virtual_text = false,
        -- Show signs
        signs = true,
        -- Delay update diagnostics
        update_in_insert = false,
      }
    )
  end,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          ignore = {"E501", "E302", "E305"},
        },
        pylint = { enabled = false },
        pyflakes = { enabled = false },
      },
    },
  },
})
