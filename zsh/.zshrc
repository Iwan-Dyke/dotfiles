# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh" ]] && source "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh"

# ── History ───────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_VERIFY APPEND_HISTORY SHARE_HISTORY
export HISTIGNORE="ls:ll:la:cd:pwd:exit:clear:history"

# ── Completion ────────────────────────────────────────────────
autoload -Uz compinit && compinit

# ── PATH ──────────────────────────────────────────────────────
export PATH=~/bin:/opt/homebrew/bin:$HOME/.local/bin:$PATH
export STAGER_HOME=~/.config/stager-teams

# ── Aliases ───────────────────────────────────────────────────
alias status="git status"
alias editor="nvim"

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# File operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'

# Git shortcuts
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# System info
alias myip='curl -s ifconfig.me'
alias ports='netstat -tuln'
alias path='echo -e ${PATH//:/\\n}'
alias psg='ps aux | grep'
alias ff='find . -name'
alias grep='grep --color=auto -n'

# Neovim
alias nvim-dev='NVIM_APPNAME=nvim-dev nvim'
alias nvim-clean='NVIM_APPNAME=nvim-clean nvim'
alias nvim-work='nvim'

# Eza (ls replacement)
export EZA_CONFIG_DIR=~/.config/eza
alias ls='eza --icons --color=always'
alias ll='eza --icons --color=always -la'
alias la='eza --icons --color=always -a'
alias lt='eza --icons --color=always --tree --level=2'

# ── Functions ─────────────────────────────────────────────────
# Yazi: cd into browsed directory on quit
y() {
    local tmp cwd
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# ── FZF ───────────────────────────────────────────────────────
export FZF_DEFAULT_OPTS='--color=fg:#00ff41,bg:#000000,hl:#7FFF00,fg+:#B0FFB0,bg+:#0a2a0a,hl+:#33ffcc,info:#00cc66,prompt:#00ff41,pointer:#39FF14,marker:#39FF14,spinner:#00cc66'
[[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[[ -f /opt/homebrew/opt/fzf/shell/completion.zsh  ]] && source /opt/homebrew/opt/fzf/shell/completion.zsh

# ── Zoxide ────────────────────────────────────────────────────
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# ── Credentials ───────────────────────────────────────────────
[[ -f ~/.config/jira/credentials ]] && source ~/.config/jira/credentials
[[ -f ~/.config/claude/work.env  ]] && source ~/.config/claude/work.env

# ── Greeting ──────────────────────────────────────────────────
_cc_teal="\033[38;2;86;182;162m"
_cc_blue="\033[38;2;91;143;189m"
_cc_gold="\033[38;2;212;169;89m"
_cc_fg="\033[38;2;201;209;217m"
_cc_dim="\033[38;2;74;85;104m"
_cc_warn="\033[38;2;212;169;89m"
_cc_err="\033[38;2;176;64;80m"
_cc_reset="\033[0m"

# Systems: load average check
_load=$(sysctl -n vm.loadavg 2>/dev/null | awk '{print $2}')
_cores=$(sysctl -n hw.ncpu 2>/dev/null || echo 8)
if (( $(echo "$_load > $_cores" | bc -l 2>/dev/null || echo 0) )); then
    _sys_status="${_cc_err}high load${_cc_reset}"
elif (( $(echo "$_load > $_cores * 0.7" | bc -l 2>/dev/null || echo 0) )); then
    _sys_status="${_cc_warn}elevated${_cc_reset}"
else
    _sys_status="${_cc_fg}nominal${_cc_reset}"
fi

# Network: quick gateway ping
if ping -c1 -W1 1.1.1.1 &>/dev/null; then
    _net_status="${_cc_fg}active${_cc_reset}"
else
    _net_status="${_cc_err}offline${_cc_reset}"
fi

# Monitor: disk usage check
_disk_pct=$(df -h / | awk 'NR==2 {gsub(/%/,"",$5); print $5}')
if [[ "$_disk_pct" -gt 90 ]]; then
    _mon_status="${_cc_err}disk ${_disk_pct}%${_cc_reset}"
elif [[ "$_disk_pct" -gt 75 ]]; then
    _mon_status="${_cc_warn}disk ${_disk_pct}%${_cc_reset}"
else
    _mon_status="${_cc_fg}nominal${_cc_reset}"
fi

echo ""
echo -e "${_cc_blue}  ╭──────────────────────────────────────────────────╮${_cc_reset}"
echo -e "${_cc_blue}  │${_cc_reset}  ${_cc_gold}◆${_cc_reset} ${_cc_fg}Command Centre${_cc_reset} ${_cc_dim}v2.1${_cc_reset}                          ${_cc_blue}│${_cc_reset}"
echo -e "${_cc_blue}  ╰──────────────────────────────────────────────────╯${_cc_reset}"
echo ""
echo -e "${_cc_teal}    systems ${_cc_dim}·········${_cc_reset} $_sys_status"
echo -e "${_cc_teal}    network ${_cc_dim}·········${_cc_reset} $_net_status"
echo -e "${_cc_teal}    monitor ${_cc_dim}·········${_cc_reset} $_mon_status"
echo ""
echo -e "${_cc_dim}    $(date '+%Y.%m.%d %H:%M') · up $(uptime | sed 's/.*up //' | cut -d',' -f1)${_cc_reset}"
echo ""

unset _load _cores _sys_status _net_status _disk_pct _mon_status
unset _cc_teal _cc_blue _cc_gold _cc_fg _cc_dim _cc_warn _cc_err _cc_reset

# ── Auto-load work session in Cool Retro Term ────────────────
[[ "$TERM_PROGRAM" == "cool-retro-term" && -z "$TMUX" ]] && exec loadup work

# ── Starship prompt ───────────────────────────────────────────
eval "$(starship init zsh)"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

export PATH="$HOME/bin:$PATH"
export DOCKER_API_VERSION=1.44
export DENO_CERT="$HOME/.config/certs/dvla-ca-bundle.pem"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
