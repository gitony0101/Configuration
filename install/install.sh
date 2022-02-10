cat <<EOS
 iVaquero
 Automation is the core value of programming. 
EOS

# Install Homebrew
brew_installer="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# brew_installer="$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"

if test ! "$(command -v brew)"; then
    info "Homebrew not installed. Installing."
    eval "/bin/zsh -c ${brew_installer}"
fi

# for arm64 mac
if [[ $(uname -m) == "arm64" ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
    brew bundle --file "$(dirname "$0")/brew.backup"
    brew bundle --file "$(dirname "$0")/brew-cask.backup"

# for intel mac
elif [[ $(uname -m) == "x86_64" ]]; then
    eval $(/usr/local/bin/brew shellenv)
    brew bundle --file "$(dirname "$0")/brew.backup"
    brew bundle --file "$(dirname "$0")/brew-cask.backup"

# for linux
else
    eval "$(~/.linuxbrew/bin/brew shellenv)"
    brew bundle --file "$(dirname "$0")/brew.backup"
fi

# shell
if [[ "$SHELL" != "/bin/zsh" ]]; then
    chsh -s /bin/zsh
fi

# conda
for pkg in $(cat $(dirname $0)/conda-base.txt); do
    echo "mamba install $pkg"
    mamba install $pkg
done

# brew tap athrunsun/linuxbinary

# install vscode extensions
for ext in $(cat $(dirname $0)/vscode-ext.txt); do
    code --install-extension "${ext}"
done
