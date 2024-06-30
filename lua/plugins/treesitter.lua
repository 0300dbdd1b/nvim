return {
	'nvim-treesitter/nvim-treesitter',
	event = {'BufReadPre', 'BufNewFile'},
	build = ':TSUpdate',
	dependencies = {
		'windwp/nvim-ts-autotag',
		'nvim-treesitter/nvim-treesitter-textobjects'},
	config = function()
		local treesitter = require('nvim-treesitter.configs')

		treesitter.setup({
			highlight = {enable = true},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
					}
				}
			},
			indent = {enable = true},
			autotag = {enable = true},
			ensure_installed = {
				"bash",
				"comment",
				"css",
				"html",
				"javascript",
				"jsdoc",
				"jsonc",
				"lua",
				"markdown",
				"regex",
				"scss",
				"toml",
				"typescript",
				"yaml",
				"python",
				"c",
				"cpp"
				},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-space>',
					node_incremental = '<C-space>',
					scope_incremental = false,
					node_decremental = '<bs>'
				}
			}
		})
		end
}
