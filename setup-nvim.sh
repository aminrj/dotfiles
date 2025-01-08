#!/bin/bash

# Set XDG config environment variables to point to custom location
export XDG_CONFIG_HOME="$HOME/nvim"
export XDG_DATA_HOME="$HOME/nvim/data"
export XDG_STATE_HOME="$HOME/nvim/state"
export XDG_CACHE_HOME="$HOME/nvim/cache"

# Create necessary directories
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_STATE_HOME"
mkdir -p "$XDG_CACHE_HOME"

# Launch neovim with custom config
exec nvim "$@"
