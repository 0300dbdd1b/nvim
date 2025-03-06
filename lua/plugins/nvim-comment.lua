return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            pre_hook = function(ctx)
                local U = require "Comment.utils"

                local filetype = vim.bo.filetype
                if filetype == "c" or filetype == "cpp" then
                    return ctx.ctype == U.ctype.line and '/*%s*/' or '/*%s*/'
                end
            end
        })
    end
}

