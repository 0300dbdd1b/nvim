    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd', noremap = true, silent = true })
    keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Fuzzy find recent files', noremap = true, silent = true })
    keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = 'Find string in cwd', noremap = true, silent = true })
    keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd', noremap = true, silent = true })
    keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'Find todos', noremap = true, silent = true })
