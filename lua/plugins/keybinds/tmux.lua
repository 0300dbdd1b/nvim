local keymap = vim.keymap
-- Function to create a new tmux pane and run a command
local function create_tmux_pane(cmd)
  local tmux_command = string.format("tmux split-window -h '%s'", cmd)
  os.execute(tmux_command)
end

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

  -- Create a new tmux pane and run the make commands and executable
  create_tmux_pane(string.format("make clean && make && ./%s; exec $SHELL", executable))
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

  -- Create a new tmux pane and run the latest Python file
  create_tmux_pane(string.format("python3 %s; exec $SHELL", file))
end

keymap.set('n', '<C-h>', function() require('tmux').move_left() end)
keymap.set('n', '<C-j>', function() require('tmux').move_bottom() end)
keymap.set('n', '<C-k>', function() require('tmux').move_top() end)
keymap.set('n', '<C-l>', function() require('tmux').move_right() end)
keymap.set('n', '<leader>m', '<cmd>lua Make()<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>rp', '<cmd>lua run_latest_python()<CR>', { noremap = true, silent = true })
