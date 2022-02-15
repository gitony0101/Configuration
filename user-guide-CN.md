# 用户指南

## File Management

> in `zsh-utils.zshrc`

- ff
  - refresh file by `source` (default: zsh)
- ef
  - file: edit by `$EDITOR` (default: VS Code)
  - folder: open
- vf
  - file: edit by `nvim` (NeoVim)
  - folder: open
- bf
  - file: browse by `bat`/`cat`
  - folder: browse by `lsd`/`ls`
- owf
  - file: overwrite configurations in `$Config` to corresponding path
- buf
  - file: backup configurations to `$Config` folder
- epf
  - file: export configurations to `$Config/install` folder
- isf
  - file: install by configuration files in `$Config/install` folder

## Conda Management

> in `zsh-conda.zshrc`

### outside environment

- cea: activate `cenv`
- cera: reactivate `cenv`
- cesd: change conda-foreg subdir
  - `i`: use `x86_64` (Rosetta on M1) environment
  - not `i`: use `arm64` environment
- cecr: create `cenv`
- cel: list `cenv`
- cerm: remove `cenv`

### inside environment

## Homebrew Management

> in `zsh-brew.zshrc`

### install, uninstall, upgrade

- bis: brew install
- bris: brew reinstall
- bug: brew upgrade
- bus: brew uninstall

```bash
bis curl git gnupg
```

suffix `c` is a flag to restrict brew commands only work on casks

- bisc: brew install --cask
- brisc: brew reinstall --cask
- bugc: brew upgrade --cask

suffix `g` is a flag to force brew upgrade every cask including ones with `auto_update` flags

- bugg: brew upgrade --greedy

### download, replace, mirror

- bdlc: download brew cask by `aria2`
  - `$1`: cask name
- brp: replace brew cache file by predownloaded file
  - `$1`: cask name
- bmr: using brew mirror
- bmrrs: reset brew git source to official repositories

### bundle, dump