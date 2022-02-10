export GPG_TTY=$(tty)
export TERM=screen-256color
export TERMINFO=/usr/share/terminfo
# binaries
export texlive=/usr/local/texlive/

# mac specific
alias o="open"
alias allow="sudo spctl --master-disable"
alias crack="sudo xattr -r -d com.apple.quarantine"
alias ipf="dscacheutil -flushcache"

function clean {
    for trash_d in $(ls ${HOME}/Library/Caches/ | rg --invert-match "com.apple" | rg --invert-match "CloudKit" | rg --invert-match "FamilyCircle"); do
        rm -rf ${HOME}/Library/Caches/${trash_d}/*
    done
    mkdir -p $(brew --cache)/Cask
}

# mas
alias mis="mas install"
alias mus="mas uninstall"
alias mug="mas upgrade"
alias mh="mas help"
alias mif="mas info"
alias ml="mas list"
alias mod="mas outdated"
alias msc="mas search"
alias msi="mas signin"
alias mso="mas signout"
alias mvd="mas vendor"
