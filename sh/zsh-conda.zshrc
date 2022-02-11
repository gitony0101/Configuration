# c=conda | mamba
# e=env, a=activate, ra=reactivate, cr=create, rm=remove, lv=leaves, mr=mature-rate
#
# activate environment: $1=name
function cea {
    conda activate ${Cenv[$1]}
    clear
}

# reactivate environment: $1=name
function cera {
    conda deactivate
    conda activate ${Cenv[$1]}
}

# change environment: $1=name, i=intel
function cesd {
    if [[ $1 != i ]]; then
        conda env config vars set CONDA_SUBDIR=osx-arm64
    else
        conda env config vars set CONDA_SUBDIR=osx-64
    fi
    cera $1 && clear
}

# create environment: $1=name
function cecr {
    conda create -n ${Cenv[$1]} -y
    cea $1
}

# list packages of environment: $1=name
function cel {
    mamba list -n ${Cenv[$1]}
}

# update packages of environment: $1=name
function ceud {
    cea $1
    mamba update --all -q
    conda deactivate
}

# delete environment: $1=name
function cerm {
    mamba env remove -n ${Cenv[$1]}
}

# list leaves of environment: $1=name
function celv {
    conda-tree -n ${Cenv[$1]} leaves
}

# export environment: $1=name
function ceep {
    arch=$(uname -m)
    conda env export -n ${Cenv[$1]} -f ${BACKUP}/$OS-$arch-${Cenv[$1]}.yml
}

function cemr {
    num_total=$(cel $1 wl)
    echo "total: ${num_total}"
    num_immature=$(cel $1 w0 wl)
    echo "mature: $((num_total - num_immature))"
    echo "mature rate: $(echo ${num_immature} ${num_total} | awk '{print 1-$1/$2}')"
}

alias cels="conda env list"
# dp=depends, t=tree, a=all
alias cda="conda deactivate; clear"
alias ccr="conda create -n"
alias ccl="conda clean --all"
alias cif="conda info"
alias cls="conda list"
alias csc="mamba search -q"
alias cis="mamba install -q"
alias cus="mamba uninstall -q"
alias cud="mamba update --all -q"
alias clv="conda-tree leaves"
alias cnd="conda-tree whoneeds"
alias cdp="conda-tree depends"
alias cdpt="conda-tree depends -t --small"
alias jpl="conda activate p39 && jupyter lab"
alias nb="conda activate p39  && jupyter notebook"
alias p9="conda activate p39  && clear"
