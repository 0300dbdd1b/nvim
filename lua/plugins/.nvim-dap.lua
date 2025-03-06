return
	{
		"mfussenegger/nvim-dap",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		-- event = "VeryLazy",
		config = function()
			local dap = require('dap')
			dap.adapters.codelldb = {
				type = 'executable',
				command = 'codelldb', -- adjust as needed, must be absolute path
				name = 'codelldb'
			}
			dap.adapters.lldb = {
				type = 'executable',
				command = '/usr/bin/lldb',
				name = 'lldb'
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp
		end
	}
