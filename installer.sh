#!/bin/bash

# Directory paths
PLUGIN_DIR="$HOME/.config/nvim/lua/plugins"
PLUGINS_DB="plugins_db.txt"

# Function to install a plugin
install_plugin() {
  local plugin_repo="$1"
  local plugin_name=$(basename "$plugin_repo")
  
  if grep -q "$plugin_repo" "$PLUGINS_DB"; then
    echo "use { '$plugin_repo' }" > "$PLUGIN_DIR/$plugin_name.lua"
    echo "Installed plugin: $plugin_repo"
  else
    echo "Plugin $plugin_repo not found in the database."
  fi
}

# Function to uninstall a plugin
uninstall_plugin() {
  local plugin_name="$1"
  if [ -f "$PLUGIN_DIR/$plugin_name.lua" ]; then
    rm "$PLUGIN_DIR/$plugin_name.lua"
    echo "Uninstalled plugin: $plugin_name"
  elif [ -f "$PLUGIN_DIR/$plugin_name.disable" ]; then
    rm "$PLUGIN_DIR/$plugin_name.disable"
    echo "Uninstalled plugin: $plugin_name"
  else
    echo "Plugin $plugin_name is not installed."
  fi
}

# Main script logic
case "$1" in
  install)
    install_plugin "$2"
    ;;
  uninstall)
    uninstall_plugin "$2"
    ;;
  *)
    echo "Usage: $0 {install|uninstall} <plugin_repo>"
    echo "Example:"
    echo "  $0 install gelguy/wilder.nvim"
    echo "  $0 uninstall wilder.nvim"
    ;;
esac

