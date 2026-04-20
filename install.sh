#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGES=(yazi starship eza fish lazygit lazydocker tmux git kiro-cli)
NVIM_REPO="https://github.com/Iwan-Dyke/nvim-config.git"

info()  { printf '\033[0;32m[✓]\033[0m %s\n' "$1"; }
warn()  { printf '\033[0;33m[!]\033[0m %s\n' "$1"; }
error() { printf '\033[0;31m[✗]\033[0m %s\n' "$1"; exit 1; }

# ── Dependencies ──────────────────────────────────────────────
install_stow() {
    if command -v stow &>/dev/null; then
        info "stow already installed"
        return
    fi

    warn "stow not found, installing..."
    if command -v apt &>/dev/null; then
        sudo apt update && sudo apt install -y stow
    elif command -v brew &>/dev/null; then
        brew install stow
    else
        error "No supported package manager found. Install stow manually."
    fi
    info "stow installed"
}

# ── Stow packages ────────────────────────────────────────────
stow_packages() {
    cd "$DOTFILES_DIR"
    for pkg in "${PACKAGES[@]}"; do
        if [ -d "$pkg" ]; then
            stow -v --restow "$pkg" 2>&1 | sed "s/^/  /"
            info "stowed $pkg"
        else
            warn "package $pkg not found, skipping"
        fi
    done
}

# ── Neovim ────────────────────────────────────────────────────
setup_nvim() {
    if [ -d "$HOME/.config/nvim/.git" ]; then
        info "nvim config already exists, pulling latest"
        git -C "$HOME/.config/nvim" pull --rebase 2>&1 | sed "s/^/  /"
    else
        warn "cloning nvim config..."
        git clone "$NVIM_REPO" "$HOME/.config/nvim"
        info "nvim config cloned"
    fi
}

# ── Main ──────────────────────────────────────────────────────
main() {
    echo "╔══════════════════════════════════════╗"
    echo "║         dotfiles installer           ║"
    echo "╚══════════════════════════════════════╝"
    echo

    install_stow
    echo
    stow_packages
    echo
    setup_nvim

    echo
    info "done. open a new shell to pick up changes."
}

main "$@"
