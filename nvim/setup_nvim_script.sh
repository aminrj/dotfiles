#!/bin/bash

set -e # Stop script on error

DOTFILES_REPO="https://github.com/aminrj/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

echo "Updating package lists..."
if command -v apt &>/dev/null; then
  sudo apt update -y
  sudo apt install -y git curl neovim tmux fzf ripgrep unzip xclip wl-clipboard
elif command -v yum &>/dev/null; then
  sudo yum update -y
  sudo yum install -y git curl neovim tmux fzf ripgrep unzip xclip wl-clipboard
elif command -v pacman &>/dev/null; then
  sudo pacman -Sy --noconfirm git curl neovim tmux fzf ripgrep unzip xclip wl-clipboard
else
  echo "Unsupported package manager. Install dependencies manually."
  exit 1
fi

echo "Ensuring ~/.config directory exists..."
mkdir -p "$HOME/.config"

echo "Cloning dotfiles repository..."
if [ ! -d "$DOTFILES_DIR" ]; then
  git clone --depth=1 "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "Dotfiles repository already exists. Pulling latest changes..."
  git -C "$DOTFILES_DIR" pull
fi

echo "Copying your Neovim configuration from dotfiles..."
if [ -d "$DOTFILES_DIR/nvim" ]; then
  rm -rf "$HOME/.config/nvim" # Remove existing config to avoid conflicts
  cp -r "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
else
  echo "⚠️ Warning: No 'nvim/' directory found in dotfiles!"
fi

echo "Setting up Lazy.nvim..."
LAZY_PATH="$HOME/.local/share/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_PATH" ]; then
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_PATH"
else
  echo "Lazy.nvim already installed."
fi

echo "Running Neovim headless to install your plugins..."
nvim --headless "+Lazy! sync" +qa || true

echo "Setup complete! Restart your terminal or run 'exec $SHELL' to apply changes."
