# built-in
#
alias ua="unalias"
alias uf="unfunction"
alias c="clear"
alias hs="history"
alias e="echo"
alias ev="eval"
alias rr="rm -rf"
alias own="chown -R $(whoami)"

# global
#
# w=wordcount, b=bracket, l=line, w=word
alias -g gr="| rg"
alias -g w0="| rg '\W\D0\.\d+'"
alias -g wb="| rg '\[\['"
alias -g wl="| wc -l"
alias -g ww="| wc -w"

# zsh
#
alias zz="\time zsh -i -c exit"

# clean session history
function cc {
    session=$(fd session ${HOME}/.zsh_sessions)
    session_ind=${session:r}
    his=${session_ind}.history
    if [ -f $his ]; then
        rm $his && history -p && clear
    fi
    touch $his
}

# runtime
alias py="python"
alias nj="node"

# alternatives
#
alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cat="bat"
alias du="dust"
alias z.="z .."
alias z..="z ../.."
alias z...="z ../../.."
alias zx="z -"
alias vi="nvim"

# softwares
#
alias al="alacritty"
alias ar="aria2c --conf-path=${HOME}/.aria2/aria2.conf"
alias lx="lux"
alias lxi="lux -i"
alias lxf="lux -f"
alias nv="navi -q"
alias nvr="navi repo"
alias kd="kondo"

# pandoc
alias pd="pandoc"

# zellij
#
# k=kill, a=attach, d=dump
alias zj="zellij --layout"
alias zja="zellij attach"
alias zjai="zellij attach --index"
alias zjl="zellij list-sessions"
alias zjk="zellij kill-session"
alias zjka="zellij kill-all-sessions"
alias zjck="zellij setup --check"
alias zjdc="zellij setup --dump-config"

# git
#
# g=git, a=add, cm=commit, ps=push, pl=pull, in=init, df=diff, sh=show, ct=count, rb=rollback
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
alias gct="git rev-list --count HEAD"
alias grb="git reset --soft HEAD^"
alias gui="gitui"

# julia
#
# j=julia
alias j="julia -q"
alias je="julia --eval"

function jmr {
    num_total=$(cat $Conf[jm] wb wl)
    echo "total: $num_total"
    num_immature=$(cat $Conf[jm] w0 wl)
    echo "mature: $((num_total - num_immature))"
    echo "mature rate: $(echo $num_immature $num_total | awk '{print 1-$1/$2}')"
}

# pip
#
# p=pip3
alias pis="pip3 install"
alias pus="pip3 uninstall"
alias pug="pip3 install --upgrade"

# jupyter
#
# j=jupyter, k=kernelspec, b=book|build
alias jcf="jupyter --config-dir"
alias jdt="jupyter --data-dir"
alias jpt="jupyter --paths"
alias jn="jupyter notebook"
alias jl="jupyter lab"
alias jkl="jupyter kernelspec list"
alias jkus="jupyter kernelspec remove"
alias jbcr="jupyter-book create"
alias jbcl="jupyter-book clean"
alias jbb="jupyter-book build"
alias ghp="ghp-import -n -p -f _build/html"

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
alias ltown="sudo chown -R $(whoami) ${texlive}"

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

# px=proxy, u=unset
function px {
    export https_proxy=http://127.0.0.1:${Proxy[$1]}
    export http_proxy=http://127.0.0.1:${Proxy[$1]}
    export all_proxy=socks5://127.0.0.1:${Proxy[$1]}
}

alias upx="unset https_proxy; unset http_proxy; unset all_proxy"
alias lpx="echo ${https_proxy}; ${http_proxy}; ${all_proxy}"

# files

# refresh file
#
# $@=names
function ff {
    source ${Conf[$1]}
}

# edit file by neovim
#
# $1=name
function vf {
    if [[ $1 == *_ ]]; then
        ${OPEN} ${Conf[$1]}
    else
        nvim ${Conf[$1]}
    fi
}

# edit file by vscode
#
# $@=names
function cf {
    if [[ $1 == *_ ]]; then
        ${OPEN} ${Conf[$@]}
    else
        code ${Conf[$@]}
    fi
}

# browse file
#
# $1=name
function bf {
    if [[ $1 == *_ ]]; then
        lsd ${Conf[$1]}
    else
        cat ${Conf[$1]}
    fi
}

# link file: $1=name
#
# h: dirname, t: filename, e: extname, r: raw filename (without ext)
function lf {
    var=${Conf[$1]}
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

# export file
#
# $1: command name, $2: environment name
function epf {
    case $1 in
    vs)
        code --list-extensions >${BACKUP}/vscode-ext.txt
        ;;
    py)
        conda tree -n $2 leaves | sed "s/', '/ /g" | sed "s/\['//g" | sed "s/'\]//g" >${BACKUP}/conda-$2.txt
        ;;
    esac
}

# install file
#
# $1: command name, $2: environment name
function isf {
    case $1 in
    vs)
        exts="$(code --list-extensions)"

        for ext in $(cat ${BACKUP}/vscode-ext.txt); do
            if echo ${exts} | rg ${ext}; then
                echo "Extension '${ext}' is already installed."
            else
                code --install-extension "${ext}"
            fi
        done
        code --install-extension ${BACKUP}/vscode-ext.txt
        ;;
    py)
        mamba install $(cat ${BACKUP}/conda-$2.txt) -y -q
        ;;
    b)
        brew bundle
        ;;
    esac

}
