#!/bin/bash

set -e  # Exit on any error

echo "🔧 Installing dotfiles..."
echo ""

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_file() {
    src="$1"
    dest="$2"
    echo " → Linking $src → $dest"
    ln -sf "$src" "$dest"
}

# Function to link common files (inputrc)
link_common_files() {
    link_file "$DOTFILES_DIR/shell/.inputrc" "$HOME/.inputrc"
}

# Detect the current shell
CURRENT_SHELL=$(basename "$SHELL")

case "$CURRENT_SHELL" in
    bash)
        echo "Setting up for Bash..."
        link_file "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
        [ -f "$DOTFILES_DIR/bash/.alias_bash" ] && link_file "$DOTFILES_DIR/bash/.alias_bash" "$HOME/.alias_bash"
        ;;
    zsh)
        echo "Setting up for Zsh..."
        link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
        [ -f "$DOTFILES_DIR/zsh/.alias_zsh" ] && link_file "$DOTFILES_DIR/zsh/.alias_zsh" "$HOME/.alias_zsh"
        ;;
    csh)
        echo "Setting up for Csh..."
        link_file "$DOTFILES_DIR/csh/.cshrc" "$HOME/.cshrc"
        [ -f "$DOTFILES_DIR/csh/.alias_csh" ] && link_file "$DOTFILES_DIR/csh/.alias_csh" "$HOME/.alias_csh"
        ;;
    *)
        echo "⚠️ Unsupported shell: $CURRENT_SHELL"
        ;;
esac

# --- Common files (inputrc) ---
echo "Setting up common files..."
link_common_files

# --- Git config ---
echo "Setting up Git..."
link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

# --- Vim config ---
echo "Setting up Vim..."
link_file "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

echo "✅ Dotfiles installed successfully."
echo ""
