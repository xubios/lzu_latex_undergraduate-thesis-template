\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LZUThesis_xb_overleaf}[2026/06/08 Overleaf-friendly wrapper for LZUThesis_xb]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{LZUThesis_xb}}
\ProcessOptions\relax
\PassOptionsToClass{overleaf}{LZUThesis_xb}
\LoadClass{LZUThesis_xb}

\endinput
