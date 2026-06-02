# 字体说明

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
