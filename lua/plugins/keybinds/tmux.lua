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


-- Function to run the latest Python file
function RunPython()
  -- Function to get the latest modified Python file
  local function get_latest_python_file()
    local handle = io.popen("ls -t *.py | head -1")
    if not handle then
      print("Failed to get the latest Python file")
      return nil
    end
    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+", "")  -- remove any trailing whitespace/newline
  end

  local file = get_latest_python_file()
  if not file or file == "" then
    print("No Python files found in the current directory.")
    return
  end

  -- Check if Anaconda is installed
  local handle = io.popen("command -v conda")
  local result = handle:read("*a")
  handle:close()

  local cmd
  if result and result ~= "" then
    -- Anaconda is installed, use conda base environment
    cmd = string.format("source ~/miniconda3/bin/activate base && python3 %s; exec $SHELL", file)
  else
    -- Anaconda is not installed, run the Python file directly
    cmd = string.format("python3 %s; exec $SHELL", file)
  end

  -- Create a new tmux pane and run the command
  create_tmux_pane(cmd)
end



keymap.set('n', '<C-h>', function() require('tmux').move_left() end)
keymap.set('n', '<C-j>', function() require('tmux').move_bottom() end)
keymap.set('n', '<C-k>', function() require('tmux').move_top() end)
keymap.set('n', '<C-l>', function() require('tmux').move_right() end)
keymap.set('n', '<leader>m', '<cmd>lua Make()<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>rp', '<cmd>lua RunPython()<CR>', { noremap = true, silent = true })

