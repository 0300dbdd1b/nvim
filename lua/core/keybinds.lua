-- Function to open a simple vertical split
function OpenWindowSplitVertical()
  vim.cmd('vsplit')
end

-- Function to open a simple horizontal split
function OpenWindowSplitHorizontal()
  vim.cmd('split')
end

local keymap = vim.keymap
-- Keybindings to call the functions
keymap.set('n', '<leader>sv', ':lua OpenWindowSplitVertical()<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>sh', ':lua OpenWindowSplitHorizontal()<CR>', { noremap = true, silent = true })

-- Keybindings for resizing windows
keymap.set('n', '<leader>r+', ':resize +4<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>r-', ':resize -4<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>r>', ':vertical resize +4<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>r<', ':vertical resize -4<CR>', { noremap = true, silent = true })

-- Keybindings for moving between windows
keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

--keymap.set('n', '<leader>[', '<C-w>h', { noremap = false, silent = true })
--keymap.set('n', '<leader>]', '<C-w>l', { noremap = false, silent = true })

keymap.set('n', '<leader>~', '<cmd>qa<cr>', { noremap = true, silent = true})
keymap.set('n', '<leader>`', '<cmd>qa!<cr>', { noremap = true, silent = true})
keymap.set('t', '<ESC>', '<C-\\><C-n>', {noremap = true, silent = true})
