
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.pre.bash"


# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/bashrc.pre.bash"



# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Matrix aliases
alias matrix="echo '▓ NEURAL INTERFACE ACTIVE ▓'"
alias status="git status"
alias deploy="echo 'Uploading to the Construct...'"
alias bluepill="echo 'Access Denied - Redpills Only'"
alias editor="nvim"
alias construct="nvim"

# Zion Systems
alias zion="echo '▓ ZION MAINFRAME ▓' && echo 'Neural Link: ACTIVE' && echo 'Construct: LOADED' && echo 'Broadcast Depth: OPTIMAL' && echo 'Sentinel Alert: CLEAR'"
alias core="echo '▓ CORE STATUS ▓' && cat /proc/loadavg && echo 'System Temperature: NOMINAL'"
alias emp="echo '▓ EMP CHARGE ▓' && echo 'Capacitors: READY' && echo 'Power Coupling: 100%' && echo 'Discharge: ARMED'"
alias broadcast="echo '▓ BROADCAST SIGNAL ▓' && netstat -tuln | head -10"
alias jack="echo '▓ JACKING IN ▓' && ping -c 3 8.8.8.8"

# Hovercraft Fleet Commands
alias fleet="echo '▓ HOVERCRAFT FLEET ▓' && ps aux | head -10"
alias neb="echo '▓ NEBUCHADNEZZAR STATUS ▓' && top -bn1 | head -10"
alias sentinel="echo '▓ SENTINEL SCAN ▓' && ps aux | grep -v grep | wc -l && echo 'processes detected'"
alias dock="echo '▓ ZION DOCK ▓' && ls -la"

# Matrix Intelligence
alias intel="echo '▓ SYSTEM INTEL ▓' && uname -a && echo '' && lscpu | head -5"
alias trace="echo '▓ TRACE PROGRAM ▓' && nmap -sn 192.168.1.0/24 2>/dev/null | grep -E 'Nmap scan|Host is up' || echo 'Trace requires nmap'"
alias oracle="echo '▓ ORACLE NETWORK ▓' && who && echo '' && last | head -5"

# System Health Commands
alias health="echo '▓ SYSTEM STATUS ▓' && echo '' && df -h | head -5 && echo '' && free -h && echo '' && uptime"
alias power="echo '▓ POWER GRID ▓' && cat /proc/loadavg && echo '' && sensors 2>/dev/null || echo 'Thermal sensors offline'"
alias network="echo '▓ SIGNAL STRENGTH ▓' && ping -c 3 8.8.8.8"
alias defenses="echo '▓ SECURITY STATUS ▓' && who && echo '' && last | head -5"
alias resources="echo '▓ RESOURCE ALLOCATION ▓' && top -bn1 | head -15"

# Matrix Command Directory
alias commands="echo '▓ ZION COMMAND DIRECTORY ▓' && echo '' && echo 'ZION SYSTEMS:' && echo '  zion       - Mainframe status' && echo '  core       - Core diagnostics' && echo '  emp        - EMP charge status' && echo '  broadcast  - Broadcast signal' && echo '  jack       - Jack in test' && echo '' && echo 'HOVERCRAFT FLEET:' && echo '  fleet      - Fleet overview' && echo '  neb        - Nebuchadnezzar status' && echo '  sentinel   - Sentinel scan' && echo '  dock       - Zion dock' && echo '' && echo 'INTELLIGENCE:' && echo '  intel      - System intelligence' && echo '  trace      - Trace program' && echo '  oracle     - Oracle network' && echo '' && echo 'OPERATIONS:' && echo '  matrix     - Activate neural interface' && echo '  status     - Git repository status' && echo '  deploy     - Upload to Construct' && echo '  bluepill   - Access denied' && echo '' && echo 'MONITORING:' && echo '  health     - System status' && echo '  power      - Power grid' && echo '  network    - Signal test' && echo '  defenses   - Security status' && echo '  resources  - Resource usage' && echo '' && echo 'RECONNAISSANCE:' && echo '  mission    - Current briefing' && echo '  recon      - Directory scan' && echo '  scan       - Deep file search' && echo '  weather    - External conditions' && echo '' && echo 'NAVIGATION:' && echo '  ..         - Up one level' && echo '  ...        - Up two levels' && echo '  ....       - Up three levels' && echo '' && echo 'QUICK ACCESS:' && echo '  myip       - External IP' && echo '  ports      - Active ports' && echo '  psg        - Process search'"

# Mission briefing function
mission() {
    echo "▓ MISSION BRIEFING ▓"
    echo "Current Location: $(pwd)"
    echo "Files in Sector: $(ls -1 | wc -l)"
    echo "Disk Usage: $(df -h . | tail -1 | awk '{print $5}')"
    echo "System Load: $(uptime | awk -F'load average:' '{print $2}')"
    echo "Timestamp: $(date)"
    echo ""
}

# Weather check
weather() {
    if command -v curl &> /dev/null; then
        echo "▓ EXTERNAL CONDITIONS ▓"
        curl -s "wttr.in/?format=3"
    else
        echo "Signal lost - cannot access external data"
    fi
}

# Enhanced directory listing
alias recon='echo "▓ SCANNING SECTOR ▓" && ls -la'
alias scan='echo "▓ DEEP SCAN ▓" && find . -type f | head -20'

# Matrix exit message
exit() {
    echo ""
    echo ">>> DISCONNECTING FROM THE MATRIX <<<"
    echo ">>> SEE YOU IN ZION <<<"
    echo ""
    builtin exit
}

# Enhanced history settings
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
export HISTIGNORE="ls:ll:la:cd:pwd:exit:clear:history"

# Better directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# Enhanced file operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Quick system info
alias myip='curl -s ifconfig.me'
alias ports='netstat -tuln'
alias path='echo -e ${PATH//:/\\n}'

# Git shortcuts (beyond your existing 'status')
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# Quick file search
alias ff='find . -name'
alias grep='grep --color=auto -n'

# Process management
alias psg='ps aux | grep'
alias killall='killall -v'

# Matrix greeting with dynamic elements
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
echo -e "\033[90m>>> UPTIME: $(uptime -p | sed 's/up //' | head -c 20) <<<\033[0m"
echo ""
echo -e "\033[90m    Type '\033[92mcommands\033[90m' for System Directory\033[0m"
echo ""
# Add Windows pipx tools to PATH
export PATH="/mnt/c/Users/DykeI/pipx/venvs/jupytext/Scripts:$PATH"
# Neovim configs
alias nvim-dev="NVIM_APPNAME=nvim-dev nvim"
alias nvim-clean="NVIM_APPNAME=nvim-clean nvim"
alias nvim-work="nvim"
export BROWSER="cmd.exe /c start"
# Neovim dev config alias
alias nvim-dev='NVIM_APPNAME=nvim-dev nvim'
export PATH=~/bin:$PATH



# Initialize Starship (must be after Kiro CLI)
eval "$(starship init bash)"

# Trigger prompt display after banner (only for interactive shells)
[[ $- == *i* ]] && starship_precmd 2>/dev/null && PS1="$(starship prompt --status=$? --jobs=0 --cmd-duration=0)"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/bashrc.post.bash" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/bashrc.post.bash"

# Yazi: cd into browsed directory on quit
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Matrix-themed eza
export EZA_CONFIG_DIR=~/.config/eza
alias ls='eza --icons --color=always'
alias ll='eza --icons --color=always -la'
alias la='eza --icons --color=always -a'
alias lt='eza --icons --color=always --tree --level=2'

# Matrix-themed fzf
export FZF_DEFAULT_OPTS='--color=fg:#00ff41,bg:#000000,hl:#66ff99,fg+:#00ff41,bg+:#003300,hl+:#66ff99,info:#00cc33,prompt:#00ff41,pointer:#00ff41,marker:#00ff41,spinner:#00cc33'

# Auto-start cron service
sudo service cron status > /dev/null 2>&1 || sudo service cron start > /dev/null 2>&1

# Jira credentials (shared by jiratui and jira-cli)
[ -f ~/.config/jira/credentials ] && source ~/.config/jira/credentials

# Claude CLI auth (work)
[ -f ~/.config/claude/work.env ] && source ~/.config/claude/work.env
. "$HOME/.cargo/env"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash"
