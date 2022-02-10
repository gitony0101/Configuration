export HOMEBREW_NO_AUTO_UPDATE=true

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## deal with the architectures
function bis {
    if [[ $(uname -m) == 'arm64' ]]; then
        arch -arm64 brew install $@
    else
        brew install $@
    fi
}

function bris {
    if [[ $(uname -m) == 'arm64' ]]; then
        arch -arm64 brew reinstall $@
    else
        brew reinstall $@
    fi
}

function bug {
    if [[ $(uname -m) == 'arm64' ]]; then
        arch -arm64 brew upgrade $@
    else
        brew upgrade $@
    fi
}

alias bisc="bis --cask"
alias brisc="bris --cask"
alias bugc="bug --cask"
alias bugg="bug --greedy"

## common
alias bus="brew uninstall"
alias busc="brew uninstall --cask"
alias bh="brew help"
alias bc="brew cat"
alias be="brew edit"
alias bec="brew edit --cask"
alias bl="brew list"
alias bud="brew update"
alias bod="brew outdated"
alias bsc="brew search"
alias bln="brew link"
alias but="brew untap"
alias bt="brew tap"
alias bp="brew pin"
# ck=check
alias bck="brew doctor"
alias blv="brew leaves"
alias bcf="brew config"
alias bcl="brew autoremove; brew cleanup"
alias blf="brew list --formula"
alias blc="brew list --cask"
alias bdp="brew deps --tree --formula"
alias bdpi="brew deps --tree --formula --installed"
alias bds="brew desc --name"
alias bif="brew info --json=v2"
alias bifc="brew info --json=v2 --cask"
alias bb="brew bundle"
alias bbm="brew bundle --file ${Conf[bm]}"
alias bbl="brew bundle --file ${Conf[bl]}"
alias bbdm="brew bundle dump --file ${Conf[bm]}"
alias bbdl="brew bundle dump --file ${Conf[bl]}"
alias bcc="${OPEN} $(brew --cache)/downloads"

# download by aria2
function bdlc {
    url="brew info --cask --json=v2 $1 | rg \"url\" | rg -o '\"https:.+\"' -m 1"
    r_url="$(eval $url)"
    echo "downloading from $r_url"
    eval "aria2c $r_url"
}

# replace cache file by predownloaded file
function brp {
    f_pred=$(ls ${DOWNLOAD} | rg --ignore-case $1)
    if [ ! -f ${f_pred} ]; then
        echo "predownloaded file not found"
        return 1
    fi
    f_cache=$(ls $(brew --cache)/downloads | rg --ignore-case $1.+.incomplete | sed 's/.incomplete//g')
    echo "save ${DOWNLOAD}/${f_pred} as $(brew --cache)/downloads/${f_cache}"
    mv ${DOWNLOAD}/${f_pred} $(brew --cache)/downloads/${f_cache}
}

alias budrs="brew update-reset"
alias bown="sudo chown -R $(whoami) $(brew --prefix); chmod -R go-w $(brew --prefix)"
alias bzs="chsh -s $(brew --prefix)/bin/zsh"

function bmr {
    export HOMEBREW_BREW_GIT_REMOTE="https://$Bmr[$1]/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://$Bmr[$1]/git/homebrew/homebrew-core.git"

    for tap in core bottles services cask{,-fonts} command-not-found; do
        brew tap --custom-remote --force-auto-update "homebrew/${tap}" "https://$Bmr[$1]/git/homebrew/homebrew-${tap}.git"
    done
    brew update
}

function bmrrs {
    unset HOMEBREW_BREW_GIT_REMOTE
    git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew

    unset HOMEBREW_CORE_GIT_REMOTE
    BREW_TAPS="$(
        BREW_TAPS="$(brew tap 2>/dev/null)"
        echo -n "${BREW_TAPS//$'\n'/:}"
    )"

    for tap in core bottles services cask{,-fonts} command-not-found; do
        if [[ ":${BREW_TAPS}:" == *":homebrew/${tap}:"* ]]; then
            brew tap --custom-remote "homebrew/${tap}" "https://github.com/Homebrew/homebrew-${tap}"
        fi
    done
    brew update
}

# brew tap services
# l=list, s=start, e=end
alias bsl="brew services list"
alias bss="brew services start"
alias bse="brew services stop"
alias bsrs="brew services restart"
