local keymap = vim.keymap

function Make()
  -- Function to get the executable name from the Makefile
  local function get_executable_name()
    -- Read the Makefile to find the NAME variable
    local makefile = io.open("Makefile", "r")
    if not makefile then
      print("Makefile not found")
      return nil
    end

    local name
    for line in makefile:lines() do
      name = line:match("^NAME%s*=%s*(%S+)")
      if name then break end
    end
    makefile:close()

    if not name then
      print("Executable name not found in Makefile")
      return nil
    end

    return name
  end

  -- Get the executable name
  local executable = get_executable_name()
  if not executable then return end

  -- Create and toggle the terminal to run make commands and execute the program
  local term = require('toggleterm.terminal').Terminal
  local build_term = term:new({
    cmd = "make clean && make && ./" .. executable .. "; exec $SHELL",
    direction = "float",
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  })
  build_term:toggle()
end



local function run_latest_python()
  -- Function to get the latest modified Python file
  local function get_latest_python_file()
    local handle = io.popen("ls -t *.py | head -1")
    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+", "")  -- remove any trailing whitespace/newline
  end

  local file = get_latest_python_file()
  if file == "" then
    print("No Python files found in the current directory.")
    return
  end

  -- Open toggleterm and run the latest Python file
  require("toggleterm.terminal").Terminal:new({
    cmd = "python3 " .. file .. "; exec $SHELL",  -- keep the terminal open after execution
    hidden = true,
    direction = "float",
  }):toggle()
end

-- Command to run the latest edited Python file
vim.api.nvim_create_user_command('RunLatestPython', run_latest_python, { nargs = 0 })

-- Keybinding to run the latest edited Python file
vim.api.nvim_set_keymap('n', '<leader>rp', ':RunLatestPython<CR>', { noremap = true, silent = true })
-- Bind the function to a key, e.g., <leader>m
vim.api.nvim_set_keymap('n', '<leader>m', ':lua Make()<CR>', { noremap = true, silent = true })


keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'Open a Terminal vertically', noremap = true, silent = true })
keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Open a Terminal horizontally', noremap = true, silent = true })
keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Open a Terminal', noremap = true, silent = true })
keymap.set('n', '<leader>tM', '<cmd>lua Make()<cr>', {desc= 'Make and execute your code in a new term', noremap = true, silent = true})
