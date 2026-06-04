# 兰州大学本科毕业论文（设计）LaTeX 模板

这是一个面向兰州大学本科毕业论文（设计）的 XeLaTeX 模板。当前主类文件为 `LZUThesis_xb.cls`，示例入口为 `template.tex`。

> 说明：本模板不是兰州大学官方发布模板。提交前请以学院和教务处当年最终通知为准。

## 前辈贡献与致谢

本模板不是从零开始完成的。当前版本建立在多位前辈长期积累的基础上：

- 早期模板工作参考了 2013 级核科学与技术学院胡斌、沈周等同学的本科论文 LaTeX 模板实践。
- 后续模板工作参考了 2016 级物理科学与技术学院余航等同学对兰州大学本科论文排版要求的整理与实现。
- 模板中部分结构也参考了公开社区中的 LZUThesis 系列项目，例如 `suchot/LZUThesis2017`、`yuhldr/LZUThesis2020` 等。
- 特别感谢 Overleaf 上 `xiashj2021` 学长维护和分享的兰州大学本科生毕业论文模板，其示例内容和使用说明为本模板整理提供了重要参考。
- 参考文献样式与中文文献支持吸收了社区同学的实践经验，特别感谢曾对中文参考文献条目处理提供代码和建议的贡献者。
- 当前 `LZUThesis_xb.cls` 在上述基础上进一步整理了 2026 届本科毕业论文（设计）格式要求，修正了封面、题目换行、摘要、目录、标题英文、页眉页码、图表目录、参考文献、致谢和成绩表等细节，使其更接近当前兰州大学本科论文写作规范。

如果继续发布或二次修改本模板，请保留这些贡献说明。

## 目录结构

```text
.
├── LZUThesis_xb.cls
├── template.tex
├── bib/
│   ├── lzubib.bst
│   └── template.bib
├── figures/
│   ├── lzu2020.pdf      # 封面校徽，类文件默认使用
│   ├── lzu2020.png      # 正文示例图片
│   └── lzu2007.png      # 正文并列图片示例
└── fonts/
    └── README.md
```

## 编译环境

推荐使用 TeX Live 2024 或更新版本，并使用 XeLaTeX 编译。

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

模板默认从 `fonts/` 目录加载宋体、黑体、仿宋和 Arial Bold 等字体，以便在不同机器上获得更稳定的排版效果。需要准备的文件名为 `SimSun.ttc`、`SimHei.ttf`、`SimFang.ttf` 和 `Arialbd.ttf`。

由于这些字体通常涉及商业授权，公开 GitHub 仓库中不建议直接上传字体文件。请使用者在本机合法拥有字体的前提下，自行将字体文件放入 `fonts/` 目录。详见 [fonts/README.md](fonts/README.md)。

## 使用方法

1. 将合法获得的字体文件放入 `fonts/` 目录。
2. 修改 `template.tex` 中的题目、作者、学院、专业、年级和导师信息。
3. 在 `\ZhAbstract{...}{...}` 和 `\EnAbstract{...}{...}` 中填写中英文摘要与关键词。
4. 在 `\mainmatter` 后写正文。
5. 在 `bib/template.bib` 中维护参考文献，并用 `\newupcite{key}` 或 `\cite{key}` 引用。
6. 在 `\Thanks` 后填写致谢。
7. 如需成绩表，保留 `\Grade`；如学院不要求电子版成绩表，可按实际要求删除或注释。

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
| `\outstandingcommitteesignature`、`\outstandingcommitteecomment`                                                               | 优秀论文推优成绩页相关字段         | 启用 `\OutstandingGrade` 时填写；常规成绩页无需使用。                                                |
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
| `\Grade`、`\OutstandingGrade`                                                                                                           | 生成毕业论文成绩表                 | 默认使用 `\Grade`；优秀论文推优答辩后如需推优成绩表，可改用 `\OutstandingGrade`。                    |

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
