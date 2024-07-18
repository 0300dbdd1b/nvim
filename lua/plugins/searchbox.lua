-- File: ~/.config/nvim/lua/plugins.lua

return {
  {
    'VonHeikemen/searchbox.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    config = function()
      require('searchbox').setup({
        defaults = {
          reverse = false,
          exact = false,
          prompt = ' ',
          modifier = 'disabled',
          confirm = 'off',
          clear_matches = true,
          show_matches = false,
        },
        popup = {
          relative = 'win',
          position = {
            row = '5%',
            col = '95%',
          },
          size = 30,
          border = {
            style = 'rounded',
            text = {
              top = ' Search ',
              top_align = 'left',
            },
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
        hooks = {
          on_done = function(value, search_type)
            if search_type == 'replace' then
              vim.cmd('SearchBoxClear')
            end
          end
        }
      })
    end
  },
}

