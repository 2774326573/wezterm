<h2 align="center">我的 WezTerm 配置</h2>

<p align="center">
  <a href="https://github.com/KevinSilvester/wezterm-config/stargazers">
    <img alt="Star 数" src="https://img.shields.io/github/stars/KevinSilvester/wezterm-config?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41">
  </a>
  <a href="https://github.com/KevinSilvester/wezterm-config/issues">
    <img alt="Issue 数" src="https://img.shields.io/github/issues/KevinSilvester/wezterm-config?style=for-the-badge&logo=gitbook&color=B5E8E0&logoColor=D9E0EE&labelColor=302D41">
  </a>
  <a href="https://github.com/KevinSilvester/wezterm-config/actions/workflows/lint.yml">
    <img alt="CI 状态" src="https://img.shields.io/github/actions/workflow/status/KevinSilvester/wezterm-config/lint.yml?&style=for-the-badge&logo=githubactions&label=CI&color=A6E3A1&logoColor=D9E0EE&labelColor=302D41">
  </a>
</p>

![screenshot](./.github/screenshots/wezterm.gif)

---

### 配置亮点

- [**背景图管理器**](https://github.com/KevinSilvester/wezterm-config/blob/master/utils/backdrops.lua)
  - 轮换 / 随机背景图
  - 模糊搜索指定图片
  - 焦点模式一键隐藏背景

- [**GPU 适配器选择器**](https://github.com/KevinSilvester/wezterm-config/blob/master/utils/gpu_adapter.lua)
  - 需将 `front_end` 设为 `WebGpu`
  - 按 GPU 性能与图形 API 自动挑选最佳组合（Windows: Dx12 > Vulkan > OpenGL；Linux: Vulkan > OpenGL；macOS: Metal）

---

### 使用概览

1. **同步配置**：克隆到 `~/.config/wezterm`（Windows 会映射到 `C:\Users\<you>\.config\wezterm`）。如已有配置请先备份。
2. **默认启动 WSL**：Windows 下自动探测首个可用的 WSL 发行版并作为默认 Shell。若需指定，启动前设置 `WEZTERM_WSL_DISTRO=<发行版名称>` 即可。
3. **背景与透明度**：默认 85% 透明、无边框，背景图库位于 `./backdrops`，可用快捷键快速切换或聚焦背景。
4. **窗口尺寸**：启动后自动缩放至当前屏幕的 4/5 并居中，必要时使用快捷键最大化。
5. **常用自定义入口**：
   - `config/appearance.lua`：外观与透明度
   - `config/launch.lua`：默认 Shell、启动菜单
   - `config/domains.lua`：WSL / SSH 域

> English-only readers can still follow the structure below; this fork simply provides a localized walkthrough.

### 常用快捷键速览

| 快捷键 | 功能 |
| --- | --- |
| <kbd>Alt</kbd>+<kbd>t</kbd> | 新建默认 Shell 标签页（Windows/Linux 下 <kbd>Alt</kbd> 即 SUPER） |
| <kbd>Alt</kbd>+<kbd>Ctrl</kbd>+<kbd>t</kbd> | 直接打开 WSL 标签页 |
| <kbd>Alt</kbd>+<kbd>/</kbd> | 随机换一张背景图 |
| <kbd>Alt</kbd>+<kbd>b</kbd> | 背景聚焦 / 关闭 |
| <kbd>Alt</kbd>+<kbd>=</kbd> / <kbd>Alt</kbd>+<kbd>-</kbd> | 微调窗口尺寸（基于 4/5 屏幕的默认值） |
| <kbd>Alt</kbd>+<kbd>Ctrl</kbd>+<kbd>Enter</kbd> | 窗口最大化 |

更多组合键请见下文 **所有快捷键** 部分。

---

### 快速开始

- **必备条件**
  - **WezTerm**（最低版本 `20240127-113634-bbcac864`，推荐 Nightly）
    - Windows 安装：Scoop、Winget、Chocolatey 均可
    - macOS 安装：Homebrew、MacPorts
    - Linux：参考官方安装指南
  - **JetBrainsMono Nerd Font**（Scoop / Homebrew 均提供安装途径）

- **安装步骤**
  1. `git clone https://github.com/KevinSilvester/wezterm-config.git ~/.config/wezterm`
  2. 重启或 `CTRL+SHIFT+L` 重载 WezTerm

- **可选修改**
  - `./config/domains.lua`：SSH/WSL 域配置
  - `./config/launch.lua`：首选 Shell 及路径

---

### 所有快捷键

- Mac: `SUPER` = Command，`SUPER_REV` = Command+Ctrl
- Windows/Linux: `SUPER` = Alt，`SUPER_REV` = Alt+Ctrl（用于规避系统快捷键）
- 通用：`LEADER` = `SUPER_REV` + `Space`

#### 杂项

| 快捷键 | 功能 |
| --- | --- |
| <kbd>F1</kbd> | 进入复制模式 |
| <kbd>F2</kbd> | 打开命令面板 |
| <kbd>F3</kbd> | 显示启动器 |
| <kbd>F4</kbd> | 启动器（仅 Tab） |
| <kbd>F5</kbd> | 启动器（仅 Workspace） |
| <kbd>F11</kbd> | 全屏切换 |
| <kbd>F12</kbd> | 调试面板 |
| <kbd>SUPER</kbd>+<kbd>f</kbd> | 文本搜索 |
| <kbd>SUPER_REV</kbd>+<kbd>u</kbd> | URL 选择并打开 |

#### 复制 / 粘贴

| 快捷键 | 功能 |
| --- | --- |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>c</kbd> | 复制到剪贴板 |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>v</kbd> | 从剪贴板粘贴 |

#### 光标

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>←</kbd> | 行首 |
| <kbd>SUPER</kbd>+<kbd>→</kbd> | 行尾 |
| <kbd>SUPER</kbd>+<kbd>Backspace</kbd> | 清空当前行（PowerShell/cmd 受限） |

#### 标签页

**新建 / 关闭**

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>t</kbd> | 新建默认域 Tab |
| <kbd>SUPER_REV</kbd>+<kbd>t</kbd> | 新建 WSL Tab |
| <kbd>SUPER_REV</kbd>+<kbd>w</kbd> | 关闭当前 Tab |

**导航**

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>[</kbd> / <kbd>]</kbd> | 上 / 下一个标签 |
| <kbd>SUPER_REV</kbd>+<kbd>[</kbd> / <kbd>]</kbd> | 向左 / 向右移动标签 |

**标题 / Tab 栏**

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>0</kbd> | 重命名标签 |
| <kbd>SUPER_REV</kbd>+<kbd>0</kbd> | 撤销重命名 |
| <kbd>SUPER</kbd>+<kbd>9</kbd> | Tab 栏开关 |

#### 窗口

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>n</kbd> | 新窗口 |
| <kbd>SUPER</kbd>+<kbd>=</kbd> / <kbd>-</kbd> | 调整窗口大小 |
| <kbd>SUPER_REV</kbd>+<kbd>Enter</kbd> | 最大化 |

#### Pane

**拆分**

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>\</kbd> | 垂直拆分 |
| <kbd>SUPER_REV</kbd>+<kbd>\</kbd> | 水平拆分 |

**缩放 / 关闭**

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>Enter</kbd> | 缩放切换 |
| <kbd>SUPER</kbd>+<kbd>w</kbd> | 关闭 Pane |

**导航**

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER_REV</kbd>+<kbd>h/j/k/l</kbd> | 移动到左/下/上/右 Pane |
| <kbd>SUPER_REV</kbd>+<kbd>p</kbd> | 选择并交换 Pane |

**滚动**

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>u</kbd> / <kbd>d</kbd> | 上 / 下滚动 5 行 |
| <kbd>PageUp</kbd> / <kbd>PageDown</kbd> | 页面滚动 |

#### 背景控制

| 快捷键 | 功能 |
| --- | --- |
| <kbd>SUPER</kbd>+<kbd>/</kbd> | 随机背景 |
| <kbd>SUPER</kbd>+<kbd>,</kbd> / <kbd>.</kbd> | 上一张 / 下一张 |
| <kbd>SUPER_REV</kbd>+<kbd>/</kbd> | 模糊搜索背景 |
| <kbd>SUPER</kbd>+<kbd>b</kbd> | 背景聚焦模式 |

#### Key Table 模式

- `LEADER`+`f`：进入 `resize_font`
- `LEADER`+`p`：进入 `resize_pane`

**resize_font**

| 键 | 功能 |
| --- | --- |
| <kbd>k</kbd> / <kbd>j</kbd> | 增大 / 减小字体 |
| <kbd>r</kbd> | 重置大小 |
| <kbd>q</kbd> / <kbd>Esc</kbd> | 退出 |

**resize_pane**

| 键 | 功能 |
| --- | --- |
| <kbd>h/j/k/l</kbd> | 调整 Pane 尺寸 |
| <kbd>q</kbd> / <kbd>Esc</kbd> | 退出 |

---

### 参考

- https://github.com/rxi/lume
- https://github.com/catppuccin/wezterm
- https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614
- https://github.com/wez/wezterm/discussions/628#discussioncomment-5942139
