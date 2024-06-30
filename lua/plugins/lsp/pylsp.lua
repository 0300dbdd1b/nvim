local config_path = vim.fn.expand("~/.config/.pycodestyle")

-- Function to check if a file exists
local function file_exists(name)
   local f = io.open(name, "r")
   if f ~= nil then io.close(f) return true else return false end
end

-- Function to create .pycodestyle file with specific content
local function create_pycodestyle()
    local content = "[pycodestyle]\nignore = E501,E302, E305\n"
    local file = io.open(config_path, "w")
    file:write(content)
    file:close()
end

-- Check if .pycodestyle file exists, if not, create it
if not file_exists(config_path) then
    create_pycodestyle()
end

