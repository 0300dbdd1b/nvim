return
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup(
				{
				size = function(term)
					if term.direction == "horizontal" then
						return vim.o.lines * 0.4
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				float_opts =
					{
					border = 'single',
					width = math.floor(vim.o.columns * 0.95),
					height = math.floor(vim.o.lines * 0.95),
					row = math.floor((vim.o.lines - (vim.o.lines * 0.95))/2),
					col = math.floor((vim.o.columns - (vim.o.columns * 0.95))/2),
					winblend = 1,
					zindex = 1,
					title_pos = 'center',
					},
				})
		end
	}
