#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🧩 Setting up dotfiles from $DOTFILES_DIR ..."

# ===== System Update =====
echo "📦 Running apt update & upgrade..."
sudo apt update -y
sudo apt upgrade -y

# ===== Install Stow =====
if ! command -v stow &>/dev/null; then
  echo "📦 Installing stow..."
  sudo apt install -y stow
fi

# ===== Install packages =====
install_pkg() {
  PKG=$1
  if ! command -v "$PKG" &>/dev/null; then
    echo "📦 Installing $PKG..."
    sudo apt install -y "$PKG"
  else
    echo "✅ $PKG already installed."
  fi
}

install_pkg tmux
install_pkg git
install_pkg curl
install_pkg unzip

# ===== Install Neovim =====
if ! command -v nvim &>/dev/null; then
  echo "📦 Installing Neovim..."
  cd /tmp
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  chmod u+x nvim-linux-x86_64.appimage
  sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
else
  echo "✅ nvim already installed."
fi

install_pkg ripgrep
install_pkg fd-find
install_pkg fzf

# ===== Install Nerd Font (for icons) =====
echo "🔤 Installing Nerd Font for icons..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

if [ ! -f "$FONT_DIR/JetBrainsMonoNerdFont-Regular.ttf" ]; then
  echo "📦 Downloading JetBrains Mono Nerd Font..."
  cd /tmp
  curl -fLo "JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
  unzip -o JetBrainsMono.zip -d "$FONT_DIR"
  rm JetBrainsMono.zip
  fc-cache -fv
  echo "✅ Nerd Font installed. Please set your terminal font to 'JetBrainsMono Nerd Font'"
else
  echo "✅ Nerd Font already installed."
fi

cd "$DOTFILES_DIR"

# ===== Install LazyGit =====
if ! command -v lazygit &>/dev/null; then
  echo "📦 Installing LazyGit..."
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  rm lazygit lazygit.tar.gz
else
  echo "✅ lazygit already installed."
fi

# ===== nvim-treesitter dependencies =====
echo "🌲 Installing nvim-treesitter dependencies..."

# 1. C compiler
if ! command -v gcc &>/dev/null; then
  echo "📦 Installing build-essential (gcc, make)..."
  sudo apt install -y build-essential
else
  echo "✅ C compiler (gcc) already installed."
fi

# 2. Node.js and npm
if ! command -v node &>/dev/null; then
  echo "📦 Installing Node.js (for tree-sitter)..."
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install -y nodejs
else
  echo "✅ Node.js already installed."
fi

# ===== Stow dotfiles =====
cd "$DOTFILES_DIR"

echo "🔗 Linking dotfiles with stow..."
stow -v nvim
stow -v tmux
stow -v bash

# ===== Add bashrc source =====
if ! grep -q ".bashrc_custom" ~/.bashrc; then
  echo "" >> ~/.bashrc
  echo "# Custom aliases from dotfiles" >> ~/.bashrc
  echo "[ -f ~/.bashrc_custom ] && source ~/.bashrc_custom" >> ~/.bashrc
  echo "✅ Added bashrc_custom to ~/.bashrc"
fi

echo "✅ Setup complete! You can now open Neovim and run :TSUpdate."

