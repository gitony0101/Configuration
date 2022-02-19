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
            针对 Rust 工具链 的简约和可扩展的 Dotfile 解决方案
        </p>
        <p align="left">
            <a href="README.md">English</a> |
            <a href="README-CN.md">简体中文</a>
        </p>
    </div>
</body>

来一起氧化开发环境吧!

> Oxidizer 目前处于 beta 阶段，使用时风险自负，欢迎 PR。

![view](view.jpeg)

## 从这里开始

针对 macOS / Linux 操作系统

> 已经基本稳定

```bash
# define the Oxidizer home
export OXIDIZER=$HOME/oxidizer

git clone --depth=1 https://github.com/ivaquero/oxidizer.sh.git $OXIDIZER
sh $Oxidizer/oxidizer.sh
```

针对 Windows 操作系统

> [❗ 开发中 ❗] 未全面测试

```powershell
# define the Oxidizer home
$env:oxidizer = '%USERPROFILE%/oxidizer'
[Environment]::SetEnvironmentVariable('Oxidizer', $env:oxidizer, 'User')

git clone --depth=1 https://github.com/ivaquero/oxidizer.sh.git $env:oxidizer
powershell $env:oxidizer/oxidizer.ps1
```

- 对中国大陆用户，可设置 `BREW_CN` 变量来下载安装 Homebrew：

```bash
export $BREW_CN=1
```

安装之后，您可以在`custom.sh`中个性化您的系统环境 (请查阅 `demo-custom.sh`).

为了保持系统更新，可使用 `oxup` 命令来更新系统：

```bash
oxup
```

## Oxidizer 的主要目标

- 跨平台（Mainly Rust Toolchains）
- 最小化依赖
- 可扩展架构
- 使用绝对丝滑
- 超级快！（当前载入时间 ~ 0.20 秒）

## 氧化进度

### 命令行替换

- [x] 使用 `bat` 替换 `cat`
- [x] 使用 `bottom` 替换 `top` 和 `htop`
- [x] 使用 `du` 替换 `dust`
- [x] 使用 `fd` 替换 `find`
- [x] 使用 `gitui` 替换 `lazygit`
- [x] 使用 `ls --tree` 替换 `tree`
- [x] 使用 `lsd` 替换 `ls`
- [x] 使用 `ripgrep` 替换 `grep`
- [x] 使用 `sd` 替换 `sed`
- [x] 使用 `tealdeer` 替换 `tldr` 和 `man`
- [x] 使用 `zoxide` 替换 `cd` 和 `z.lua`
- [x] 使用 `zellij` 替换 `tmux`
- [x] 使用 `texlab` 替换 `latexindent`

### 终端软件替换

- [x] 使用 `Alacritty` 替换 `iTerm2` 和 `Windows Terminal`

### 其他命令行工具

- [x] delta
- [x] hyperfine
- [x] kondo
- [ ] helix-editor
- [ ] nushell

## 主要文件

- `oxin`:初始化默认设置

## Shell

### Zsh

- [x] 基于智能判断 Arm64 或 Intel 平台的 conda 环境管理系统
- [x] 集成 Aria2 下载 Homebrew Casks
- [x] Homebrew 可以使用预下载的 Cask 安装器

### PowerShell

- [x] 集成 Scoop
- [ ] 实现 Zsh 功能
- [ ] 集成到了 Alacritty 内

### NuShell

- [ ] 实现 Zsh 功能
  - [x] zsh-cpp
  - [ ] zsh-julia
  - [x] zsh-nodejs
  - [ ] zsh-python
  - [ ] zsh-rust
  - [x] zsh-texlive
- [ ] 集成 Conda
- [ ] 集成 Alacritty

### Helix

- [ ] 取代 NeoVim
- [ ] 集成进 Alacritty

## 系统

### macOS

- [x] 更新系统
- [x] 清除缓存垃圾
- [x] 文件签名

## 文件管理

> 在 `zsh-utils.sh` 中：

- `ff`
  - 通过 `source` 刷新 (默认: zsh)
- `ef`
  - 通过 `$EDITOR` 编辑 (默认: VS Code)
  - 文件夹：开放
- `vf`
  - 通过 `nvim` 编辑(NeoVim)
  - 文件夹：开放
- `bf`
  - 通过 `bat`/`cat` 浏览文件
  - 文件夹：通过 `lsd`/`ls` 浏览
- `ipf`
  - 文件：在 `$Oxygen` 中覆盖对应的 `$Sysfile` 文件配置
- `epf`
  - 文件：在 `$Sysfile` 中覆盖对应的 `$Oxygen` 文件配置并创建硬连接
- `init_*`
  - 文件: 在 `$Oxygen/install` 安装配置文件
- `update_*`
  - 文件: 在 `$BACKUP` 文件夹中更新系统配置文件
- `backup_*`
  - 文件: 在 `$BACKUP` 文件夹中备份文件

## Homebrew 管理

> 在 `zsh-brew.sh`中

- [x] Integrated Aria2 to download Homebrew Casks
- [x] Enable Homebrew installation by using pre-download installers

- [x] 使用 `aria2` 下载 brew cask
- [x] 使用预下载器安装 Homebrew Casks

### 安装、删除、更新

- bis: brew install 安装
- bris: brew reinstall 重装
- bus: brew uninstall 删除
- bup: brew upgrade 更新

```bash
bis curl git gnupg
```

**前缀 `c` 是一个标志用来严格限制 brew 命令只针对的 casks 操作**

- bisc: brew install --cask cask 安装
- brisc: brew reinstall --cask cask 重装
- bupc: brew upgrade --cask cask 升级

前缀 `g` 是一个标志用来强制升级每个 cask（包括 `auto_update` 自动升级的 cask）

- bupg: brew upgrade --greedy 全局升级

### 下载、替换、镜像

- bdlc: 使用 `aria2` 下载 brew cask
  - `$1`: cask name
- brp: 适用于下载文件替换缓存中的 brew cask
  - `$1`: cask name
- bmr: using brew mirror 使用 brew 镜像
- bmrrs: reset brew git source to official repositories 重置 brew 到官方源

### 打包和输出安装脚本

## Conda 环境管理

> 在 `zsh-python.sh` 中：

### 在环境外：

- ca: 激活环境 `cenv`
- cra: 重新激活环境 `cenv`
- ccr: 创建环境 `cenv`
- cerm: 删除环境 `cenv`
- cech: 更改 conda-forge 子目录
  - `i`: 使用 `x86_64` (M1 罗塞塔转译) 环境
  - 非 `i`: 使用 `arm64` 环境
- ceep: 释放环境
- cls: 包列表

### Git 管理

- [x] 查找 git 产生的大体积文件
- [ ] 集成 `git filter-repo` 命令

### VS Code

### NeoVim

对 NeoVim，推荐使用 NvChad 用来搭建一个纯净的 Lua 设置.

## Multiplexer

### Zellij

- [x] 预定义的界面
- [x] 集成 Alacritty
  - [x] 光标快捷键
  - [x] 窗口快捷键
  - [x] 分屏快捷键

### TMux

- [x] 关连剪贴板
- [x] 自动回复上次内容
- [x] 集成 Alacritty
  - [x] 光标快捷键
  - [x] 窗口快捷键
  - [x] 分屏快捷键

## 其他工具

### Pandoc

- [x] 转换 markdown 到 pdf (使用 cjk unicode)

## Widgets

- [x] 天气插件 (使用 `wttr/in`)

## 插件总结

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
      <td>Conda</td>
      <td>✓</td>
      <td>✓</td>
      <td>✓</td>
    </tr>
    <tr>
      <td>VSCode</td>
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

## 配置文件

- Shells
  - Zsh
  - Powershell
  - Nushell
- 终端
  - Alacritty
  - Zellij
- 包管理器
  - Conda
  - WinGet
- Editors
  - VSCode:
    - settings，keybindings
    - snippets 文件夹
  - NeoVim (Lua Style, based on NvChad)
    - init，chadrc，plugins
- Other Softwares
  - Aria2
  - Julia
  - Rectangle (macOS)
  - Dash (macOS)
- Classic Tools (works well but stop being maintained)
  - TMux
  - NeoVim (Vim Style)

## 致谢

- [Mario Catuogno's Clean-macOS](https://github.com/MarioCatuogno/Clean-macOS)
- [Mike McQuaid's dotfiles](https://github.com/MikeMcQuaid/dotfiles)

## 许可

这个项目在 MIT 许可下发布
