# Oxidizer.sh

Minimalistic & Extensible Dotfile Solution using Rust Toolchains

Let's Oxidize Your Developement Environments

> Oxidizer is currently in beta, use at your own risk

![view](view.jpeg)

## Get Started

For macOS / Linux

> fairly stable

```bash
# define the Oxidizer home
export OXIDIZER=$HOME/oxidizer

git clone --depth=1 https://github.com/ivaquero/oxidizer.sh.git $OXIDIZER
sh $Oxidizer/oxidizer.sh
```

For Windows

> [❗WIP❗] not tested, I don't have a windows destop at the moment

```powershell
# define the Oxidizer home
$env:oxidizer = '%USERPROFILE%/oxidizer'
[Environment]::SetEnvironmentVariable('Oxidizer', $env:oxidizer, 'User')

git clone --depth=1 https://github.com/ivaquero/oxidizer.sh.git $env:oxidizer
powershell $env:oxidizer/oxidizer.ps1
```

For Chinese mainland users, you may set `BREW_CN` variable in following way

```bash
export $BREW_CN=1
```

After installation, you might personalize your preference in `custom.sh` (check `demo-custom.sh`).

To keep up the updates, enter the oxidizer rootpath and use `oxup` function

```bash
cd oxidizer && oxup
```

<p>
<a href="user-guide.md">User Guide</a>
</p>

## Phylosophy

- Cross-Platform (Mainly Rust Toolchains)
- Minimalist dependencies
- Extensible Architecture
- Super-Fast! (Current loading time is ~0.20s)

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

> This repo includes miscellaneous files for daily use.

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

### Tools

- [x] delta
- [x] hyperfine
- [x] kondo

## Shell

### Zsh

- [x] Smart management of Conda environments based on architectures (Arm64 | Intel)
- [x] Suppress Homebrew error message raised by Arm64
- [x] Integration of Aria2 to download Homebrew Casks
- [x] Integration of Homebrew installation using pre-download installers

### PowerShell

- [x] Integration of Scoop
- [ ] Re-Implement of Zsh functions
- [ ] Integrated in Alacritty

### NuShell

- [ ] Re-Implement of Zsh functions
  - [x] zsh-cpp
  - [ ] zsh-julia
  - [x] zsh-nodejs
  - [ ] zsh-python
  - [ ] zsh-rust
  - [x] zsh-texlive
- [ ] Integration of Conda
- [ ] Integrated in Alacritty

## Multiplexer

### Zellij

- [x] Predefined layouts
- [x] Integrated in Alacritty
  - [x] Shortcuts to move the cursor
  - [x] Shortcuts to move the pane border
  - [x] Shortcuts to split the pane

### TMux

- [x] Capability of capture clipboard in copy mode
- [x] Restoration of last sessions
- [x] Integrated in Alacritty
  - [x] Shortcuts to move the cursor
  - [x] Shortcuts to move the pane border
  - [x] Shortcuts to split the pane

## Editor

### NeoVim

For NeoVim, I recommend NvChad for a pure Lua configuaration.

### Helix

- [ ] Replace NeoVim
- [ ] Integrated in Alacritty

## System

### macOS

- [x] Update system
- [x] Clean junk/cache files
- [x] Sign apps

## Tools

### Git

- [x] find fat blob files
- [ ] integration of `git filter-repo` command

### Pandoc

- [x] convert markdown to pdf with unicode (for cjk)

## Widgets

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

## License

This work is released under the MIT license.

## Credits

- [Mario Catuogno's Clean-macOS](https://github.com/MarioCatuogno/Clean-macOS)
- [Mike McQuaid's dotfiles](https://github.com/MikeMcQuaid/dotfiles)
