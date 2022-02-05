source ~/.bash_profile

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HOMEBREW_EDITOR=code
export HOMEBREW_NO_AUTO_UPDATE=true
export GPG_TTY=$(tty)
export TERMINFO=/usr/share/terminfo

# cli
alias cat="bat"
alias grep="rg"
alias ls="lsd"
alias lsa='lsd -a'
alias lsl='lsd -l'
alias lsla='lsd -la'
alias tree='lsd --tree'
alias vi="nvim"
alias man="tldr"
alias pd="pandoc"
alias py="python"
alias p="ipython"
alias r="radian"
alias xao="xargs open"
alias rh="rm ~/.zsh_history"

# tmux
alias t="tmux"
alias tat="tmux at -t"
alias tdt='tmux detach'
alias tks="tmux kill-session"
alias tl="tmux ls"
alias st="tmux source ~/.tmux.conf"

# git
alias ui="gitui"
alias add="git add"
alias adda="git add ."
alias gc="git gc"
alias init="git init"
alias pull="git pull"
alias push="git push"
alias status="git status"
alias stash="git stash"
alias name="git config --global user.name"
alias email="git config --global user.email"
alias sk="git config --global user.signingkey"
alias kt="git config commit.gpgsign true"
alias kf="git config commit.gpgsign false"
alias ktg="git config --global commit.gpgsign true"
alias kfg="git config --global commit.gpgsign false"
alias cm="gitmoji -c"

# gpg & proxy
alias gk="gpg"
alias gkl="gpg --list-keys"
alias gkll="gpg --list-secret-keys --keyid-format=long"
alias gkui="gpg-tui"
alias gkep="gpg --armor --export"
alias gktest="echo 'test' | gpg --clearsign"
alias vpn="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias uvpn="export https_proxy=''; export http_proxy=''; export all_proxy=''"

# mac
alias allsource="sudo spctl --master-disable"
alias crack="sudo xattr -r -d com.apple.quarantine"
alias ipf="sudo killall -HUP mDNSResponder"
alias m5="md5"
alias s2="openssl dgst -sha256"

# linux
# alias ipf="sudo rcnscd restart"
# alias m5="md5sum"
# alias s2="sha256"

# open && refresh
alias szs="source ~/.zshrc && clear"
alias ocd="code ~/.condarc"
alias ocf="code ~/Documents/my_projects/works-config/config_os.md"
alias ogcf="code ~/.gitconfig"
alias ohst="code /etc/host"
alias ojl="code ~/.julia/config/startup.jl"
alias ojn="code ~/.jupyter/jupyter_notebook_config.py"
alias ojns="code ~/Library/Jupyter/nbextensions/snippets/snippets.json"
alias ot="code ~/.tmux.conf"
alias ovi="code ~/.config/nvim/init.vim"
alias ozs="code ~/.zshrc"
alias vcd="vi ~/.condarc"
alias vcf="vi ~/Documents/my_projects/works-config/config_os.md"
alias vgcf="vi ~/.gitconfig"
alias vhst="vi /etc/host"
alias vjl="vi ~/.julia/config/startup.jl"
alias vjn="vi ~/.jupyter/jupyter_notebook_config.py"
alias vjns="vi ~/Library/Jupyter/nbextensions/snippets/snippets.json"
alias vt="vi ~/.tmux.conf"
alias vvi="vi ~/.config/nvim/init.vim"
alias vzs="vi ~/.zshrc"
alias lzsg="cat ~/.zshrc | rg"

# copy
alias czs="cp ~/.zshrc ~/Documents/my_projects/works-config/envs/mac-zsh.sh"
alias ct="cp ~/.tmux.conf ~/Documents/my_projects/works-config/envs/tmux.conf"
alias ccd="cp ~/.condarc ~/Documents/my_projects/works-config/envs/conda.yml"
alias cvi="cp ~/.config/nvim/init.vim ~/Documents/my_projects/works-config/envs/init.vim"
alias cjns="cp ~/Library/Jupyter/nbextensions/snippets/snippets.json ~/Documents/my_projects/works-config/envs/jn-snippets.json"
alias cjl="cp ~/.julia/config/startup.jl ~/Documents/my_projects/works-config/envs/startup.jl"
alias cvs="cp ~/Library/Application\ Support/Code/User/settings.json ~/Documents/my_projects/works-config/envs/vsc-settings.jsonc"

# julia
# alias j="julia --banner=no"
# alias jlmg="cat ~/.julia/environments/v$(julia -v | awk '{print($3%2)}')/Manifest.toml | rg"
# alias jlpg="cat ~/.julia/environments/v$(julia -v | awk '{print($3%2)}')/Project.toml | rg"
# alias jlmc="cat ~/.julia/environments/v$(julia -v | awk '{print($3%2)}')/Manifest.toml | rg '\[\[' | wc -l"
# alias jlpc="cat ~/.julia/environments/v$(julia -v | awk '{print($3%2)}')/Project.toml | rg '=' | wc -l"

alias cll="conda list"
alias clc="conda list | wc -l"
alias clg="conda list | rg"
alias cda="conda deactivate && clear"
alias cak="conda activate kaggle && clear"
alias clk="conda list -n kaggle"
alias clkc="conda list -n kaggle | wc -l"
alias clkg="conda list -n kaggle | rg"
alias car="conda activate rstupid && clear"
alias clr="conda list -n rstupid"
alias clrc="conda list -n rstupid | wc -l"
alias clrg="conda list -n rstupid | rg"
alias ccla="conda clean --all"
alias ccr="conda create -n"
alias cels="conda env list"
alias cerm="conda env remove -n"
alias cif="conda info"
alias csc="conda search"
alias cis="conda install"
alias cus="conda uninstall"
alias cuda="conda update --all"
alias cudak="conda update --all -n kaggle"
alias cudar="conda update --all -n rstupid"
alias ctd="conda-tree depends"
alias ctn="conda-tree whoneeds"
alias ctdt="conda-tree deptree"

# mamba & pip
alias msc="mamba search"
alias mis="mamba install -q"
alias mus="mamba uninstall -q"
alias muda="mamba update --all -q"
alias mudab="mamba update --all -n base -q"
alias mudak="mamba update --all -n kaggle -q"
alias mudar="mamba update --all -n rstupid -q"
alias pis="pip3 install"
alias pus="pip3 uninstall"
alias pug="pip3 install --upgrade"
alias pipr="rm -rf ~/Library/Caches/pip/*"

# jupyter
alias jn="jupyter notebook"
alias jnr="jupyter notebook --allow-root"
alias jncf="jupyter notebook --generate-config"
alias jnee="jupyter nbextension enable"
alias jned="jupyter nbextension disable"
alias jnel="jupyter nbextension list"
alias jl="jupyter lab"
alias jlr="jupyter lab --allow-root"
alias jlcf="jupyter lab --generate-config"
alias jkls="jupyter kernelspec list"
alias jkrm="jupyter kernelspec remove"

# brew
alias bh="brew help"
alias be="brew edit"
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
alias bt="brew tap"
alias but="brew untap"
alias bsc="brew search"
alias bcl="brew cleanup"
alias blf="brew list --formula"
alias blfg="brew list --formula | rg"
alias blfc="brew list --formula | wc -l"
alias blc="brew list --cask"
alias blcc="brew list --cask | wc -l"
alias bif="brew info"
alias bifc="brew info --cask"
alias brs="brew update-reset"
alias bgra="brew graph --installed | dot -Tpng -o graph.png"
alias brm="rm -rf $(brew --cache)/downloads/* && rm -rf $(brew --cache)/Cask/*"
alias bmk="mkdir $(brew --cache) && mkdir $(brew --cache)/Cask"
## alias brm="rm -rf ~/.cache/Homebrew/*"

# yarn
alias yis="yarn add"
alias yus="yarn remove"
alias yug="yarn upgrade"
alias yugi="yarn upgrade-interactive"
alias yc="yarn create"
alias yl="yarn list"
alias yd="yarn dir"
alias yw="yarn why"
alias yisg="yarn global add"
alias yusg="yarn global remove"
alias yugg="yarn global upgrade"
alias yugig="yarn global upgrade-interactive"
alias ylg="yarn global list"
alias ydg="yarn global dir"
alias yccf="yarn cache clean --force"

## docsify
alias dcfi="docsify init"
alias dcfs="docsify serve"

# latex
alias tuda="sudo tlmgr update --all"
alias tuds="sudo tlmgr update --self"
alias tudsa="sudo tlmgr update --self --all"
alias tis="sudo tlmgr install"
alias tus="sudo tlmgr uninstall"
alias trl="sudo tlmgr repository list"
alias tium="sudo tlmgr init-usertree"
alias tuml="tlmgr --usermode list"

# ruby
alias rcl="gem cleanup"
alias ris="gem install"
alias rus="gem uninstall"
alias rl="gem list"
alias rd="gem dependency"
alias ruds="sudo gem update --system"

# bins
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/share/texlive:$PATH"
export PATH="/Library/TeX/texbin/:$PATH"
export PATH="/Applications/Polyspace/R2019a/bin:$PATH"

# export PATH="/home/linuxbrew/.linuxbrew/bin/curl:$PATH"
# export PATH="/home/linuxbrew/.linuxbrew/bin/ruby:$PATH"
# export PATH="/home/linuxbrew/.linuxbrew/bin/sqlite:$PATH"

# >>> conda initialize >>>
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
