
local dap = require('dap')

vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set('n', '<leader>dso', dap.step_over, { desc = "Step Over" })
vim.keymap.set('n', '<leader>dsi', dap.step_into, { desc = "Step Into" })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = "Step Out" })
vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set('n', '<Leader>dB', function() 
    dap.set_breakpoint(vim.fn.input("Breakpoint Condition: ")) 
end, { desc = "Set Conditional Breakpoint" })
vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = "Open REPL" })
vim.keymap.set('n', '<Leader>dl', dap.run_last, { desc = "Run Last Debugging Session" })
vim.keymap.set('n', '<Leader>dq', dap.terminate, { desc = "Terminate Debugging" })
