return {
	{
		'akinsho/toggleterm.nvim',
		version = "*", 
		opts = 
		{
				size = function(term)
					if term.direction == "horizontal" then
						size = vim.o.columns * 0.4
					elseif term.direction == "vertical" then
						size = vim.o.rows * 0.4
					end
				end
		},
	}
}
