# conventions
#
# uppercase for global variables
# lowercase for local variables
# titlecase for arrays

export EDITOR=code

##########################################################
# select brew-related paths
##########################################################

# brew backup file
export HOMEBREW_BUNDLE_FILE=$OXIDIZER/backup/Brewfile

# donwload path
# works for brew-aria2 function
export DOWNLOAD=$HOME/Documents

##########################################################
# select update configurations
##########################################################

# z: zsh
# al: alacritty
# ar: aria2
# vi{,c,p}: neovim.init, neovim.chadrc, neovim.plugins
# zj{,zj}: zellij, zellij-layouts
# vs{,k,s_}: vscode, vscode.keybindings, vscode.snippets
# j: julia
export UP_OBJ="z al ar vi{,c,p} zj{,l_} vs{,k,s_} j"

##########################################################
# select zsh-plugins
##########################################################

# toolchain specific (highly recommended)
# zg: zsh-git
# zzj: zsh-zellij
#
# system-specific
# zl: zsh-linux
# zm: zsh-mac
#
# language & software-specific
# zcc: zsh-cpp
# zcd: zsh-conda
# zjl: zsh-julia
# znj: zsh-nodejs
# zrs: zsh-rust
# ztl: zsh-texlive
# zvs: zsh-vscode
#
# other-shortcuts
# zpd: zsh-pandoc
# ztm: zsh-tmux
# zwg: zsh-widgets

declare -a PLUGINS

PLUGINS=(zg zzj zm zcc zcd zjl znj zrs ztl zvs zpd zwg)

##########################################################
# register proxy ports
##########################################################

declare -A Proxy
# c: clash, v: v2ray, s: ssr
Proxy[c]=7890
Proxy[v]=1080
Proxy[s]=1080

##########################################################
# register conda environments
##########################################################

# to use rossetta, you need to add suffix "i" as a flag for intel
declare -A Cenv

Cenv[9]="p39"
# Cenv[ci]="cling"


# custom settings
alias cab="conda activate base && clear"
alias jpl="conda activate p39 && jupyter lab"
alias nb="conda activate p39  && jupyter notebook"
alias p9="conda activate p39  && clear"


alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'
alias cln="rm -rf ${HOME}/Library/Caches/* ; mkdir -p $(brew --cache)/Cask"
