#!/bin/bash

# Directory paths
PLUGIN_DIR="$HOME/.config/nvim/lua/plugins"
KEYBINDS_DIR="$PLUGIN_DIR/keybinds"
DISABLED_EXT=".disabled"

# Function to enable a plugin
enable_plugin() {
  local plugin_file="$1"
  if [ -f "$plugin_file$DISABLED_EXT" ]; then
    mv "$plugin_file$DISABLED_EXT" "$plugin_file.lua"
    echo "Enabled plugin: $(basename "$plugin_file")"
  else
    echo "Plugin $(basename "$plugin_file") is already enabled or does not exist."
  fi
}

# Function to disable a plugin
disable_plugin() {
  local plugin_file="$1"
  if [ -f "$plugin_file.lua" ]; then
    mv "$plugin_file.lua" "$plugin_file$DISABLED_EXT"
    echo "Disabled plugin: $(basename "$plugin_file")"
  else
    echo "Plugin $(basename "$plugin_file") is already disabled or does not exist."
  fi
}

# Main script logic
case "$1" in
  enable)
    enable_plugin "$PLUGIN_DIR/$2"
    ;;
  disable)
    disable_plugin "$PLUGIN_DIR/$2"
    ;;
  *)
    echo "Usage: $0 {enable|disable} <plugin_name>"
    echo "Example:"
    echo "  $0 enable alpha-nvim"
    echo "  $0 disable alpha-nvim"
    ;;
esac

