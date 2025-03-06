local keymap = vim.keymap


keymap.set('n', '<C-h>', function() require('tmux').move_left() end)
keymap.set('n', '<C-j>', function() require('tmux').move_bottom() end)
keymap.set('n', '<C-k>', function() require('tmux').move_top() end)
keymap.set('n', '<C-l>', function() require('tmux').move_right() end)

