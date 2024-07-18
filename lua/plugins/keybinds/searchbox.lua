local keymap = vim.keymap
local opts = { noremap = true, silent = false }

-- Keybinding for increment<cmd>al search
keymap.set('n', '<leader>si', '<cmd>SearchBoxIncSearch<CR>', opts)

-- Keybinding for match all
keymap.set('n', '<leader>sma', '<cmd>SearchBoxMatchAll<CR>', opts)

-- Keybinding for simple search
keymap.set('n', '<leader>ss', '<cmd>SearchBoxSimple<CR>', opts)

-- Keybinding for search and replace
keymap.set('n', '<leader>sr', '<cmd>SearchBoxReplace<CR>', opts)

-- Visual mode keybinding for incremental search
keymap.set('x', '<leader>si', '<cmd>SearchBoxIncSearch visual_mode=true<CR>', opts)

keymap.set('n', '<leader>sc', '<cmd>SearchBoxClear<CR>', opts)
