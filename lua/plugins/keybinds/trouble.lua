local keymap = vim.keymap

keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics<CR>', opts)
keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics filter.buf=0<CR>', opts)
keymap.set('n', '<leader>cs', '<cmd>Trouble symbols<CR>', opts)
keymap.set('n', '<leader>cl', '<cmd>Trouble lsp<CR>', opts)
keymap.set('n', '<leader>xL', '<cmd>Trouble loclist<CR>', opts)
keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist<CR>', opts)
