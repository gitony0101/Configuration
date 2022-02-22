# source $HOME/.bash_profile

export OXIDIZER=$HOME/oxidizer

##########################################################
# Oxidizer configuration files
##########################################################

declare -A Oxygen
#
## shell

declare -A InitOxy

InitOxy[zs]=$OXIDIZER/.zshrc
InitOxy[ox]=$OXIDIZER/custom.sh

InitOxy[al]=$OXIDIZER/defaults/alacritty.yml
InitOxy[ar]=$OXIDIZER/defaults/aria2.conf
InitOxy[c]=$OXIDIZER/defaults/.condarc
InitOxy[j]=$OXIDIZER/defaults/startup.jl
InitOxy[tm]=$OXIDIZER/defaults/.tmux.conf
InitOxy[zj]=$OXIDIZER/defaults/zellij/config.yaml
InitOxy[zjl_]=$OXIDIZER/defaults/zellij/layout

## zsh-plugins
Oxygen[zsl]=$OXIDIZER/zsh-plugins/zsh-linux.sh
Oxygen[zsm]=$OXIDIZER/zsh-plugins/zsh-macos.sh
Oxygen[zsb]=$OXIDIZER/zsh-plugins/zsh-brew.sh
Oxygen[zscc]=$OXIDIZER/zsh-plugins/zsh-cpp.sh
Oxygen[zsc]=$OXIDIZER/zsh-plugins/zsh-conda.sh
Oxygen[zsg]=$OXIDIZER/zsh-plugins/zsh-git.sh
Oxygen[zsj]=$OXIDIZER/zsh-plugins/zsh-julia.sh
Oxygen[zsn]=$OXIDIZER/zsh-plugins/zsh-nodejs.sh
Oxygen[zspd]=$OXIDIZER/zsh-plugins/zsh-pandoc.sh
Oxygen[zsrs]=$OXIDIZER/zsh-plugins/zsh-rust.sh
Oxygen[zstl]=$OXIDIZER/zsh-plugins/zsh-texlive.sh
Oxygen[zsu]=$OXIDIZER/zsh-plugins/zsh-utils.sh
Oxygen[zvi]=$OXIDIZER/zsh-plugins/zsh-neovim.sh
Oxygen[zsvs]=$OXIDIZER/zsh-plugins/zsh-vscode.sh
Oxygen[zsw]=$OXIDIZER/zsh-plugins/zsh-widgets.sh
Oxygen[zszj]=$OXIDIZER/zsh-plugins/zsh-zellij.sh

source $InitOxy[ox]

##########################################################
# System configuration files
##########################################################

declare -A SysFile

SysFile[zs]=$HOME/.zshrc
SysFile[ar]=$HOME/.aria2/aria2.conf
SysFile[al]=$HOME/.config/alacritty/alacritty.yml

if [[ -d $BACKUP ]]; then
    Oxygen[zs]=$BACKUP/.zshrc
    Oxygen[al]=$BACKUP/alacritty.yml
    Oxygen[ar]=$BACKUP/aria2.conf
fi

##########################################################
# Aliases
##########################################################

alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cat="bat"
alias du="dust"
alias man="tldr"
alias z.="z .."
alias z..="z ../.."
alias z...="z ../../.."
alias zz="z -"
alias vi="nvim"

##########################################################
# Zsh
##########################################################

alias tt="\time zsh -i -c exit"

zmodload zsh/zprof
zmodload zsh/mathfunc

# turn case sensitivity off
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# clean session history
function cc {
    local HISTSIZE=0 && history -p && clear
}

function ccc {
    local HISTSIZE=0 && history -p && reset
}

# source system-specific commands
if [[ $(uname -s) == "Darwin" ]]; then
    case $(uname -m) in
    arm64)
        eval "$(/opt/homebrew/bin/brew shellenv)"
        ;;
    x86_64)
        eval "$(/usr/local/bin/brew shellenv)"
        ;;
    esac
    export APP=$(brew --caskroom)
    export APPSUP=$HOME/Library/'Application Support'
    source $Oxygen[zsm]
else
    eval "$($HOME/.linuxbrew/bin/brew shellenv)"
    export APP=$HOME
    export APPSUP=$HOME/.config
    source $Oxygen[zsl]
fi

##########################################################
# import plugins
##########################################################

# import zsh-brew
source $Oxygen[zsb]
# import zsh-utils.sh
source $Oxygen[zsu]

for plugin in $PLUGINS[@]; do
    source $Oxygen[$plugin]
done

##########################################################
# app files
##########################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$APP/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$APP/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "$APP/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="$APP/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if test ! "$(command -v conda)"; then
    conda init zsh
fi

##########################################################
#  Oxidizer management
##########################################################

# initialize Oxidizer
# only install missing packages/extensions, no deletion
function oxin {
    eval init_$INIT_OBJ
}

# update Oxidizer
#
# $UP_OBJ is predefined in custom.sh

function oxup {
    z $OXIDIZER
    git fetch origin master
    git reset --hard origin/master
    z -
    iif $UP_OBJ
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
