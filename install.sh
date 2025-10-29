#!/usr/bin/env bash

set -e

# 현재 스크립트 위치 기준

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🧩 Setting up dotfiles from $DOTFILES_DIR ..."

# ===== System Update (once) =====

echo "📦 Running apt update & upgrade..."

sudo apt update -y

sudo apt upgrade -y

# ===== Install function =====

install_pkg() {

  PKG=$1

  if ! command -v "$PKG" &>/dev/null; then

    echo "📦 Installing $PKG..."

    sudo apt install -y "$PKG"

  else

    echo "✅ $PKG already installed."

  fi

}

# ===== Install core packages =====

install_pkg tmux

install_pkg git

install_pkg curl

install_pkg unzip

# ===== Install Neovim (latest AppImage) =====

if ! command -v nvim &>/dev/null; then

  echo "📦 Installing Neovim..."

  cd /tmp

  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage

  chmod u+x nvim-linux-x86_64.appimage

  sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

else

  echo "✅ nvim already installed."

fi

# ===== Recommended CLI tools =====

install_pkg ripgrep

install_pkg fd-find

install_pkg fzf

# ===== Link Neovim config =====

mkdir -p ~/.config

rm -rf ~/.config/nvim

ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim

echo "✅ Linked Neovim config → ~/.config/nvim"

# ===== Link tmux config =====

ln -sf "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf

echo "✅ Linked tmux config → ~/.tmux.conf"

# tmux 실행 중이면 설정 reload

if tmux info &>/dev/null; then

  tmux source-file ~/.tmux.conf

  echo "🔄 Reloaded tmux config"

fi

# ===== Add custom bash config =====

if [ -f "$DOTFILES_DIR/bash/.bashrc_custom" ]; then

  # 기존 bashrc에 source 추가

  if ! grep -q ".bashrc_custom" ~/.bashrc; then

    echo "" >>~/.bashrc

    echo "# Custom aliases and settings from dotfiles" >>~/.bashrc

    echo "source $DOTFILES_DIR/bash/.bashrc_custom" >>~/.bashrc

    echo "✅ Added custom bash config to ~/.bashrc"

  else

    echo "✅ Custom bash config already linked"

  fi

fi

echo "🎉 Dotfiles setup complete!"
echo ""
echo "💡 Run one of the following to apply bash config:"
echo "   source ~/.bashrc"
echo "   exec bash"
