\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt,a4paper,authortitle]{mwart}
\usepackage[OT4]{polski}
\usepackage{url}

\makeatletter

\newcommand\svnurlfield{SVN}

\let\@svnurl\@empty
\newcommand{\svnurl}[1]{
  \DeclareRobustCommand{\@svnurl}{\svnurlfield: \url{#1}}
}
\newcommand\@typesetsvnurl{%
  \ifx\@svnurl\@empty
  \else
    \footnote{\@svnurl}
  \fi
}

\newcommand\@typesettitle{{\LARGE \@title\@typesetsvnurl \par}}

\renewcommand{\@maketitle}{%
  \newpage
  \null
  
  \vskip 6\baselineskip
  \begin{center}%
  \let \footnote \thanks
    \large
  \@typesettitle%
  \end{center}%
  \par
  \vskip 1\baselineskip
  }