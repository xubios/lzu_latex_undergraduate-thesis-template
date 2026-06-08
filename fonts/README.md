# 字体说明

重要：正式入口 `template.tex` 因字体版权原因不随仓库上传字体文件。请先将合法获得的字体文件放入本目录，再使用 XeLaTeX 编译正式模板。若只是想在 Overleaf 上先预览，可以使用 `template-overleaf.tex`，该入口不需要上传字体。

本模板默认从 `fonts/` 目录读取以下字体文件。请将合法获得的字体文件放入本目录，并确保文件名与下表完全一致；在 Overleaf 或 Linux 环境中，文件名大小写也必须一致。

| 文件名 | 字体 | 常见 Windows 字体文件 |
| --- | --- | --- |
| `SimSun.ttc` | 宋体 | `simsun.ttc` |
| `SimHei.ttf` | 黑体 | `simhei.ttf` |
| `SimFang.ttf` | 仿宋 | `simfang.ttf` |
| `Arialbd.ttf` | Arial Bold | `arialbd.ttf` |

这些字体通常来自 Windows 或其他授权软件环境，常见位置为 `C:\Windows\Fonts`。公开仓库中不建议直接分发字体文件。使用者可在本机已合法拥有字体的前提下，将相应字体文件自行放入本目录。

如果复制得到的文件名是小写，例如 `simsun.ttc`，建议重命名为模板要求的 `SimSun.ttc`。字体缺失或文件名不一致时，XeLaTeX 通常会报出找不到字体文件的错误。

若你希望模板完全依赖系统字体或开源字体，可以在 `LZUThesis_xb.cls` 开头修改 `\setCJKmainfont`、`\setCJKsansfont`、`\setCJKfamilyfont` 等字体配置。

## Windows 本地配置步骤

1. 打开 `C:\Windows\Fonts`。
2. 找到宋体、黑体、仿宋和 Arial Bold 对应的字体文件。
3. 将字体文件复制到本项目的 `fonts/` 目录。
4. 将文件名改为模板要求的名称：
   - `simsun.ttc` 改为 `SimSun.ttc`
   - `simhei.ttf` 改为 `SimHei.ttf`
   - `simfang.ttf` 改为 `SimFang.ttf`
   - `arialbd.ttf` 改为 `Arialbd.ttf`
5. 回到项目根目录，使用 XeLaTeX 编译 `template.tex`。

如果 Windows 资源管理器中看不到真实文件名，可以右键字体文件查看属性，或先复制到普通文件夹后再重命名。

## macOS 和 Linux 配置说明

macOS 和 Linux 通常不会默认提供 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 这几个 Windows 字体文件名。直接下载本仓库后，如果没有先准备字体，XeLaTeX 通常会报找不到字体文件。

推荐做法：

1. 从自己合法授权的 Windows、Office 或学校提供的授权环境中取得对应字体文件。
2. 将字体文件复制到本项目的 `fonts/` 目录。
3. 将文件名改为模板要求的名称：`SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf`、`Arialbd.ttf`。
4. 使用 XeLaTeX 编译 `template.tex`。

如果你希望使用 macOS 或 Linux 已安装的中文字体，可以先查看本机字体。

macOS：

```bash
find /System/Library/Fonts /Library/Fonts ~/Library/Fonts -iname "*Songti*" -o -iname "*Heiti*" -o -iname "*Fang*" -o -iname "*Arial*"
```

Linux：

```bash
fc-list | grep -Ei "simsun|simhei|fangsong|song|hei|arial"
fc-match "SimSun"
```

注意：找到类似字体不等于本模板会自动使用它。当前 `LZUThesis_xb.cls` 默认按 `fonts/` 目录中的具体文件名加载字体。如果不用 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 和 `Arialbd.ttf`，需要自行修改 `LZUThesis_xb.cls` 中的字体配置。这样可以提高跨平台兼容性，但最终 PDF 字形可能与学校规范要求的宋体、黑体、仿宋略有差异。

## Overleaf 配置步骤

1. 在 Overleaf 项目中新建或打开 `fonts/` 目录。
2. 上传 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 和 `Arialbd.ttf`。
3. 确认文件名大小写与本说明完全一致。Overleaf/Linux 对大小写敏感，`simsun.ttc` 和 `SimSun.ttc` 会被视为不同文件。
4. 在 Overleaf 菜单中将编译器设置为 XeLaTeX。
5. 如果使用参考文献，按 XeLaTeX、BibTeX、XeLaTeX、XeLaTeX 的顺序完整编译。

## 为什么有些 Overleaf 模板不上传字体也能编译

部分模板使用 CTeX/Overleaf 默认字体，例如 Fandol 字体，因此可以不上传 Windows 字体也直接编译。本模板为了更接近兰州大学写作规范中的宋体、黑体、仿宋效果，默认从 `fonts/` 目录加载指定字体文件。

这是一种“规范优先”的设计：PDF 字形更接近学校要求，但正式入口需要先准备字体。由于字体版权原因，本仓库不提供字体文件，也不提供第三方下载链接。

如果只是想在 Overleaf 上先预览模板，可以将 Main document 设置为 `template-overleaf.tex`。该入口使用 Fandol 字体近似替代，不需要上传本目录中的字体文件；正式提交前仍建议准备规范字体，并改回 `template.tex`。

## 常见报错

- `font not found` 或 `cannot find font file`：通常是字体文件缺失、文件名大小写不一致，或没有放在 `fonts/` 目录。
- 中文显示为空白或方框：通常是没有使用 XeLaTeX，或字体文件未正确加载。
- 本地能编译、Overleaf 不能编译：优先检查 Overleaf 中的字体文件名大小写和编译器设置。
- 不想使用随项目上传的字体：可以改 `LZUThesis_xb.cls` 开头的字体配置，改为系统中已经安装且有合法授权的字体名称。

## 关于字体下载链接

本模板不提供第三方字体下载链接。宋体、黑体、仿宋和 Arial Bold 通常随 Windows 或相关授权软件提供，是否可以复制、上传或分发取决于对应软件和字体的授权条款。公开仓库中请不要提交字体文件本身。
