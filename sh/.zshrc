# source ${HOME}/.bash_profile

zmodload zsh/zprof
zmodload zsh/mathfunc

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# turn case sensitivity off
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# conventions
#
# uppercase for global variables
# lowercase for local variables
# titlecase for arrays

export EDITOR=code
export CONFIG=${HOME}/Documents/config
export BACKUP=${CONFIG}/install
export DOWNLOAD=${HOME}/Documents

# register files
declare -A Conf

# command line files
Conf[zs]=${HOME}/.zshrc
Conf[g]=${HOME}/.gitconfig
Conf[cg]=${HOME}/.cargo/env
Conf[cd]=${HOME}/.condarc
Conf[ar]=${HOME}/.aria2/aria2.conf
Conf[al]=${HOME}/.config/alacritty/alacritty.yml
Conf[vi]=${HOME}/.config/nvim/lua/custom/init.lua
Conf[vic]=${HOME}/.config/nvim/lua/custom/chadrc.lua
Conf[vip]=${HOME}/.config/nvim/lua/custom/plugins.lua
# use `_` as a suffix flag for directory
Conf[vi_]=${HOME}/.config/nvim/lua/custom/
Conf[zj]=${HOME}/.config/zellij/config.yaml
Conf[zjl_]=${HOME}/.config/zellij/layouts

Conf[j]=${HOME}/.julia/config/startup.jl
Conf[jp]=${HOME}/.julia/environments/v$(julia -v | rg -o '\d\.\d')/Project.toml
Conf[jm]=${HOME}/.julia/environments/v$(julia -v | rg -o '\d\.\d')/Manifest.toml

## personal
Conf[zsb]=${CONFIG}/sh/zsh-brew.zshrc
Conf[zsc]=${CONFIG}/sh/zsh-conda.zshrc
Conf[zsm]=${CONFIG}/sh/zsh-mac.zshrc
Conf[zsl]=${CONFIG}/sh/zsh-linux.zshrc
Conf[zsu]=${CONFIG}/sh/zsh-utils.zshrc
Conf[gig]=${CONFIG}/.gitignore
Conf[cf]=${CONFIG}/config.md
Conf[bm]=${BACKUP}/brew-mac.rb
Conf[bl]=${BACKUP}/brew-linux.rb

# source system-specific commands
[ $(uname -s) = Darwin ] && export MACOS=1 && export UNIX=1
[ $(uname -s) = Linux ] && export LINUX=1 && export UNIX=1
uname -s | grep -q "_NT-" && export WINDOWS=1

if [ $UNIX ]; then
    source ${CONFIG}/sh/zsh-brew.zshrc
    source ${CONFIG}/sh/zsh-utils.zshrc

    export APP=$(brew --caskroom)

    # brew mirrors
    declare -A Bmr

    Bmr[ts]="mirrors.tuna.tsinghua.edu.cn"
    Bmr[st]="mirrors.ustc.edu.cn"
fi

if [ $MACOS ]; then
    source ${CONFIG}/sh/zsh-mac.zshrc

    export OPEN=open
    export APPSUP=${HOME}/Library/'Application Support'
    export HOMEBREW_BUNDLE_FILE=${Conf[bm]}

    Conf[ns]=${APPSUP}/org.nushell.nu/config.toml
elif [ $LINUX ]; then
    source ${CONFIG}/sh/zsh-linux.zshrc

    export HOMEBREW_BUNDLE_FILE=${Conf[bl]}
    export APPSUP=${HOME}/.config
elif [ $WINDOWS ]; then
    export APPSUP=${APPDATA}
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${APP}/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${APP}/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "${APP}/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="${APP}/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# conda & mamba
#
# register conda environments
# an intel environment needs to add "i" as a flag
declare -A Cenv

Cenv[b]="base"
# Cenv[k]="kaggle"
# Cenv[c]="cling"

source ${CONFIG}/sh/zsh-conda.zshrc

# proxy
declare -A Proxy
# c=clash, v=v2ray
Proxy[c]=7890
Proxy[v]=1080

# app files
Conf[vs]=${APPSUP}/Code/User/settings.json
Conf[vsk]=${APPSUP}/Code/User/keybindings.json
Conf[vss_]=${APPSUP}/Code/User/snippets
