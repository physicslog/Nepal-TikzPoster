\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nptikzposter}[19.09.2025: Customised tikzposter class by Damodar Rajbhandari. Named as Nepal's TikzPoster]
% more info at https://ctan.mirrors.hoobly.com/graphics/pgf/contrib/tikzposter/tikzposter.pdf
% or at https://bitbucket.org/surmann/tikzposter/wiki/Home

% Load base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax
\LoadClass{tikzposter}

\renewcommand{\familydefault}{\sfdefault} % to beamer default font: sans-serif

\usetheme{Desert}

% --- Packages ---
\RequirePackage{xcolor}

% --- Colors using xcolor package ---
% using xcolor
\definecolor{npblue}{HTML}{303291} % Blue based upon Nepal's flag
\definecolor{npred}{HTML}{eb1d25} % Red based upon Nepal's flag
\definecolor{npblack}{HTML}{231f20} % Black

\defineblockstyle{npSlide}{
titlewidthscale=1, bodywidthscale=1, titleleft,
titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0pt, bodyoffsety=0pt,
bodyverticalshift=0pt, roundedcorners=0, linewidth=0pt, titleinnersep=1cm,
bodyinnersep=1cm
}{
    \ifBlockHasTitle%
        \draw[draw=none, left color=npblue, right color=npred](blocktitle.south west) rectangle (blocktitle.north east);
    \fi%
    \draw[draw=none, fill=blockbodybgcolor] %
    (blockbody.north west) [rounded corners=30] -- (blockbody.south west) --
    (blockbody.south east) [rounded corners=0]-- (blockbody.north east) -- cycle;
}

\useblockstyle{npSlide}

% Title color gradient
\definecolor{titlebgcolor}{named}{npred} % Red based upon Nepal's flag
\definecolor{framecolor}{named}{npblue}

% Placing the logo on the title page to the right
\makeatletter
\renewcommand\TP@maketitle{%
   \centering
   \begin{minipage}[b]{0.8\linewidth}
        \centering
        \color{titlefgcolor}
        {\bfseries \Huge \sc \@title \par}
        \vspace*{1em}
        {\huge \@author \par}
        \vspace*{1em}
        {\LARGE \@institute}
    \end{minipage}%
      \tikz[remember picture,overlay]\node[scale=0.8,anchor=east,xshift=0.56\linewidth,yshift=3.9cm,inner sep=0pt] {%
       \@titlegraphic
    };
}
\makeatother

% Numbering batch
\newcommand{\badge}[1]{\tikz[baseline=-0.7ex]{\node[draw, circle, inner sep=6pt, text=white] {#1};} \hspace{0.2cm}}

% Removed default tikzposter copyright info
\tikzposterlatexaffectionproofoff

% Removing the footer rectangle in Desert theme
\usebackgroundstyle{Default}
