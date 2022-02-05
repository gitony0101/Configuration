# source ${HOME}/.bash_profile

zmodload zsh/zprof
zmodload zsh/mathfunc
autoload -Uz compinit && compinit

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# turn case sensitivity off
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

export TERMINFO=/usr/share/terminfo
export TERM=screen-256color
export GPG_TTY=$(tty)
export CONFIG=${HOME}/Documents/my_config
export EDITOR=code

# register files
declare -A f

f[zs]=${HOME}/.zshrc
f[g]=${HOME}/.gitconfig
f[cd]=${HOME}/.condarc
f[ar]=${HOME}/.aria2/aria2.conf
f[al]=${HOME}/.config/alacritty/alacritty.yml
f[cg]=${HOME}/.cargo/env
f[vi]=${HOME}/.config/nvim/lua/custom/init.lua
f[vic]=${HOME}/.config/nvim/lua/custom/chadrc.lua
# use `_` as a suffix flag for directory
# zellij setup --dump-config > ~/.config/zellij/config.yaml
f[zj]=${HOME}/.config/zellij/config.yaml
f[zjl_]=${HOME}/.config/zellij/layouts

f[j]=${HOME}/.julia/config/startup.jl
f[jp]=${HOME}/.julia/environments/v$(julia -v | rg -o '\d\.\d')/Project.toml
f[jm]=${HOME}/.julia/environments/v$(julia -v | rg -o '\d\.\d')/Manifest.toml

# refresh file: $@=names
function ff {
    source ${f[$@]}
    clear
}

# edit file: $@=names
function ef {
    if [[ $1 == *_ ]]; then
        open ${f[$@]}
    else
        $EDITOR ${f[$@]}
    fi
}

# edit file by neovim: $1=name
function vf {
    if [[ $1 == *_ ]]; then
        open ${f[$1]}
    else
        nvim ${f[$1]}
    fi
}

# edit file by vscode: $@=names
function cf {
    if [[ $1 == *_ ]]; then
        open ${f[$@]}
    else
        code ${f[$@]}
    fi
}

# browse file: $1=name
function bf {
    if [[ $1 == *_ ]]; then
        ls ${f[$1]}
    else
        cat ${f[$1]}
    fi
}

# link file: $1=name
# h: dirname, t: filename, e: extname, r: filename without extname
function lf {
    var=${f[$1]}
    varn=${var:t}
    file=${varn:r}
    ext=${varn:e}

    prefix=cmd

    case $1 in
    vs*)
        prefix=vscode
        ;;
    vi*)
        prefix=nvim
        ;;
    zj*)
        prefix=zellij
        ;;
    zs*)
        prefix=sh
        ;;
    ns)
        prefix=sh
        file=nu
        ;;
    cg)
        file=cargo
        ext=sh
        ;;
    j)
        file=julia
        ;;
    esac

    if [ ! -d ${CONFIG}/${prefix} ]; then
        echo "make directory ${CONFIG}/${prefix}"
        mkdir ${CONFIG}/${prefix}
    fi

    if [[ $1 != *_ ]]; then
        ln ${var} ${CONFIG}/${prefix}/${file}.${ext}
        echo "link ${varn} as ${CONFIG}/${prefix}/${file}.${ext}"
    else
        if [ ! -d ${CONFIG}/${prefix}/${varn} ]; then
            echo "make directory ${CONFIG}/${prefix}/${varn}"
            mkdir ${CONFIG}/${prefix}/${varn}
        fi

        for filen in $(ls ${var}); do
            if [ ! -f ${CONFIG}/${prefix}/${varn}/${filen} ]; then
                echo "link ${var}/${filen} as ${CONFIG}/${prefix}/${varn}/${filen}"
                ln ${var}/${filen} ${CONFIG}/${prefix}/${varn}/${filen}
            fi
        done
    fi
}

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias
#
# l=list, sc=search, cl=clean, ck=check, is=install, us=uninstall, ud=update, ug=upgrade, k=kill, cf=config, if=info, sv=serve
alias ua="unalias"
alias uf="unfunction"
alias c="clear"
alias hs="history"
alias e="echo"
alias e0="echo $0"
alias ee="eval"
alias rr="rm -rf"
alias own="chown -R $(whoami)"

# zsh
#
alias zz="\time zsh -i -c exit"

# clean session history
function cc {
    session=$(fd session ${HOME}/.zsh_sessions)
    session_ind=${session:r}
    his=${session_ind}.history
    if [ -f $his ]; then
        echo "clean history of session ${session_ind:t}"
        rm $his
    fi
    touch $his
}

# alternatives
#
alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cat="bat"
alias du="dust"
alias vi="nvim"
alias z.="z .."
alias z..="z ../.."
alias z...="z ../../.."

# softwares
#
alias al="alacritty"
alias nj="node"
alias pd="pandoc"
alias ar="aria2c --conf-path=${HOME}/.aria2/aria2.conf"
alias lx="lux"
alias lxi="lux -i"
alias lxf="lux -f"
alias nv="navi -q"
alias nvr="navi repo"
alias kd="kondo"

# zellij
#
# a=attach
alias zj="zellij --layout"
alias zja="zellij attach"
alias zjai="zellij attach --index"
alias zjl="zellij list-sessions"
alias zjk="zellij kill-session"
alias zjka="zellij kill-all-sessions"
alias zjck="zellij setup --check"

# global
#
# w=wordcount
alias -g gr="| rg"
alias -g w0="| rg '\W\D0\.\d+'"
alias -g wb="| rg '\[\['"
alias -g wl="| wc -l"
alias -g ww="| wc -w"

# git
#
# g=git, a=add, cm=commit, ps=push, pl=pull, in=init, df=diff, sh=show, rb=rollback
alias ga="git add"
alias gai="git add -i"
alias gaa="git add ."
alias gcm="git commit -m"
alias gcma="git add .; git commit -m"
alias ggc="git gc --prune=now --aggressive"
alias gin="git init"
alias gpl="git pull"
alias gps="git push"
alias gpsm="git push -u origin master"
alias gpb=" git push --set-upstream origin master"
alias gstt="git status"
alias gsts="git stash"
alias gsh="git show"
alias gdf="git diff"
alias grb="git reset --soft HEAD^"
alias gct="git rev-list --count HEAD"
alias gui="gitui"

# julia
#
# j=julia
alias j="julia -q"
alias je="julia --eval"

function jmr {
    num_total=$(cat $f[jm] wb wl)
    echo "total: $num_total"
    num_immature=$(cat $f[jm] w0 wl)
    echo "mature: $((num_total - num_immature))"
    echo "mature rate: $(echo $num_immature $num_total | awk '{print 1-$1/$2}')"
}

# zsh
# open && refresh

alias bgra="brew graph --installed | dot -Tdot -o graph.dot && code graph.dot"

# brew
alias bis="brew install"
alias bisc="brew install --cask"
alias bus="brew uninstall"
alias busc="brew uninstall --cask"
alias bud="brew update"
alias bug="brew upgrade"
alias bugc="brew upgrade --cask"
alias bugcg="brew upgrade --cask --greedy"
alias bod="brew outdated"
alias bd="brew doctor"
alias be="brew edit"
alias bsc="brew search"
alias bcl="brew cleanup"
alias blf="brew list --formula"
alias blfg="brew list --formula | rg"
alias blfc="brew list --formula | wc -l"
alias blc="brew list --cask"
alias blcc="brew list --cask | wc -l"
alias bif="brew info"
alias bifc="brew info --cask"
alias budrs="brew update-reset"
alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'

# conda
alias cab="conda activate base && clear"
alias jpl="conda activate p39 && jupyter lab"
alias nb="conda activate p39  && jupyter notebook"
alias p9="conda activate p39  && clear"
alias rs="conda activate research39 && clear"
alias rnb="conda activate research39 && jupyter notebook"
alias rpl="conda activate research39 && jupyter lab"
alias j6="conda activate j6 && clear"
alias cda="conda deactivate && clear"
alias clb="conda list -n base"
alias clbc="conda list -n base| wc -l"
alias clbg="conda list -n base| rg"
alias clw="conda list -n web"
alias clwc="conda list -n web | wc -l"
alias clwg="conda list -n web | rg"
alias ccla="conda clean --all"
alias ccr="conda create -n"
alias cels="conda env list"
alias cerm="conda env remove -n"
alias ceud="conda env update -n"
alias cif="conda info"
alias csc="conda search"
alias cis="conda install"
alias cus="conda uninstall"
alias cuda="conda update --all"

# mamba
alias msc="mamba search"
alias mis="mamba install"
alias mus="mamba uninstall"
alias muda="mamba update -q --all"
alias mudak="mamba update -q --all -n kaggle"
alias mudaw="mamba update -q --all -n web"
alias pis="pip install"
alias pist="pip install -i https://pypi.tuna.tsinghua.edu.cn/simple"
alias pus="pip uninstall"
alias pug="python3 -m pip install --upgrade"
alias pipr="rm -r ~/Library/Caches/pip/*"

# jupyter
alias jl="jupyter lab"
alias jn="jupyter notebook"
alias ip="ipython"
# sql
alias msq="mysql -u root -p"
alias sq="brew services start mysql"
alias sqf="brew services stop mysql"

# pip
alias pis="pip install"
alias pus="pip uninstall"
export HOMEBREW_NO_AUTO_UPDATE=true

# npm
#
# od=outdated, pn=prune, au=audit
alias nis="npm install"
alias nus="npm uninstall"
alias nisg="npm install -g"
alias nusg="npm uninstall -g"
alias nud="npm update"
alias nudg="npm update -g"
alias nod="npm outdated"
alias noda="npm outdated --all"
alias nau="npm audit"
alias nl="npm list --depth 0"
alias nlg="npm list --depth 0 -g"
alias nck="npm doctor"
alias npn="npm prune"
alias nsc="npm search"
alias ncl="npm cache clean -f"
alias nh="npm help"
alias nr="npm run"

# cpp
#
# cn=conan, dl=downloads
alias cnis="conan install"
alias cnus="conan remove"
alias cnsc="conan search"
alias cnif="conan info"
alias cnh="conan help"
alias cncf="conan config"
alias cndl="conan download"

# latex
#
# lt=tlmgr, s=self
alias ltud="tlmgr update --all"
alias ltuds="tlmgr update --self --all"
alias ltck="tlmgr check"
alias ltis="tlmgr install"
alias ltus="tlmgr remove"
alias ltris="tlmgr update --reinstall-forcibly-removed --all"
alias ltiu="tlmgr init-usertree"
alias ltl="tlmgr list --only-installed"
alias ltlr="tlmgr repository list"
alias ltlu="tlmgr --usermode list"
alias ltown="sudo chown -R $(whoami) $texlive"

# rust
#
# cg=cargo
alias cg="cargo"
alias cgis="cargo install"
alias cgus="cargo uninstall"
alias cgud="cargo update"
alias cgcl="cargo clean"
alias cgsc="cargo search"
alias cgbd="cargo build"
alias cgck="cargo check"
alias cgn="cargo new"
alias cgt="cargo test"
alias cgr="cargo run"
alias cgit="cargo init"
alias cgpb="cargo publish"
# rs=rust
alias rs="rustup"
alias rsud="rustup update"
alias rsck="rustup check"
alias rsis="rustup component add"
alias rsus="rustup component remove"
alias rsh="rustup help"
alias rsm="rustup man"
alias rsdc="rustup doc"

# ruby
#
# rb=gem, s=system
alias rbis="gem install"
alias rbus="gem uninstall"
alias rbuds="gem update --system"
alias rbe="gem environment"
alias rbl="gem list"
alias rblc="gem list --local"
alias rbcl="gem cleanup"
alias rbd="gem dependency"

# mac specific
alias o="open"
alias allow="sudo spctl --master-disable"
alias crack="sudo xattr -r -d com.apple.quarantine"
alias ipf="dscacheutil -flushcache"
alias clean="rm -rf ${HOME}/Library/Caches/* ; mkdir -p $(brew --cache)/Cask"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
