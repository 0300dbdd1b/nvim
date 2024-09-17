
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require('harpoon')
    harpoon.setup({})

    require("telescope").load_extension("harpoon")
    vim.keymap.set("n", "<C-e>", ":Telescope harpoon marks<CR>", { desc = "Open Harpoon marks with Telescope" })
  end,
}

