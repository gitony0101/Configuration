<body>
    <div align="left">
        <h1 align="left">Oxidizer.sh</h1>
        <p>
            <a>
                <img
                    src="https://img.shields.io/github/workflow/status/ivaquero/oxidizer.sh/CI.svg"
                />
            </a>
            <a>
                <img
                    src="https://img.shields.io/github/languages/code-size/ivaquero/oxidizer.svg"
                />
            </a>
            <a>
                <img
                    src="https://img.shields.io/github/repo-size/ivaquero/oxidizer.svg"
                />
            </a>
            <a>
                <img
                    src="https://img.shields.io/github/license/ivaquero/oxidizer.sh"
                />
            </a>
        </p>
    </div>
    <p></p>
    <div>
        <p>
            Minimalistic & Extensible Dotfile Solution using Rust Toolchains
        </p>
        <p align="left">
            <a href="README.md">English</a> |
            <a href="README-CN.md">简体中文</a>
        </p>
    </div>
</body>

Let's Oxidize Developement Environments

> Oxidizer is currently in beta, use at your own risk, PRs are welcomed.

![view](view.jpeg)

## Get Started

For macOS / Linux

> fairly stable

```bash
# define the Oxidizer home
export OXIDIZER=$HOME/oxidizer

git clone --depth=1 https://github.com/ivaquero/oxidizer.sh.git $OXIDIZER
zsh $OXIDIZER/oxidizer.sh
```

For Windows

> [❗WIP❗] not fully tested

```powershell
# define the Oxidizer home
$env:oxidizer = '%USERPROFILE%/oxidizer'
[Environment]::SetEnvironmentVariable('Oxidizer', $env:oxidizer, 'User')

git clone --depth=1 https://github.com/ivaquero/oxidizer.sh.git $env:oxidizer

powershell $env:oxidizer/oxidizer.ps1
```

For Chinese mainland users, you may set `BREW_CN` variable to install Homebrew

```bash
export $BREW_CN=1
```

After installation, you might personalize your preference in `custom.sh` (check `demo-custom.sh`).

To keep up the updates, enter the oxidizer rootpath and use `oxup` function

```bash
oxup
```

## Phylosophy

- Cross-Platform (Mainly Rust Toolchains)
- Minimalist dependencies
- Extensible Architecture
- Absolutely smooth usage
- Super-Fast! (Current loading time is ~0.20s)

## Oxidizing Progress

### Command Line Replacement

- [x] Use `bat` instead of `cat`
- [x] Use `bottom` instead of `top` and `htop`
- [x] Use `du` instead of `dust`
- [x] Use `fd` instead of `find`
- [x] Use `gitui` instead of `lazygit`
- [x] Use `ls --tree` instead of `tree`
- [x] Use `lsd` instead of `ls`
- [x] Use `ripgrep` instead of `grep`
- [x] Use `sd` instead of `sed`
- [x] Use `tealdeer` instead of `tldr` and `man`
- [x] Use `zoxide` instead of `cd` and `z.lua`
- [x] Use `zellij` instead of `tmux`
- [x] Use `texlab` instead of `latexindent`

### Apps Replacement

- [x] Use `Alacritty` instead of `iTerm2` and `Windows Terminal`

### Other Rust Tools

- [x] delta
- [x] hyperfine
- [x] kondo
- [ ] helix-editor
- [ ] nushell

## Main File

- `oxin`:

## System Specific

### macOS

> in `zsh-mac.sh`

- [x] Update system
- [x] Clean junk/cache files
- [x] Sign apps

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

## Homebrew Management

> in `zsh-brew.sh`

- [x] Integrated Aria2 to download Homebrew Casks
- [x] Enable Homebrew installation by using pre-download installers

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

## Conda Management

> in `zsh-conda.sh`

- [x] Smart management of Conda environments based on architectures (Arm64 | Intel)

- ca: activate `cenv`
- cra: reactivate `cenv`
- ccr: create `cenv`
- cerm: remove `cenv`
- cech: change conda-foreg subdir
  - `i`: use `x86_64` (Rosetta on M1) environment
  - not `i`: use `arm64` environment
- ceep: export environment
- cls: list packages

## Git Management

> in `zsh-git.sh`

- [x] find fat blob files
- [ ] integration of `git filter-repo` command

## Editor

### VSCode

### NeoVim

For NeoVim, I recommend NvChad for a pure Lua configuaration.

## Multiplexer Integration

### Zellij

> in `zsh-pandoc.sh`

- [x] Predefined layouts
- [x] Integrated in Alacritty
  - [x] Shortcuts to move the cursor
  - [x] Shortcuts to move the pane border
  - [x] Shortcuts to split the pane

### TMux

> in `zsh-tmux.sh`

- [x] Capability of capture clipboard in copy mode
- [x] Restoration of last sessions
- [x] Integrated in Alacritty
  - [x] Shortcuts to move the cursor
  - [x] Shortcuts to move the pane border
  - [x] Shortcuts to split the pane

## Other Tools

### Pandoc

> in `zsh-pandoc.sh`

- [x] convert markdown to pdf with unicode (for cjk)

### Widgets

> in `zsh-widgets.sh`

- [x] Weather report (using wttr/in)

## Summary of Plugins

<table border="1">
  <thead>
    <tr>
      <td></td>
      <td>Linux</td>
      <td>macOS</td>
      <td>Windows</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Brew</td>
      <td>✓</td>
      <td>✓</td>
      <td></td>
    </tr>
    <tr>
      <td>Scoop</td>
      <td></td>
      <td></td>
      <td>✓</td>
    </tr>
    <tr>
      <td>Zsh</td>
      <td>✓</td>
      <td>✓</td>
      <td></td>
    </tr>
    <tr>
      <td>Powershell</td>
      <td></td>
      <td></td>
      <td>✓</td>
    </tr>
    <tr>
      <td>NuShell</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Conda</td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>VSCode <br />Extensions</td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>Node</td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>Rust</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>Julia</td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>TeXlive</td>
      <td>✓</td>
      <td>✓</td>
      <td></td>
    </tr>
  </tbody>
</table>

<details>
  <summary>style</summary>
  <style>
    table {
      border-collapse: collapse;
      text-align: center;
    }
  </style>
</details>

## Configuration Files

- Shells
  - Zsh
  - Powershell
  - Nushell
- Terminals
  - Alacritty
  - Zellij
- Packge Managers
  - Conda
  - WinGet
- Editors
  - VSCode:
    - settings
    - keybindings
    - snippets
  - NeoVim (Lua Style, based on NvChad)
    - init
    - chadrc
    - plugins
- Other Softwares
  - Aria2
  - Julia
  - Rectangle (macOS)
- Classic Tools (works well but stop being maintained)
  - TMux
  - NeoVim (Vim Style)

## Credits

- [Mario Catuogno's Clean-macOS](https://github.com/MarioCatuogno/Clean-macOS)
- [Mike McQuaid's dotfiles](https://github.com/MikeMcQuaid/dotfiles)

## License

This work is released under the MIT license.
