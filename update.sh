#!/usr/bin/env bash

set -e



# 현재 스크립트 위치 기준

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"



echo "🔄 Updating dotfiles from $DOTFILES_DIR ..."



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



echo "🎉 Dotfiles links updated!"
