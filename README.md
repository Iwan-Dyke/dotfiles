# dotfiles

Personal configs managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

```bash
git clone https://github.com/Iwan-Dyke/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script will:
1. Install `stow` if missing
2. Symlink all config packages into `$HOME`
3. Clone the [nvim config](https://github.com/Iwan-Dyke/nvim-config.git) if not present

## Packages

| Package | Target | Description |
|---------|--------|-------------|
| `yazi` | `~/.config/yazi/` | File manager — config, keymap, Matrix theme |
| `starship` | `~/.config/starship.toml` | Matrix-themed prompt |
| `eza` | `~/.config/eza/` | Matrix-themed ls |
| `fish` | `~/.config/fish/conf.d/` | Shell aliases and PATH |
| `lazygit` | `~/.config/lazygit/` | Git TUI |
| `lazydocker` | `~/.config/lazydocker/` | Docker TUI |
| `tmux` | `~/.tmux.conf` | Terminal multiplexer |
| `git` | `~/.gitconfig` | Git config (rebase, rerere, credential helpers) |
| `kiro-cli` | `~/.config/kiro-cli/` | MCP server config |

## Usage

Stow/unstow individual packages:

```bash
cd ~/dotfiles
stow yazi          # create symlinks
stow -D yazi       # remove symlinks
stow -R yazi       # restow (remove + create)
```

## Machine-Specific Config

Git config supports machine-specific overrides via `~/.gitconfig.local` (not tracked):

```gitconfig
[user]
    email = personal@example.com
```

## Neovim

Nvim has its own repo and is not managed by Stow. The install script clones it to `~/.config/nvim`.
