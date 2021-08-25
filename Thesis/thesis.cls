\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt,a4paper,authortitle]{mwart}
\usepackage[OT4]{polski}
\usepackage{url}

\makeatletter

\newcommand\svnurlfield{SVN}
\newcommand\promotorfield{Promotor}

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

\newcommand{\pretitle}{
  \DeclareRobustCommand{\@pretitle}
}

\newcommand{\promotor}{
  \DeclareRobustCommand{\@promotor}
}

\newcommand{\department}{
  \DeclareRobustCommand{\@department}
}

\newcommand{\examdate}{
  \DeclareRobustCommand{\@examdate}
}

\newcommand\@typesettitle{{\LARGE \@title\@typesetsvnurl \par}}
\newcommand\@typesetpretitle{{\@pretitle \par}}
\newcommand\@typesetauthor{{\LARGE \@author \par}}
\newcommand\@typesetdepartment{{\@department \par}}
\newcommand\@typesetpromotor{{\promotorfield : \par \@promotor \par}}
\newcommand\@typesetexamdate{{\@examdate \par}}

\renewcommand{\@maketitle}{%
  \newpage
  \null
  \includegraphics[scale=1.2]{ftims_full_logo}


  \vskip 5\baselineskip
  \begin{center}%
  \let \footnote \thanks
    \large
  \@typesetpretitle%
  \vskip 1\baselineskip
  \@typesettitle%
  \vskip 4\baselineskip
  \@typesetauthor%
 % \vskip 1\baselineskip
 % \includegraphics[scale=0.20]{ftims}
 % \par
 % \@typesetdepartment%
 % \end{center}%

  \begin{flushright}%
  \vskip 6\baselineskip
  \@typesetpromotor%
  \end{flushright}%
  
  \begin{center}%
  \vskip 5\baselineskip
  \@typesetexamdate%
  \end{center}%

  \par
  \vskip 1\baselineskip
  }