# conventions
#
# uppercase for global variables
# lowercase for local variables
# titlecase for arrays

##########################################################
# basic path
##########################################################

export EDITOR=code
export EDITOR_T=vi

# donwload path: works for brew-aria2 function
export DOWNLOAD=$HOME/Documents

# backup folder
export BACKUP=$HOME/Documents/Github/Configuration

##########################################################
# select zsh-plugins
##########################################################

# toolchain specific (highly recommended)
# zsg: zsh-git
# zszj: zsh-zellij
#
# system-specific
# zsl: zsh-linux
# zsm: zsh-mac
#
# language & software-specific
# zscc: zsh-cpp
# zsc: zsh-conda
# zsjl: zsh-julia
# zsn: zsh-nodejs
# zsrs: zsh-rust
# zstl: zsh-texlive
# zsvs: zsh-vscode
#
# other-shortcuts
# zspd: zsh-pandoc
# zsw: zsh-widgets

declare -a PLUGINS

PLUGINS=(zsg zszj zspu zsm zscc zsc zsjl zsn zsrs zstl zsvs zspd zsw)

##########################################################
# register proxy ports
##########################################################

# c: clash, v: v2ray
declare -A Proxy

Proxy[c]=7890
Proxy[v]=1080

##########################################################
# select initilization configurations
##########################################################

# texlive

INIT_OBJ={brew,conda,julia,nodejs,vscode}

##########################################################
# select update configurations
##########################################################

# z: zsh
# al: alacritty
# ar: aria2
# zj: zellij

export UP_OBJ="zs"
# export UP_OBJ="zs zj"

##########################################################
# brew configurations
##########################################################

export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_NO_ENV_HINTS=true

# brew backup path
export HOMEBREW_BUNDLE_FILE=$BACKUP/Brewfile

##########################################################
# register conda environments
##########################################################

# conda environments
declare -A Cenv

Cenv[9]="p39"
# Cenv[ci]="cling"

##########################################################
# Aliases (basic)
##########################################################

# built-in
#
alias ua="unalias"
alias uf="unfunction"
alias hs="history"
alias c="clear"
alias wh="which"
alias e="echo"
alias ev="eval"
alias rr="rm -rf"
alias cwn="chown -R $(whoami)"

# tools
alias hf="hyperfine"

# global
#
# w: wordcount, l: line, w:word
alias -g gr="| rg"
alias -g w0="| rg '\s0\.\d+'"
alias -g wl="| wc -l"
alias -g ww="| wc -w"

##########################################################
# startup commands
##########################################################

export STARTUP=1

function startup {
    z $HOME/Documents && conda activate base
}

function upall {
    conda deactivate && conda activate base

    pueue group add up
    pueue parallel 5 -g up
    pueue add -g up "bups"
    pueue add -g up "cup"
    pueue add -g up "cup9"
    pueue add -g up "jlup"
    # pueue add -g up "rsup" // rust up
    pueue add -g up "tlup"

    sleep 3 && pueue status
}

# custom settings
alias jpl="conda activate p39 && jupyter lab"
alias nb="conda activate p39  && jupyter notebook"
alias p9="conda activate p39  && clear"
alias r5="conda activate r5 && clear"

alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'
alias cln="rm -rf ${HOME}/Library/Caches/*"
