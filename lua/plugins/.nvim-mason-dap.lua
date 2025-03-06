return {
	"williamboman/mason.nvim",
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",

	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = {},
		})
	end

}
