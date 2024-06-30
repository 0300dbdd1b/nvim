
local keymap = vim.keymap
keymap.set('n', '<leader>D', '<cmd>lua  vim.diagnostic.open_float()<cr>', { noremap = true, silent = true })
