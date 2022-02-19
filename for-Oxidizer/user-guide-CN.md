# 用户指南

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

### 在环境内

## Homebrew 管理

> 在 `zsh-brew.sh`中

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
