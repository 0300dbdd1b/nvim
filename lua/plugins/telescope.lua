return { "nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim"
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		telescope.setup({
			defaults = {

				previewer = true,
				file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
				grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
				qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
				--		picker_anchor = 'NW', 
				layout_strategy = 'vertical',
				layout_config = {
					--			prompt_position = 'bottom',
					horizontal = {
						mirror = false,
						preview_cutoff = 0,
						preview_width = 90,
						--preview_width = 0.80,
					},
					vertical = {
						mirror = false,
						preview_cutoff = 0,
						preview_width = 90,
						preview_height = 0.7,
					},
					flex = {
						flip_columns = 110,
					},
					height = 0.90,
					width = 100,
				},

				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<ESC>"] = actions.close,
					},
				},
			},
		})

	end
}
