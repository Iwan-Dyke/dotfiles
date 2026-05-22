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

# ── Theme ─────────────────────────────────────────────────────
_SHELL_THEME=$(cat ~/.config/shell/theme 2>/dev/null || echo batman)

# ── Theme-aware aliases ───────────────────────────────────────
if [[ "$_SHELL_THEME" == "batman" ]]; then
    alias batcomputer="echo '◈ BATCOMPUTER ONLINE ◈'"
    alias status="git status"
    alias deploy="echo 'Deploying to Wayne Enterprises servers...'"
    alias editor="nvim"
    alias cave="nvim"

    alias systems="echo '◈ BATCAVE SYSTEMS ◈' && echo 'Batcomputer: ONLINE' && echo 'Comms Array: ACTIVE' && echo 'Perimeter: SECURE' && echo 'Threat Level: LOW'"
    alias core="echo '◈ CORE DIAGNOSTICS ◈' && sysctl -n vm.loadavg"
    alias arsenal="echo '◈ ARSENAL STATUS ◈' && echo 'Batarangs: STOCKED' && echo 'Grapple Gun: CHARGED' && echo 'Smoke Pellets: FULL'"
    alias comms="echo '◈ COMMS ARRAY ◈' && netstat -tuln | head -10"
    alias ping-oracle="echo '◈ ORACLE UPLINK ◈' && ping -c 3 8.8.8.8"

    alias network-status="echo '◈ BATFAMILY NETWORK ◈' && ps aux | head -10"
    alias watchtower="echo '◈ WATCHTOWER FEED ◈' && top -l 1 | head -10"
    alias threats="echo '◈ THREAT SCAN ◈' && ps aux | grep -v grep | wc -l && echo 'processes active'"
    alias vault="echo '◈ BATCAVE VAULT ◈' && ls -la"

    alias intel="echo '◈ WAYNE INTEL ◈' && uname -a && echo '' && sysctl -n machdep.cpu.brand_string"
    alias oracle="echo '◈ ORACLE DATABASE ◈' && who && echo '' && last | head -5"

    alias health="echo '◈ SYSTEM HEALTH ◈' && echo '' && df -h | head -5 && echo '' && vm_stat | head -5 && echo '' && uptime"
    alias power="echo '◈ POWER CELLS ◈' && sysctl -n vm.loadavg && echo '' && pmset -g batt 2>/dev/null || echo 'Power info unavailable'"
    alias perimeter="echo '◈ PERIMETER CHECK ◈' && ping -c 3 8.8.8.8"
    alias defenses="echo '◈ DEFENSE GRID ◈' && who && echo '' && last | head -5"
    alias resources="echo '◈ RESOURCE ALLOCATION ◈' && top -l 1 | head -15"

    alias recon='echo "◈ RECON SWEEP ◈" && ls -la'
    alias scan='echo "◈ DEEP SCAN ◈" && find . -type f | head -20'
    alias update-crt='echo "◈ REBUILDING SYSTEMS ◈" && build-cool-retro-term'

    alias commands="echo '◈ BATCOMPUTER COMMAND DIRECTORY ◈' && echo '' && echo 'BATCAVE SYSTEMS:' && echo '  systems    - Batcave status' && echo '  core       - Core diagnostics' && echo '  arsenal    - Arsenal status' && echo '  comms      - Comms array' && echo '  ping-oracle - Oracle uplink' && echo '' && echo 'BATFAMILY NETWORK:' && echo '  network-status - Network overview' && echo '  watchtower - Watchtower feed' && echo '  threats    - Threat scan' && echo '  vault      - Batcave vault' && echo '' && echo 'INTELLIGENCE:' && echo '  intel      - Wayne intelligence' && echo '  oracle     - Oracle database' && echo '' && echo 'MONITORING:' && echo '  health     - System health' && echo '  power      - Power cells' && echo '  perimeter  - Perimeter check' && echo '  defenses   - Defense grid' && echo '  resources  - Resource usage' && echo '' && echo 'RECONNAISSANCE:' && echo '  mission    - Current briefing' && echo '  recon      - Recon sweep' && echo '  scan       - Deep scan' && echo '  weather    - External conditions' && echo '' && echo 'THEME:' && echo '  shell-theme batman|matrix - Switch theme'"

else
    alias matrix="echo '▓ NEURAL INTERFACE ACTIVE ▓'"
    alias status="git status"
    alias deploy="echo 'Uploading to the Construct...'"
    alias bluepill="echo 'Access Denied - Redpills Only'"
    alias editor="nvim"
    alias construct="nvim"

    alias zion="echo '▓ ZION MAINFRAME ▓' && echo 'Neural Link: ACTIVE' && echo 'Construct: LOADED' && echo 'Broadcast Depth: OPTIMAL' && echo 'Sentinel Alert: CLEAR'"
    alias core="echo '▓ CORE STATUS ▓' && sysctl -n vm.loadavg"
    alias emp="echo '▓ EMP CHARGE ▓' && echo 'Capacitors: READY' && echo 'Power Coupling: 100%' && echo 'Discharge: ARMED'"
    alias broadcast="echo '▓ BROADCAST SIGNAL ▓' && netstat -tuln | head -10"
    alias jack="echo '▓ JACKING IN ▓' && ping -c 3 8.8.8.8"

    alias fleet="echo '▓ HOVERCRAFT FLEET ▓' && ps aux | head -10"
    alias neb="echo '▓ NEBUCHADNEZZAR STATUS ▓' && top -l 1 | head -10"
    alias sentinel="echo '▓ SENTINEL SCAN ▓' && ps aux | grep -v grep | wc -l && echo 'processes detected'"
    alias dock="echo '▓ ZION DOCK ▓' && ls -la"

    alias intel="echo '▓ SYSTEM INTEL ▓' && uname -a && echo '' && sysctl -n machdep.cpu.brand_string"
    alias oracle="echo '▓ ORACLE NETWORK ▓' && who && echo '' && last | head -5"

    alias health="echo '▓ SYSTEM STATUS ▓' && echo '' && df -h | head -5 && echo '' && vm_stat | head -5 && echo '' && uptime"
    alias power="echo '▓ POWER GRID ▓' && sysctl -n vm.loadavg && echo '' && pmset -g batt 2>/dev/null || echo 'Power info unavailable'"
    alias network="echo '▓ SIGNAL STRENGTH ▓' && ping -c 3 8.8.8.8"
    alias defenses="echo '▓ SECURITY STATUS ▓' && who && echo '' && last | head -5"
    alias resources="echo '▓ RESOURCE ALLOCATION ▓' && top -l 1 | head -15"

    alias recon='echo "▓ SCANNING SECTOR ▓" && ls -la'
    alias scan='echo "▓ DEEP SCAN ▓" && find . -type f | head -20'
    alias update-crt='echo "▓ REBUILDING CONSTRUCT ▓" && build-cool-retro-term'

    alias commands="echo '▓ ZION COMMAND DIRECTORY ▓' && echo '' && echo 'ZION SYSTEMS:' && echo '  zion       - Mainframe status' && echo '  core       - Core diagnostics' && echo '  emp        - EMP charge status' && echo '  broadcast  - Broadcast signal' && echo '  jack       - Jack in test' && echo '' && echo 'HOVERCRAFT FLEET:' && echo '  fleet      - Fleet overview' && echo '  neb        - Nebuchadnezzar status' && echo '  sentinel   - Sentinel scan' && echo '  dock       - Zion dock' && echo '' && echo 'INTELLIGENCE:' && echo '  intel      - System intelligence' && echo '  oracle     - Oracle network' && echo '' && echo 'MONITORING:' && echo '  health     - System status' && echo '  power      - Power grid' && echo '  network    - Signal test' && echo '  defenses   - Security status' && echo '  resources  - Resource usage' && echo '' && echo 'RECONNAISSANCE:' && echo '  mission    - Current briefing' && echo '  recon      - Directory scan' && echo '  scan       - Deep file search' && echo '  weather    - External conditions' && echo '' && echo 'THEME:' && echo '  shell-theme batman|matrix - Switch theme'"
fi

# ── Functions ─────────────────────────────────────────────────
mission() {
    if [[ "$_SHELL_THEME" == "batman" ]]; then
        echo "◈ MISSION BRIEFING ◈"
    else
        echo "▓ MISSION BRIEFING ▓"
    fi
    echo "Current Location: $(pwd)"
    echo "Files in Sector: $(ls -1 | wc -l)"
    echo "Disk Usage: $(df -h . | tail -1 | awk '{print $5}')"
    echo "System Load: $(uptime | awk -F'load averages:' '{print $2}')"
    echo "Timestamp: $(date)"
    echo ""
}

weather() {
    if command -v curl &>/dev/null; then
        if [[ "$_SHELL_THEME" == "batman" ]]; then
            echo "◈ WEATHER INTEL ◈"
        else
            echo "▓ EXTERNAL CONDITIONS ▓"
        fi
        curl -s "wttr.in/?format=3"
    else
        echo "Signal lost - cannot access external data"
    fi
}

exit() {
    echo ""
    if [[ "$_SHELL_THEME" == "batman" ]]; then
        echo ">>> BATCOMPUTER SHUTTING DOWN <<<"
        echo ">>> THE NIGHT IS YOURS <<<"
    else
        echo ">>> DISCONNECTING FROM THE MATRIX <<<"
        echo ">>> SEE YOU IN ZION <<<"
    fi
    echo ""
    builtin exit
}

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

# ── Navigation ────────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# ── File operations ───────────────────────────────────────────
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'

# ── Git shortcuts ─────────────────────────────────────────────
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# ── System info ───────────────────────────────────────────────
alias myip='curl -s ifconfig.me'
alias ports='netstat -tuln'
alias path='echo -e ${PATH//:/\\n}'
alias psg='ps aux | grep'
alias ff='find . -name'
alias grep='grep --color=auto -n'

# ── Neovim ────────────────────────────────────────────────────
alias nvim-dev='NVIM_APPNAME=nvim-dev nvim'
alias nvim-clean='NVIM_APPNAME=nvim-clean nvim'
alias nvim-work='nvim'

# ── Eza (ls replacement) ──────────────────────────────────────
export EZA_CONFIG_DIR=~/.config/eza
alias ls='eza --icons --color=always'
alias ll='eza --icons --color=always -la'
alias la='eza --icons --color=always -a'
alias lt='eza --icons --color=always --tree --level=2'

# ── FZF ───────────────────────────────────────────────────────
if [[ "$_SHELL_THEME" == "batman" ]]; then
    export FZF_DEFAULT_OPTS='--color=fg:#a0b4cc,bg:#0d1117,hl:#4fc3f7,fg+:#e0e8f0,bg+:#121a24,hl+:#4fc3f7,info:#6a9fd8,prompt:#4fc3f7,pointer:#4fc3f7,marker:#4fc3f7,spinner:#6a9fd8'
else
    export FZF_DEFAULT_OPTS='--color=fg:#00ff41,bg:#000000,hl:#66ff99,fg+:#00ff41,bg+:#003300,hl+:#66ff99,info:#00cc33,prompt:#00ff41,pointer:#00ff41,marker:#00ff41,spinner:#00cc33'
fi
[[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[[ -f /opt/homebrew/opt/fzf/shell/completion.zsh  ]] && source /opt/homebrew/opt/fzf/shell/completion.zsh

# ── Zoxide ────────────────────────────────────────────────────
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# ── Credentials ───────────────────────────────────────────────
[[ -f ~/.config/jira/credentials ]] && source ~/.config/jira/credentials
[[ -f ~/.config/claude/work.env  ]] && source ~/.config/claude/work.env

# ── Greeting ──────────────────────────────────────────────────
if [[ "$_SHELL_THEME" == "batman" ]]; then
    echo ""
    echo -e "\033[38;2;79;195;247m╭────────────────────────────────────────────────────────────────────────────────╮\033[0m"
    echo -e "\033[38;2;79;195;247m│\033[0m       \033[1;38;2;160;180;204m◈  B A T C O M P U T E R   v7.0  //  D U P I N  ◈\033[0m            \033[38;2;79;195;247m│\033[0m"
    echo -e "\033[38;2;79;195;247m╰────────────────────────────────────────────────────────────────────────────────╯\033[0m"
    echo ""
    echo -e "\033[38;2;160;180;204m              Welcome back, Batman.\033[0m"
    echo ""
    echo -e "\033[38;2;79;195;247m      ◈ CAVE NETWORK        ONLINE\033[0m"
    echo -e "\033[38;2;79;195;247m      ◈ ORACLE UPLINK       ACTIVE\033[0m"
    echo -e "\033[38;2;79;195;247m      ◈ PERIMETER GRID      SECURE\033[0m"
    echo -e "\033[38;2;79;195;247m      ◈ THREAT LEVEL        LOW\033[0m"
    echo ""
    echo -e "\033[38;2;160;180;204m>>> WAYNE ENTERPRISES SECURE TERMINAL <<<\033[0m"
    echo -e "\033[38;2;160;180;204m>>> OPERATOR: DYKE <<<\033[0m"
    echo -e "\033[38;2;90;112;144m>>> PROTOCOL: DARK KNIGHT <<<\033[0m"
    echo -e "\033[38;2;90;112;144m>>> TIMESTAMP: $(date '+%Y.%m.%d %H:%M') <<<\033[0m"
    echo -e "\033[38;2;90;112;144m>>> UPTIME: $(uptime | sed 's/.*up //' | cut -d',' -f1) <<<\033[0m"
    echo ""
    echo -e "\033[38;2;90;112;144m    Type '\033[38;2;79;195;247mcommands\033[38;2;90;112;144m' for Command Directory\033[0m"
    echo ""
else
    echo ""
    echo -e "\033[32m╭────────────────────────────────────────────────────────────────────────────────╮\033[0m"
    echo -e "\033[32m│\033[0m          \033[92m░▒▓  T H E   M A T R I X  ▓▒░\033[0m                                   \033[32m│\033[0m"
    echo -e "\033[32m╰────────────────────────────────────────────────────────────────────────────────╯\033[0m"
    echo ""
    echo -e "\033[97m              I am the Architect. I created the Matrix.\033[0m"
    echo ""
    echo -e "\033[32m      ▓ NEURAL INTERFACE CONNECTED\033[0m"
    echo -e "\033[32m      ▓ CONSTRUCT LOADED\033[0m"
    echo -e "\033[32m      ▓ OPERATOR STANDING BY\033[0m"
    echo -e "\033[32m      ▓ SYSTEM NOMINAL\033[0m"
    echo ""
    echo -e "\033[97m>>> ZION MAINFRAME ACCESS GRANTED <<<\033[0m"
    echo -e "\033[97m>>> ARCHITECT: DYKE <<<\033[0m"
    echo -e "\033[90m>>> ITERATION: 7.0 <<<\033[0m"
    echo -e "\033[90m>>> TIMESTAMP: $(date '+%Y.%m.%d %H:%M') <<<\033[0m"
    echo -e "\033[90m>>> UPTIME: $(uptime | sed 's/.*up //' | cut -d',' -f1) <<<\033[0m"
    echo ""
    echo -e "\033[90m    Type '\033[92mcommands\033[90m' for System Directory\033[0m"
    echo ""
fi

# ── Auto-load work session in Cool Retro Term ────────────────
[[ "$TERM_PROGRAM" == "cool-retro-term" && -z "$TMUX" ]] && exec loadup work

# ── Starship prompt ───────────────────────────────────────────
eval "$(starship init zsh)"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

export PATH="$HOME/bin:$PATH"
export DOCKER_API_VERSION=1.44
