local keymap = vim.keymap
keymap.set('n', '<leader>m', '<cmd>MaximizerToggle<cr>', {desc = 'Maximize/minimize a split', noremap = true, silent = true})
