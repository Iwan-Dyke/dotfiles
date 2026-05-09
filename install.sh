#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGES=(yazi starship eza fish lazygit lazydocker tmux git bin bash zsh ghostty)
NVIM_REPO="git@github.com:Iwan-Dyke/nvim-config.git"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

info()  { printf '\033[0;32m[✓]\033[0m %s\n' "$1"; }
warn()  { printf '\033[0;33m[!]\033[0m %s\n' "$1"; }
error() { printf '\033[0;31m[✗]\033[0m %s\n' "$1"; exit 1; }

usage() {
    cat <<EOF
Usage: $0 [OPTION]

  (no args)   Install: stow packages and sync nvim
  -D          Uninstall: unstow all packages (leaves nvim alone)
  -h          Show this help
EOF
    exit 0
}

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

# ── Back up pre-existing real files that would conflict ──────
backup_conflicts() {
    local moved=0
    for pkg in "${PACKAGES[@]}"; do
        [ -d "$DOTFILES_DIR/$pkg" ] || continue
        while IFS= read -r src; do
            local rel="${src#$DOTFILES_DIR/$pkg/}"
            local tgt="$HOME/$rel"
            if [ -e "$tgt" ] && [ ! -L "$tgt" ]; then
                # Skip if already stowed via a parent-dir symlink (real path lives in the repo)
                local real; real="$(readlink -f "$tgt")"
                case "$real" in
                    "$DOTFILES_DIR"/*) continue ;;
                esac
                if [ "$moved" -eq 0 ]; then
                    mkdir -p "$BACKUP_DIR"
                    warn "backing up conflicting real files to $BACKUP_DIR"
                fi
                mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
                mv "$tgt" "$BACKUP_DIR/$rel"
                echo "  moved $tgt"
                moved=1
            fi
        done < <(find "$DOTFILES_DIR/$pkg" -type f -not -path '*/.git/*')
    done
    if [ "$moved" -eq 0 ]; then
        info "no pre-existing conflicts"
    fi
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

unstow_packages() {
    cd "$DOTFILES_DIR"
    for pkg in "${PACKAGES[@]}"; do
        if [ -d "$pkg" ]; then
            stow -v -D "$pkg" 2>&1 | sed "s/^/  /"
            info "unstowed $pkg"
        fi
    done
}

# ── Neovim ────────────────────────────────────────────────────
setup_nvim() {
    if [ -d "$HOME/.config/nvim/.git" ]; then
        info "nvim config exists, syncing to origin/main (repo is source of truth)"
        git -C "$HOME/.config/nvim" fetch origin 2>&1 | sed "s/^/  /"
        git -C "$HOME/.config/nvim" reset --hard origin/main 2>&1 | sed "s/^/  /"
    else
        warn "cloning nvim config..."
        git clone "$NVIM_REPO" "$HOME/.config/nvim"
        info "nvim config cloned"
    fi
}

# ── Main ──────────────────────────────────────────────────────
main() {
    local mode="install"
    while [ $# -gt 0 ]; do
        case "$1" in
            -D) mode="uninstall" ;;
            -h|--help) usage ;;
            *) error "unknown option: $1" ;;
        esac
        shift
    done

    echo "╔══════════════════════════════════════╗"
    echo "║         dotfiles installer           ║"
    echo "╚══════════════════════════════════════╝"
    echo

    if [ "$mode" = "uninstall" ]; then
        unstow_packages
        echo
        info "done. nvim config at ~/.config/nvim left untouched."
        return
    fi

    install_stow
    echo
    backup_conflicts
    echo
    stow_packages
    echo
    setup_nvim

    echo
    info "done. open a new shell to pick up changes."
}

main "$@"
