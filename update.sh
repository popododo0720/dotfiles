#!/usr/bin/env bash

set -e



DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"



echo "🔄 Updating dotfiles from $DOTFILES_DIR ..."



cd "$DOTFILES_DIR"



# Restow (업데이트)

stow -R nvim

stow -R tmux

stow -R bash



echo "✅ Dotfiles updated"



# tmux reload

if tmux info &>/dev/null; then

  tmux source-file ~/.config/tmux/tmux.conf

  echo "🔄 Reloaded tmux config"

fi



echo "🎉 Update complete!"
