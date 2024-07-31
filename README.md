

# Neovim Configuration

This repository contains my Neovim configuration files.\
Below is a brief overview of the structure and how to manage plugins and keybindings.

## Project Structure

```
├── init.lua
├── manager.sh
└── lua
    ├── core
    │   ├── basics.lua
    │   └── keybinds.lua
    └── plugins
        ├── keybinds
        │   ├── plugin1.lua
        │   ├── plugin2.lua
        │   ├── plugin3.lua
        │   ├── plugin4.lua
        │   └── plugin5.lua
        ├── lsp
        │   └── lspconfig.lua
        ├── plugin1.lua
        ├── plugin2.lua
        ├── plugin3.lua
        ├── plugin4.lua
        └── plugin5.lua
```

## Keybinds

- **Core Keybinds:** The core keybindings for Neovim are set in `lua/core/keybinds.lua`
- **Plugins Keybinds:** Keybindings specific to plugins are set in individual files within the `lua/plugins/keybinds/` directory.

## Managing Plugins

To add or remove a plugin, you can simply add or remove the corresponding file in the `lua/plugins/` directory. \
Each plugin should have its own lua configuration file.\
You can enable or disable a plugin using `manager.sh enable|disable <plugin name>`

## Dependencies

- [Neovim (>= 0.5.0)](https://github.com/neovim/neovim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)

## Usage

1. Clone this repository into your Neovim configuration directory:
    ```sh
    git clone <repository_url> ~/.config/nvim
    ```

3. Launch Neovim:
    ```sh
    nvim
    ```

## Contributing

Feel free to submit issues or pull requests if you have any improvements or fixes.

## License

This project is licensed under the MIT License.
