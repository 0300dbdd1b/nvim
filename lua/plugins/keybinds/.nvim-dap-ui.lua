local dapui = require("dapui")

vim.keymap.set('n', '<Leader>du', dapui.toggle, { desc = "Toggle DAP UI" })
vim.keymap.set('n', '<Leader>de', dapui.eval, { desc = "Evaluate Expression" })
vim.keymap.set('v', '<Leader>de', function() 
    dapui.eval(vim.fn.visualmode()) 
end, { desc = "Evaluate Selected Expression" })
