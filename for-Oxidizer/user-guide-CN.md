# 用户指南

## File Management

> in `zsh-utils.sh`

- `ff`
  - refresh file by `source` (default: zsh)
- `ef`
  - file: edit by `$EDITOR` (default: VS Code)
  - folder: open
- `vf`
  - file: edit by `nvim` (NeoVim)
  - folder: open
- `bf`
  - file: browse by `bat`/`cat`
  - folder: browse by `lsd`/`ls`
- `ipf`
  - file: overwrite configurations in `$Oxygen` to corresponding `$Sysfile` files
- `epf`
  - file: overwrite `$Sysfile` configurations to `$Oxygen` folder and create hard links
- `init_*`
  - file: install by configuration files in `$Oxygen/install` folder
- `update_*`
  - file: update configurations in `$BACKUP` folder to system
- `backup_*`
  - file: backup configurations to `$BACKUP` folder

## Conda Management

> in `zsh-python.sh`

### outside environment

- ca: activate `cenv`
- cra: reactivate `cenv`
- ccr: create `cenv`
- cerm: remove `cenv`
- cech: change conda-foreg subdir
  - `i`: use `x86_64` (Rosetta on M1) environment
  - not `i`: use `arm64` environment
- ceep: export environment
- cls: list packages

### inside environment

## Homebrew Management

> in `zsh-brew.sh`

### install, uninstall, upgrade

- bis: brew install
- bris: brew reinstall
- bus: brew uninstall
- bup: brew upgrade

```bash
bis curl git gnupg
```

suffix `c` is a flag to restrict brew commands only work on casks

- bisc: brew install --cask
- brisc: brew reinstall --cask
- bupc: brew upgrade --cask

suffix `g` is a flag to force brew upgrade every cask including ones with `auto_update` flags

- bupg: brew upgrade --greedy

### download, replace, mirror

- bdlc: download brew cask by `aria2`
  - `$1`: cask name
- brp: replace brew cache file by predownloaded file
  - `$1`: cask name
- bmr: using brew mirror
- bmrrs: reset brew git source to official repositories

### bundle, dump
