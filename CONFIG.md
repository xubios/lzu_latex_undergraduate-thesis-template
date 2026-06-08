# LaTeX 环境配置教程

本文面向第一次使用本模板的同学，说明如何在 Overleaf 和 Windows + VS Code 中配置并编译 `template.tex`。

如果只是想尽快开始写论文，优先看“最快开始”；遇到问题时再看后面的常见报错。

重要提醒：本仓库因字体版权原因不包含宋体、黑体、仿宋和 Arial Bold 字体文件，所以下载或克隆后不能马上编译。第一次使用前必须先准备合法获得的字体文件，并放入 `fonts/` 目录。

## 最快开始

1. 下载或克隆本仓库。
2. 准备合法获得的字体文件，并放入 `fonts/` 目录：
   - `SimSun.ttc`
   - `SimHei.ttf`
   - `SimFang.ttf`
   - `Arialbd.ttf`
3. 打开 `template.tex`。
4. 修改题目、作者、学院、专业、年级和导师信息。
5. 填写中英文摘要。
6. 从 `\mainmatter` 后开始替换示例正文。
7. 在 `bib/template.bib` 中维护参考文献。
8. 使用 XeLaTeX 编译。
9. 如果使用参考文献，按下面顺序完整编译：

```bash
xelatex template.tex
bibtex template
xelatex template.tex
xelatex template.tex
```

也可以使用：

```bash
latexmk -xelatex template.tex
```

## 字体准备

模板默认从 `fonts/` 目录读取宋体、黑体、仿宋和 Arial Bold。公开仓库中不提供字体文件，也不提供第三方下载链接。缺少这些字体时，模板通常不能直接编译。

Windows 用户通常可以在 `C:\Windows\Fonts` 中找到对应字体。复制到项目后，请确认文件名与模板要求完全一致：

| 模板需要的文件名 | 常见原文件名 | 用途 |
| --- | --- | --- |
| `SimSun.ttc` | `simsun.ttc` | 宋体 |
| `SimHei.ttf` | `simhei.ttf` | 黑体 |
| `SimFang.ttf` | `simfang.ttf` | 仿宋 |
| `Arialbd.ttf` | `arialbd.ttf` | Arial Bold |

注意：Overleaf、Linux 和 GitHub Actions 等环境对大小写敏感，`simsun.ttc` 和 `SimSun.ttc` 是两个不同文件名。

macOS 和 Linux 通常不会默认提供这些 Windows 字体文件。非 Windows 用户有两种处理方式：

1. 从自己合法授权的 Windows、Office 或学校提供的授权环境中取得对应字体文件，复制到本项目的 `fonts/` 目录，并重命名为上表中的模板文件名。
2. 改用本机已有字体或开源字体：在 `LZUThesis_xb.cls` 开头修改 `\setCJKmainfont`、`\setCJKsansfont`、`\setCJKfamilyfont` 和相关 `\CJKfontspec` 配置。这样可以编译，但排版细节可能与学校规范中的宋体、黑体、仿宋略有差异。

macOS 可以先用下面命令查看本机字体：

```bash
find /System/Library/Fonts /Library/Fonts ~/Library/Fonts -iname "*Songti*" -o -iname "*Heiti*" -o -iname "*Fang*" -o -iname "*Arial*"
```

Linux 可以先用下面命令查看 fontconfig 能识别的字体：

```bash
fc-list | grep -Ei "simsun|simhei|fangsong|song|hei|arial"
fc-match "SimSun"
```

这些命令只能帮助确认本机有哪些字体；如果仍使用本模板默认配置，最终仍需要在 `fonts/` 目录中放入模板要求的四个字体文件，或者手动修改 `LZUThesis_xb.cls` 的字体配置。

## Overleaf 配置

### 方式一：免上传字体先跑通

1. 打开 Overleaf。
2. 新建项目，选择从 GitHub 导入，或先下载本仓库 zip 后上传。
3. 确认项目根目录中有：
   - `template.tex`
   - `template-overleaf.tex`
   - `LZUThesis_xb.cls`
   - `bib/`
   - `figures/`
4. 打开 Overleaf 左上角菜单。
5. 将 Compiler 设置为 `XeLaTeX`。
6. 将 Main document 设置为 `template-overleaf.tex`。
7. 点击 Recompile。

`template-overleaf.tex` 使用 TeX Live/Overleaf 通常自带的 Fandol 字体，不需要上传 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 和 `Arialbd.ttf`，适合第一次使用时先确认模板能编译。

### 方式二：正式字体模式

正式提交前，建议使用更接近学校规范的字体模式：

1. 按“字体准备”一节准备合法获得的四个字体文件。
2. 上传 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 和 `Arialbd.ttf` 到 Overleaf 项目的 `fonts/` 目录。
3. 确认文件名大小写完全一致。
4. 将 Main document 改为 `template.tex`。
5. 使用 XeLaTeX 重新编译。

两种入口的区别：

- `template.tex`：正式入口，默认加载 `fonts/` 中的宋体、黑体、仿宋和 Arial Bold，更接近学校写作规范。
- `template-overleaf.tex`：体验入口，使用 Fandol 字体近似替代，不需要上传字体，适合先跑通和预览。

### Overleaf 参考文献刷新

如果参考文献显示为问号，或文献列表没有更新：

1. 检查正文中的引用键，例如 `\newupcite{jaeger2001echo}`。
2. 检查 `bib/template.bib` 中是否有同名条目。
3. 点击 Recompile 旁边的小箭头。
4. 选择从头重新编译，或连续编译两到三次。

如果目录、图目录、表目录或页码不更新，也可以优先尝试从头重新编译。Overleaf 会在项目中保留 LaTeX 辅助文件，旧辅助文件偶尔会让交叉引用和目录信息停留在旧状态。

### Overleaf 常见问题

- 找不到字体：检查 `fonts/` 目录和文件名大小写。
- 为什么有些学长模板不用上传字体也能编译：那些模板通常使用 CTeX/Overleaf 默认字体，例如 Fandol 字体。本模板为了更接近学校规范中的宋体、黑体、仿宋效果，默认加载 `fonts/` 目录中的指定字体文件，因此需要先自行准备合法字体。
- 不想上传字体但想先预览：将 Main document 设置为 `template-overleaf.tex`。
- 中文乱码或方框：确认 Compiler 是 `XeLaTeX`。
- 图片找不到：确认图片在 `figures/` 目录，并且正文中路径大小写一致。
- 本地能编译，Overleaf 不能编译：优先检查字体文件名大小写和是否上传完整。

## Windows + VS Code 配置

### 安装 TeX Live

推荐安装 TeX Live 2024 或更新版本。安装完成后，重新打开 PowerShell，运行：

```powershell
xelatex --version
bibtex --version
latexmk --version
```

如果这些命令都能显示版本号，说明 TeX 环境可用。

如果提示“不是内部或外部命令”，通常是 TeX Live 没有安装好，或 TeX Live 的 `bin` 目录没有加入系统 `PATH`。

### 安装 VS Code 和扩展

1. 安装 VS Code。
2. 用 VS Code 打开整个项目文件夹，不要只打开单个 `template.tex`。
3. VS Code 会提示安装推荐扩展 LaTeX Workshop。
4. 如果没有提示，可以在扩展商店手动搜索并安装 `LaTeX Workshop`。

本仓库已经提供：

```text
.vscode/
├── extensions.json
└── settings.json
```

其中 `settings.json` 提供两套编译配方：

- `latexmk (xelatex)`：推荐默认使用。
- `xelatex -> bibtex -> xelatex*2`：需要手动完整刷新参考文献时使用。

### VS Code 编译步骤

1. 打开 `template.tex`。
2. 点击左侧 TeX 图标，打开 LaTeX Workshop 面板。
3. 选择 Build LaTeX project。
4. 默认会使用 `latexmk (xelatex)`。
5. 编译成功后，PDF 会在 VS Code 标签页中打开。

如果参考文献仍显示问号，可以切换到 `xelatex -> bibtex -> xelatex*2` 配方再编译一次。

### VS Code 卡在 building 时怎么处理

如果 VS Code 左下角一直显示正在 build，或者 LaTeX Workshop 面板一直转圈，不要连续反复点击编译。建议按下面顺序处理：

1. 点击 LaTeX Workshop 面板中的停止编译按钮。
2. 如果按钮不可见，按 `Ctrl+Shift+P` 打开命令面板。
3. 运行 `LaTeX Workshop: Kill LaTeX compiler process`，停止当前编译进程。
4. 再次按 `Ctrl+Shift+P`。
5. 运行 `LaTeX Workshop: Clean up auxiliary files`，清理辅助文件。
6. 回到 `template.tex`，保存文件。
7. 在 LaTeX Workshop 面板中重新选择编译配方：
   - 常规情况选 `latexmk (xelatex)`。
   - 参考文献或交叉引用异常时选 `xelatex -> bibtex -> xelatex*2`。

清理辅助文件通常只会删除 `.aux`、`.log`、`.toc`、`.bbl`、`.blg`、`.out`、`.synctex.gz` 等编译产物，不会删除 `template.tex`、`LZUThesis_xb.cls`、`bib/template.bib`、图片或字体说明文件。

### VS Code 常见问题

- 找不到 `xelatex`：检查 TeX Live 是否安装，并重启 VS Code。
- 找不到 `latexmk`：TeX Live 安装不完整，或 `PATH` 没更新。
- 只打开单个 `.tex` 文件导致配置不生效：关闭窗口，重新打开整个项目文件夹。
- PDF 没更新：先保存 `template.tex`，再重新编译。
- 中文字体找不到：检查 `fonts/` 目录是否包含四个字体文件。
- 左下角一直显示正在 build：先点击 LaTeX Workshop 的停止编译按钮，再执行清理辅助文件，然后重新选择编译配方编译。不要在同一个任务卡住时反复点击编译。

## 命令行编译

如果不使用 VS Code，也可以在项目根目录打开 PowerShell：

```powershell
cd "你的项目路径"
xelatex template.tex
bibtex template
xelatex template.tex
xelatex template.tex
```

或使用：

```powershell
latexmk -xelatex template.tex
```

清理中间文件可以使用：

```powershell
latexmk -c
```

注意：不要删除 `template.tex`、`LZUThesis_xb.cls`、`bib/`、`figures/`、`fonts/README.md` 等源文件。

## 第一次写作建议

第一次使用时，建议只改 `template.tex`：

1. 改封面信息。
2. 改摘要和关键词。
3. 保留示例章节结构，逐段替换正文。
4. 将自己的图片放入 `figures/`。
5. 将自己的参考文献放入 `bib/template.bib`。
6. 编译通过后，再删除不需要的示例图、表示例、算法示例或附录。

不建议一开始修改 `LZUThesis_xb.cls`。类文件主要控制格式，除非明确知道自己要改什么，否则容易影响整篇论文排版。

## 常见报错对照表

| 现象 | 常见原因 | 处理方式 |
| --- | --- | --- |
| `font not found` | 字体缺失或文件名不一致 | 检查 `fonts/` 目录和大小写 |
| 中文显示为空白或方框 | 没用 XeLaTeX 或字体没加载 | 改用 XeLaTeX，检查字体 |
| 文献引用是 `[?]` | 没跑 BibTeX 或引用键错误 | 完整编译，检查 `.bib` 条目键 |
| 图片不显示 | 路径或文件名错误 | 图片放入 `figures/`，检查后缀和大小写 |
| 目录页码不对 | 编译次数不够 | 至少重新运行两次 XeLaTeX |
| VS Code 配置不生效 | 只打开了单个 `.tex` 文件 | 打开整个项目文件夹 |
| VS Code 左下角一直显示正在 build | 上一次编译任务卡住或辅助文件状态异常 | 停止编译，清理辅助文件，再重新选择编译配方 |
| Overleaf 报错但本地正常 | 字体未上传或大小写不一致 | 检查 Overleaf 项目中的 `fonts/` |

## 公开仓库注意事项

公开发布自己的 fork 或修改版本前，请检查：

- 不要提交字体文件。
- 不要提交个人签名图片。
- 不要提交真实成绩、手机号、身份证号等隐私信息。
- 不要提交自己的论文实验图，除非它们本来就是模板示例的一部分。
- 不要提交 `.aux`、`.log`、`.bbl`、`.toc`、`.synctex.gz` 等编译中间文件。

本模板的 `.gitignore` 已经处理了常见情况，但通过 GitHub 网页手动上传文件时仍需自行检查。

## 参考资料

- [LaTeX Workshop Compile Wiki](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile)
- [Overleaf: The Main document](https://docs.overleaf.com/getting-started/recompiling-your-project/the-main-document)
- [Overleaf: Selecting a TeX Live version and LaTeX compiler](https://docs.overleaf.com/getting-started/recompiling-your-project/selecting-a-tex-live-version-and-latex-compiler)
- [Overleaf: Clearing the project cache](https://docs.overleaf.com/troubleshooting-and-support/clearing-the-project-cache)
