# 兰州大学本科毕业论文（设计）LaTeX 模板

这是一个面向兰州大学本科毕业论文（设计）的 XeLaTeX 模板，xb 学长倾情奉献。当前主类文件为 `LZUThesis_xb.cls`，示例入口为 `template.tex`。

关键词：兰州大学毕业论文、兰州大学本科毕业论文、兰大毕业论文模板、兰州大学论文 LaTeX 模板、LZU thesis template、Lanzhou University undergraduate thesis template。

> 说明：本模板不是兰州大学官方发布模板。提交前请以学院和教务处当年最终通知为准。
>
> 重要：正式入口 `template.tex` 因字体版权原因不包含宋体、黑体、仿宋和 Arial Bold 字体文件，首次正式使用前请先按 [字体说明](#字体说明) 或 [fonts/README.md](fonts/README.md) 准备合法获得的字体文件，并放入 `fonts/` 目录。若只是想在 Overleaf 上先跑通模板，可直接使用免上传字体入口 `template-overleaf.tex`。

## 适配依据

本模板主要参考兰州大学本科毕业论文（设计）写作规范、历年本科毕业论文（设计）工作通知及前辈模板实践整理而成。当前版本重点参考并适配了：

- 《兰州大学本科毕业论文（设计）写作规范》中关于论文组成、页面设置、页眉页码、摘要、目录、正文标题、图表、公式、参考文献、附录和致谢等格式要求。
- 兰州大学教务处历年本科毕业论文（设计）工作通知，特别是 2025 届、2026 届相关通知中对毕业论文流程和材料的要求。
- 各学院可能会在学校统一要求基础上补充细则。正式提交前，请务必再次核对所在学院当年通知、教务处最新通知和指导教师要求。

## 前辈贡献与致谢

本模板不是从零开始完成的。当前版本建立在多位前辈长期积累的基础上：

- 早期模板工作参考了 2013 级核科学与技术学院胡斌、沈周等同学的本科论文 LaTeX 模板实践。
- 后续模板工作参考了 2016 级物理科学与技术学院余航等同学对兰州大学本科论文排版要求的整理与实现。
- 模板中部分结构也参考了公开社区中的 LZUThesis 系列项目，例如 `suchot/LZUThesis2017`、`yuhldr/LZUThesis2020` 等。
- 特别感谢 Overleaf 上 `xiashj2021` 夏生杰学长维护和分享的兰州大学本科生毕业论文模板，其示例内容和使用说明为本模板整理提供了重要参考。
- 参考文献样式与中文文献支持吸收了社区同学的实践经验，特别感谢曾对中文参考文献条目处理提供代码和建议的贡献者。
- 当前 `LZUThesis_xb.cls` 在上述基础上进一步整理了 2026 届本科毕业论文（设计）格式要求，修正了封面、题目换行、摘要、目录、标题英文、页眉页码、图表目录、参考文献、致谢和成绩表等细节，使其更接近当前兰州大学本科论文写作规范。

如果继续发布或二次修改本模板，请保留这些贡献说明。

## 目录结构

```text
.
├── LZUThesis_xb.cls
├── LZUThesis_xb_overleaf.cls
├── template.tex           # 正式入口，默认使用 fonts/ 中的规范字体文件
├── template-overleaf.tex  # Overleaf 免上传字体体验入口，使用 Fandol 近似字体
├── CONFIG.md           # LaTeX 环境配置教程
├── bib/
│   ├── lzubib.bst
│   └── template.bib
├── figures/
│   ├── lzu2020.pdf      # 封面校徽，类文件默认使用
│   ├── lzu2020.png      # 正文示例图片
│   └── lzu2007.png      # 正文并列图片示例
├── .vscode/
│   ├── extensions.json  # 推荐安装 LaTeX Workshop
│   └── settings.json    # VS Code 编译配方
└── fonts/
    └── README.md
```

## 入口选择

- 想先在 Overleaf 上快速预览：使用 `template-overleaf.tex`，不需要上传字体，适合零基础先确认模板能编译。
- 准备正式写作或提交：使用 `template.tex`，需要自行准备合法字体，排版更接近学校规范。

## 编译环境

推荐使用 TeX Live 2024 或更新版本，并使用 XeLaTeX 编译。

如果第一次配置 LaTeX 环境，建议先阅读 [CONFIG.md](CONFIG.md)，其中包含 Overleaf、Windows、VS Code、命令行编译和常见报错说明。

两个入口的具体区别：

- `template.tex`：正式入口。默认从 `fonts/` 目录加载宋体、黑体、仿宋和 Arial Bold，更接近学校写作规范，正式提交前推荐使用。
- `template-overleaf.tex`：Overleaf 免上传字体体验入口。使用 TeX Live/Overleaf 通常自带的 Fandol 字体近似替代，可以不上传字体先编译跑通，但字形与宋体、黑体、仿宋不完全一致。

如果正文中使用 BibTeX 参考文献，推荐编译顺序：

```bash
xelatex template.tex
bibtex template
xelatex template.tex
xelatex template.tex
```

也可以使用 `latexmk`：

```bash
latexmk -xelatex template.tex
```

## 字体说明

正式入口 `template.tex` 不是下载后马上就能运行的完整二进制包。为了避免侵犯字体版权，仓库中不会上传字体文件，使用者需要先自行准备合法获得的字体文件。

模板默认从 `fonts/` 目录加载宋体、黑体、仿宋和 Arial Bold 等字体，以便在不同机器上获得更稳定的排版效果。需要准备的文件名为 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 和 `Arialbd.ttf`。

由于这些字体通常涉及商业授权，公开 GitHub 仓库中不建议直接上传字体文件，也不建议在 README 中提供非官方下载链接。请使用者在本机合法拥有字体的前提下，自行将字体文件放入 `fonts/` 目录。详见 [fonts/README.md](fonts/README.md)。

字体准备速查：

```text
fonts/
├── SimSun.ttc    # 宋体
├── SimHei.ttf    # 黑体
├── SimFang.ttf   # 仿宋
└── Arialbd.ttf   # Arial Bold
```

Windows 用户通常可以在 `C:\Windows\Fonts` 中找到对应字体文件；Overleaf 用户需要把这些字体文件上传到项目的 `fonts/` 目录，并注意文件名大小写完全一致。

macOS 和 Linux 用户通常不会自带 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 这几个 Windows 字体文件名。建议先从自己合法授权的 Windows、Office 或学校提供的授权环境中取得对应字体文件，再放入 `fonts/` 目录；如果希望直接使用 macOS/Linux 已安装字体或开源字体，需要在 `LZUThesis_xb.cls` 中修改字体配置，具体见 [fonts/README.md](fonts/README.md)。

为什么有些 Overleaf 模板不上传字体也能编译？

部分模板使用 CTeX/Overleaf 默认字体，例如 Fandol 字体，因此可以直接编译。本模板正式入口为了更接近兰州大学写作规范中的宋体、黑体、仿宋效果，默认从 `fonts/` 目录加载指定字体文件。由于字体版权原因，仓库不提供字体文件或下载链接；正式提交前，使用者需要自行准备合法获得的字体。

如果只是想在 Overleaf 上先跑通模板，可以把 Main document 设置为 `template-overleaf.tex`。该入口不需要上传字体文件，但属于“体验/预览模式”；正式提交前，仍建议改回 `template.tex` 并准备规范字体。

## 配置教程

- Overleaf、Windows、VS Code、命令行编译和常见报错请见 [CONFIG.md](CONFIG.md)。
- 字体文件准备和授权说明请见 [fonts/README.md](fonts/README.md)。
- 本仓库已提供 `.vscode/settings.json` 和 `.vscode/extensions.json`，VS Code 用户打开整个项目文件夹后可按提示安装 LaTeX Workshop，并使用内置的 XeLaTeX 编译配方。

## LaTeX 写作速查

下面是写本科毕业论文时最常用的基础命令。正式写作时，优先修改 `template.tex` 中已有示例；不熟悉 LaTeX 时，不建议一开始大幅改动 `LZUThesis_xb.cls`。

| 目的         | 写法示例                                                    | 说明                                      |
| ------------ | ----------------------------------------------------------- | ----------------------------------------- |
| 新建一章     | `\chapter{绪论}`                                          | 正文章节从 `\mainmatter` 后开始。       |
| 新建一节     | `\section{研究背景}`                                      | 建议正式论文最多使用到 `\subsection`。  |
| 新建小节     | `\subsection{问题定义}`                                   | 更细内容可用段落或列表承接。              |
| 普通段落     | 段落之间留一个空行                                          | 不要只用一个回车分段。                    |
| 加粗         | `\textbf{重要内容}`                                       | 少量强调时使用。                          |
| 行内公式     | `$y=ax+b$`                                                | 适合短公式。                              |
| 独立公式     | `\begin{equation} ... \end{equation}`                     | 配合 `\label{}` 和 `\eqref{}` 引用。  |
| 插入图片     | `\includegraphics[width=0.6\textwidth]{figures/name.png}` | 图片建议放入 `figures/`。               |
| 图题和标签   | `\caption{图题}`、`\label{fig:name}`                    | `\label{}` 通常放在 `\caption{}` 后。 |
| 引用图表公式 | `图~\ref{fig:name}`、`式~\eqref{eq:name}`               | 避免手动写编号。                          |
| 文献上标引用 | `\newupcite{key}`                                         | `key` 来自 `bib/template.bib`。       |
| 普通文献引用 | `\cite{key}`                                              | 适合括号式或正文式引用。                  |
| 无序列表     | `\begin{itemize} ... \end{itemize}`                       | 每项用 `\item` 开头。                   |
| 有序列表     | `\begin{enumerate} ... \end{enumerate}`                   | 每项用 `\item` 开头。                   |
| 脚注         | `文本\footnote{脚注内容}`                                 | 正文中少量补充说明可用。                  |

常见写作习惯：

- 中文正文直接输入即可；英文和数字通常不需要额外处理。
- 文件名、图片名和文献键尽量使用英文、数字、下划线，少用空格和特殊符号。
- 每个重要图、表、公式、算法和代码块都建议设置 `\label{}`，正文中用 `\ref{}` 或 `\eqref{}` 自动引用。
- 修改目录、图表、公式编号或参考文献后，至少重新编译两次；含参考文献时按完整编译顺序运行。
- 遇到问号引用，先检查 `\label{}`、`\ref{}`、`.bib` 条目键是否一致，再完整编译。

## 使用方法

1. 正式提交建议使用 `template.tex`。先将合法获得的字体文件放入 `fonts/` 目录；缺少字体时，正式入口通常不能直接编译。
2. 修改 `template.tex` 中的题目、作者、学院、专业、年级和导师信息。
3. 在 `\ZhAbstract{...}{...}` 和 `\EnAbstract{...}{...}` 中填写中英文摘要与关键词。
4. 在 `\mainmatter` 后写正文。
5. 在 `bib/template.bib` 中维护参考文献，并用 `\newupcite{key}` 或 `\cite{key}` 引用。
6. 在 `\Thanks` 后填写致谢。
7. 如需成绩表，保留 `\Grade`；如学院不要求电子版成绩表，可按实际要求删除或注释。

Overleaf 新手可以先使用 `template-overleaf.tex` 作为 Main document，不上传字体也能预览模板效果；确认环境没问题后，再回到正式入口 `template.tex`。

## 新手检查清单

第一次使用时，建议按下面顺序检查：

- `fonts/` 目录中已经放入 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 和 `Arialbd.ttf`。
- `template.tex` 中的题目、作者、导师、学院、专业、年级已经替换。
- 中文题名较长时，已经在 `\title{{...}{...}}` 或 `\abstracttitle{...}` 中手动分行。
- 中英文摘要、关键词、正文、参考文献和致谢中的示例文字已经替换。
- 图片均放在 `figures/` 目录，并使用相对路径引用。
- 参考文献写入 `bib/template.bib`，且 `\bibdatabase{bib/template}` 不带 `.bib` 后缀。
- 按 `XeLaTeX -> BibTeX -> XeLaTeX -> XeLaTeX` 完整编译，最终日志中不再有未定义引用或未定义文献。
- 公开发布前检查 `.gitignore` 是否已经排除字体、签名图片、个人论文草稿和 TeX 中间文件。

## `template.tex` 逐段说明

| 位置或命令                                                                                                                               | 作用                               | 使用建议                                                                                               |
| ---------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `\documentclass[AutoFakeBold]{LZUThesis_xb}`                                                                                           | 调用本模板类文件                   | 类文件名保持为 `LZUThesis_xb.cls` 时无需修改。                                                       |
| `\usepackage{...}`                                                                                                                     | 示例中额外加载常用宏包             | 模板类已内置大量宏包；不确定时可以先保留示例中的 `booktabs`、`multirow`、`graphicx`、`float`。 |
| `\title{{...}{...}}`                                                                                                                   | 中文题名，支持两行                 | 只有一行题名时，第二组花括号可留空。                                                                   |
| `\abstracttitle{...}`                                                                                                                  | 中文摘要页顶部题名                 | 题名较长时可用 `\\` 手动换行，使摘要页更协调。                                                       |
| `\entitle{{...}{...}}`                                                                                                                 | 英文题名，支持两行                 | 应与中文题名含义一致。                                                                                 |
| `\author`、`\major`、`\advisor`、`\college`、`\grade`                                                                          | 封面基本信息                       | 按个人实际信息替换。                                                                                   |
| `\maketitle`                                                                                                                           | 生成封面                           | 应放在基本信息之后。                                                                                   |
| `\mysignature`、`\mytime`、`\teachersignature`、`\teachertime`                                                                   | 诚信责任书和授权声明中的签名、日期 | 打印后手签可留空；电子签名可填入图片命令，但不要提交个人签名图片到公开仓库。                           |
| `\supervisorsignature`、`\committeesignature`、`\recommendedgrade`、`\finalgrade`、`\supervisorcomment`、`\committeecomment` | 常规成绩页相关字段                 | 不需要电子成绩页时可保持为空，或按学院要求删除/注释 `\Grade`。                                       |
| `\outstandingcommitteesignature`、`\outstandingcommitteecomment`                                                                     | 优秀论文推优成绩页相关字段         | 启用 `\OutstandingGrade` 时填写；常规成绩页无需使用。                                                |
| `\makestatement`                                                                                                                       | 生成诚信责任书和授权声明           | 通常保留。                                                                                             |
| `\frontmatter`                                                                                                                         | 开始前置部分                       | 用于摘要、目录等，页码使用罗马数字。                                                                   |
| `\ZhAbstract{正文}{关键词}`                                                                                                            | 中文摘要和中文关键词               | 中文摘要通常 300--400 字；关键词建议 3--8 个。                                                         |
| `\EnAbstract{body}{keywords}`                                                                                                          | 英文摘要和英文关键词               | 内容应与中文摘要一致。                                                                                 |
| `\customcontent`                                                                                                                       | 生成目录、图目录、表目录           | 修改标题、图表或引用后需重新编译。                                                                     |
| `\mainmatter`                                                                                                                          | 开始正文部分                       | 正文页码从阿拉伯数字开始。                                                                             |
| `\chapter`、`\section`、`\subsection`                                                                                              | 正文章节层级                       | 正式论文建议最多使用到 `\subsection`。                                                               |
| `figure`、`table`、`longtable`                                                                                                     | 图片、普通表格、跨页长表           | 示例可按需复制；图片放在 `figures/` 目录。                                                           |
| `equation`、`aligned`                                                                                                                | 单行公式和多行公式                 | 用 `\label{}` 设置标签，用 `\eqref{}` 引用。                                                       |
| `algorithm`、`algorithmic`                                                                                                           | 伪代码                             | 不涉及算法时可删除相关示例。                                                                           |
| `lstlisting`                                                                                                                           | 代码块                             | 较长代码建议放入附录。                                                                                 |
| `\newupcite{key}`、`\cite{key}`                                                                                                      | 文献引用                           | `\newupcite` 为上标引用，`\cite` 为普通引用。                                                      |
| `\backmatter`                                                                                                                          | 开始后置部分                       | 用于参考文献、附录、致谢、成绩页等。                                                                   |
| `\bibdatabase{bib/template}`、`\printbib`                                                                                            | 指定并打印参考文献                 | BibTeX 条目写在 `bib/template.bib`。                                                                 |
| `\Appendix`                                                                                                                            | 生成附录页                         | 没有附录时可删除这一段。                                                                               |
| `\Thanks`                                                                                                                              | 生成致谢页                         | 在其后填写致谢正文。                                                                                   |
| `\Grade`、`\OutstandingGrade`                                                                                                        | 生成毕业论文成绩表                 | 默认使用 `\Grade`；优秀论文推优答辩后如需推优成绩表，可改用 `\OutstandingGrade`。                  |

签名和日期可在打印后手签，也可以在命令中插入图片：

```tex
\mysignature{}
\mytime{}
\teachersignature{}
\teachertime{}
```

## 注意事项

- 中文摘要按学校规范通常以 300--400 字为宜。
- 目录、图目录和表目录由 `\customcontent` 生成。
- 本模板当前以 `LZUThesis_xb.cls` 为类文件名，示例中使用 `\documentclass[AutoFakeBold]{LZUThesis_xb}`。
- 正式论文建议标题层级最多使用到 `\subsection`，避免使用更深层级标题造成目录和编号格式风险。
- 封面默认使用 `figures/lzu2020.pdf`；正文示例使用 `figures/lzu2020.png` 和 `figures/lzu2007.png`。
- 不建议将个人签名图片、成绩、真实学号、手机号等隐私信息提交到公开仓库。
- 不建议上传字体文件；`.gitignore` 已忽略 `fonts/*.ttf`、`fonts/*.ttc` 和 `fonts/*.otf`，但通过网页手动上传时仍需自行检查。
- 不建议上传与模板无关的论文实验图、草稿图或本地占位图。
- 不建议提交 TeX 编译中间文件，例如 `.aux`、`.log`、`.bbl`、`.toc`、`.synctex.gz` 等。

## 贡献与反馈

欢迎各位兰大学长学姐、同学和后来维护者继续修改、完善并提交合并请求。尤其欢迎：

- 对照学校或学院最新通知修正格式细节。
- 补充不同学院的使用经验和常见问题。
- 改进参考文献样式、字体兼容性、Overleaf 使用说明或编译流程。
- 报告无法编译、页面错位、字段含义不清等问题。

提交修改时，建议附上对应的学校或学院通知链接、最小示例和编译结果。若继续发布或二次维护本模板，请保留前辈贡献与致谢说明。
