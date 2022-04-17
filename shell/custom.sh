# conventions
#
# uppercase for global variables
# lowercase for local variables
# titlecase for arrays

##########################################################
# basic settings
##########################################################

# donwload path: works for function `bdl()` that use aria2 to donwload brew casks
export DOWNLOAD=$HOME/Documents
# backup folder
export BACKUP=$HOME/Documents/Github/Configuration

# default editor, can be changed by function `ched()`
export EDITOR=code
# terminal editor
export EDITOR_T=vi

##########################################################
# select ox-plugins
##########################################################

# toolchain specific (highly recommended)
# oxpg: ox-git
# oxpzj: ox-zellij
#
# language & software-specific
# oxpc: ox-conda
# oxpcc: ox-cpp
# oxpdk: ox-docker
# oxphx: ox-helix
# oxpjl: ox-julia
# oxplm: ox-lima
# oxpnj: ox-node
# oxpnv: ox-neovim
# oxprs: ox-rust
# oxptl: ox-texlive
# oxpvs: ox-vscode
#
# other-shortcuts
# oxpfm: ox-formats
# oxpwt: ox-widgets
PLUGINS=(oxpg oxpzj oxpc oxpvs oxpfm)

##########################################################
# register proxy ports
##########################################################

declare -A Proxy
# c: clash, v: v2ray
Proxy[c]=7890
Proxy[v]=1080

##########################################################
# select software configuration objects
##########################################################

# options: brew, conda, julia, node, texlive, vscode
declare -a INIT_OBJ
export INIT_OBJ=(brew)

declare -a BACK_OBJ
export BACK_OBJ=(brew)

declare -a UP_OBJ
export UP_OBJ=(brew)

##########################################################
# select export and import configurations
##########################################################

# files to be exported to backup folder
# ox: custom.sh of Oxidizer
# rs: cargo's env
# pu: pueue's config.yml
# pua: pueue's aliases.yml
# jl: julia's startup.jl
# vs: vscode's settings.json
# vsk: vscode's keybindings.json
# vss_: vscode's snippets folder
declare -a EPF_OBJ
EPF_OBJ=(ox al ar oxp zj)

# files to be import from backup folder
declare -a IPF_OBJ
# IPF_OBJ=(ox al ar oxp zj)

# file to be copied from oxidizer/defaults
declare -a IIF_OBJ
# al: alacritty
# ar: aria2
# pu: pueue
# pua: pueue_aliases
# zj: zellij
IIF_OBJ=(ar)
# IIF_OBJ=(ar zj)

##########################################################
# brew configurations
##########################################################

export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_NO_ENV_HINTS=true

# brew backup path
export HOMEBREW_BUNDLE_FILE=$BACKUP/install/Brewfile

# brew mirrors for faster download, use `bmr` to use
# declare -A Brew_Mirror
# Brew_Mirror[ts]="mirrors.tuna.tsinghua.edu.cn/git/homebrew"
# Brew_Mirror[zk]="mirrors.ustc.edu.cn/git/homebrew"

# predefined brew services
# set the length of key <= 3
declare -A Brew_Service
Brew_Service[pu]="pueue"
Brew_Service[mys]="mysql"

##########################################################
# zellij configurations
##########################################################

export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij

##########################################################
# register conda environments
##########################################################

# predefined conda environments
# set the length of key <= 3
declare -A Conda_Env
# Conda_Env[h]="hello"

##########################################################
# rust configurations
##########################################################

# rust mirrors for faster download, use `rsmr` to use
# declare -A Rust_Mirror
# Rust_Mirror[ts]="mirrors.tuna.tsinghua.edu.cn"
# Rust_Mirror[zk]="mirrors.ustc.edu.cn"

##########################################################
# lima configurations
##########################################################

# # predefined lima instances
# # set the length of key <= 3
# declare -A Lima
# Lima[ub]="ubuntu"
# Lima[ar]="archlinux"

##########################################################
# zsh
##########################################################

alias tt="\time zsh -i -c exit"
alias ua="unalias"
alias uf="unfunction"
alias wh="which"
alias e="echo"
alias ev="eval"
alias rr="rm -rf"
alias own="sudo chown -R $(whoami)"
alias c="clear"
alias ccc="local HISTSIZE=0 && history -p && reset"

# tools
alias ar="aria2c --dir $DOWNLOAD"

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

startup() {
    cd $HOME
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

alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'
alias cln="rm -rf ${HOME}/Library/Caches/*"
