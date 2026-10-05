# Tmux Themes Module

## Problem

Ghostty has `themes/` with named files. Nvim has `colors/<name>.lua`. Tmux colours are hardcoded in `.tmux.conf` — no way to switch without editing.

## Goal

Store tmux themes as named files. Switch with a single tmux command.

## Design

```
dotfiles/tmux/
├── .tmux.conf
└── .tmux/themes/
    ├── matrix.conf
    ├── imperial.conf
    ├── wayne-tech.conf
    └── skynet.conf
```

Each theme file sets status bar, message, and pane border styles. Values derived from the same palettes as Ghostty/nvim.

### Switching

```bash
tmux source-file ~/.tmux/themes/matrix.conf
```

That's it. Instant, no restart.

### .tmux.conf change

Replace hardcoded colours with:

```tmux
source-file ~/.tmux/themes/skynet.conf
```

Default on startup. Switch live whenever.

### Theme file format

```tmux
# skynet
set -g status-style 'bg=#0a0000,fg=#ff3030'
set -g window-status-current-style 'fg=#ff6060,bold'
set -g window-status-style 'fg=#881515'
set -g message-style 'bg=#1a0808,fg=#ff3030'
set -g message-command-style 'bg=#1a0808,fg=#cc2020'
set -g pane-border-style 'fg=#551010'
set -g pane-active-border-style 'fg=#ff3030'
```

### Implementation

1. Create `dotfiles/tmux/.tmux/themes/` with 4 theme files
2. Replace hardcoded colours in `.tmux.conf` with `source-file`
3. Stow picks it up, done

### Optional later

- Bind a key to cycle themes
- A wrapper script if you want to persist the choice across sessions
