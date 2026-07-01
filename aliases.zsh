# Better ls
alias ls='eza --icons --group-directories-first'

# Detailed listing
alias ll='eza -lh --icons --git --group-directories-first'

# Detailed listing including hidden files
alias la='eza -lah --icons --git --group-directories-first'

# Tree view
alias tree='eza --tree --icons --group-directories-first'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
alias cat='bat'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
#alias cd="z" # Substitui o 'cd' padrão pelo 'zoxide', mas mantém o funcionamento normal do cd

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# =========================================================
# Editor
# =========================================================

alias vim='nvim'

# =========================================================
# Git
# =========================================================

alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# =========================================================
# Video
# =========================================================

alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'

# =========================================================
# APT / FLATPAK / BREW
# =========================================================
alias clean-up="sudo apt autoclean && sudo apt autoremove; brew cleanup"
alias up-all="echo '########## APT ##########';sudo apt update && sudo apt full-upgrade;echo '\n########## FLATPAK ##########';flatpak update;echo '\n########## BREW ##########';brew update && brew outdated && brew upgrade"

# =========================================================
# Apps
# =========================================================
alias zed="flatpak run dev.zed.Zed"
alias agy-ide="/home/besser/Apps/Antigravity/Antigravity\ IDE/antigravity-ide"
