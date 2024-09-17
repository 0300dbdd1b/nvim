-- Path to lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Function to load Lua files from a directory
local function load_files_from_dir(dir, prefix)
  local files = vim.fn.readdir(dir)
  for _, file in ipairs(files) do
    local module_name = file:match("(.+)%.lua$")
    if module_name then
      require(prefix .. module_name)
    end
  end
end

-- Function to collect plugin specifications from multiple directories
local function collect_plugin_specs()
  local plugins = {}
  local base_path = vim.fn.stdpath("config") .. "/lua/"
  local plugin_dirs = { "plugins"}

  for _, plugin_dir in ipairs(plugin_dirs) do
    local dir_path = base_path .. plugin_dir
    local files = vim.fn.readdir(dir_path)
    for _, file in ipairs(files) do
      local plugin_name = file:match("(.+)%.lua$")
      if plugin_name then
        table.insert(plugins, require(plugin_dir:gsub("/", ".") .. "." .. plugin_name))
      end
    end
  end
  return plugins
end

-- Setup lazy.nvim with the collected plugin specifications
require("lazy").setup(collect_plugin_specs())

-- Function to load configurations from multiple directories in a specified order
local function load_all()
  local base_path = vim.fn.stdpath("config") .. "/lua/"
  local load_order = {
    { dir = base_path .. "core", prefix = "core." },
    { dir = base_path .. "plugins", prefix = "plugins." },
    { dir = base_path .. "plugins/lsp", prefix = "plugins.lsp." },
    { dir = base_path .. "plugins/keybinds", prefix = "plugins.keybinds." }
  }

  for _, entry in ipairs(load_order) do
    load_files_from_dir(entry.dir, entry.prefix)
  end
end

-- Load all configurations
load_all()


