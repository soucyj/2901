\ProvidesClass{Preparation}
\LoadClass[oneside]{book}
\RequirePackage{polyglossia}
	\setdefaultlanguage{french}
\RequirePackage{mathtools}
\RequirePackage[%math-style=ISO,
    			bold-style=ISO,
				partial=upright,
    			warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
    \RequirePackage{fontspec}
	\setmainfont{Libertinus Serif}
	\setsansfont{LibertinusSans-Regular.otf}
	\setmathfont{Latin Modern Math}
	\setmathfont[range=\setminus]{STIX Two Math}

\RequirePackage{geometry}
\RequirePackage{cmupint}
\RequirePackage{xcolor}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{tikz}
\RequirePackage{xfrac}
\RequirePackage{enumitem}

\RequirePackage{fix-cm} % Fixes warnings about missing fonts; see http://tex.stackexchange.com/questions/32378/xfrac-siunitx-gives-me-a-font-warning

\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    linkcolor={orange},
    citecolor={blue!50!black},
    urlcolor={blue!80!black}
}

\newlist{parts}{enumerate}{1}
\setlist[parts]{label=(\alph*), before=\let\part\item}

\newcommand{\partnewline}{~\\
							\vspace{-0.5cm}}

\RequirePackage{amsthm}
	\RequirePackage{titlesec}
\RequirePackage{titletoc}

\RequirePackage[many]{tcolorbox}
%\RequirePackage[width=14cm,textheight=16cm,left=5cm, top=3cm, headsep=2cm]{geometry}

% \newlength\ChapWd
% \settowidth\ChapWd{\Huge\chaptertitlename}
% %
% \definecolor{myblue}{RGB}{0,0,122}
%
\addto\captionsfrench{\renewcommand{\contentsname}{\sffamily Contenu}}%

\makeatletter
\let\oldl@chapter\l@chapter
\def\l@chapter#1#2{\oldl@chapter{#1}{\textcolor{red}{\itshape#2}}}

\let\old@dottedcontentsline\@dottedtocline
\def\@dottedtocline#1#2#3#4#5{%
	\old@dottedcontentsline{#1}{#2}{#3}{#4}{{{\sffamily#5}}}}
%
\RequirePackage{silence}
\WarningsOff[everypage]% Suppress warnings related to package everypage

\RequirePackage[some]{background}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section où sont définis les éléments nécessaires à la gestion des questions
% et de leur solution.
\RequirePackage{environ}
\RequirePackage{answers}
	\newtheorem{Exc}{Question}[] % Le compteur depend du chapitre
	\newenvironment{question}{\begin{Exc}\normalfont}{\end{Exc}}
	\Newassociation{reponse}{Reponse}{solutions}
	\Newassociation{titrechap}{TitreChap}{solutions}
	
	
\RequirePackage{enumitem}
	\newlist{sqliste}{enumerate}{10}
	\setlist[sqliste]{label*=(\alph*)}
	\NewEnviron{sq}{~\\[-0.5cm]\begin{sqliste}\BODY\end{sqliste}}
	\renewcommand{\Reponselabel}[1]{\bf{Question #1.}}
	\renewcommand{\TitreChaplabel}[1]{}

\Opensolutionfile{solutions}

%\definecolor{titlepagecolor}{cmyk}{0,.0,0,.70}
\definecolor{titlepagecolor}{cmyk}{0,.0,0,.6}
\backgroundsetup{
scale=1,
angle=0,
opacity=1,
contents={\begin{tikzpicture}[remember picture,overlay]
 \path [fill=orange] (-0.5\paperwidth,4) rectangle (0.5\paperwidth,18);
 \node (myfirstpic) at (-0.30\paperwidth,11.5) {\includegraphics[width=5cm]{logo.png}};
 \node[color=black,right] (faculte) at (-0.415\paperwidth,9.7) {\small\textsf{Facult\'e des sciences et de g\'enie}};
 \node[color=black,right] (dep) at (-0.415\paperwidth,9.2) {\small\textbf{\textsf{D\'epartement de math\'ematiques et de statistique}}};
\end{tikzpicture}}
}

\usetikzlibrary{shapes.misc}
\newcommand\sectionbar{%
\tikz[baseline,trim left=1.1cm,trim right=1cm] {
    \fill [orange] (0cm,-1ex) rectangle (\textwidth+1.1cm,2.5ex);
    \node [
    	circle, draw=orange, thick, inner sep=0pt,
        xshift=-1.5cm,
        fill=white,
        minimum height=4ex,
        anchor= base east,
        ] at (2cm,0) {
        \textsf{\color{orange}\thesection}
    };
}%
}

\newcommand\subsectionbar{%
\tikz[baseline,trim left=1.1cm,trim right=1cm] {
    \fill [orange] (0cm,-1ex) rectangle (\textwidth+1.1cm,2.5ex);
    \node [
    	circle, draw=orange, thick, inner sep=0pt,
        xshift=-1.5cm,
        fill=white,
        minimum height=3.5ex,
        anchor= base east,
        ] at (2cm,0) {
        \textsf{\color{orange}\thesubsection}
    };
}%
}

\renewcommand\thesection{\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\titleformat{\section}{\Large\sf}{\sectionbar}{0.1cm}{}
\titleformat{\subsection}{\large\sf}{\subsectionbar}{0.1cm}{}

\RequirePackage[font=sf]{caption}
	\captionsetup{
		justification=raggedright,
		labelfont={color=black,bf,sf,small},
		font={small,color=black}
	}

\newcommand{\imagem}[2]{
\marginpar{
	\begin{center}
	\includegraphics[width=4.5cm]{images/#1}\\
	\captionof{figure}{#2}
	\end{center}
}
}
\newcommand{\tkzm}[2]{
	\marginpar{
		\begin{center}
		#1
		\captionof{figure}{#2}
		\end{center}
	}
}

\newcommand{\pagecouverture}{
\begin{titlepage}
	\BgThispage
\newgeometry{left=1cm,right=1cm,bottom=2cm}
\vspace*{0.15\textheight}
\hspace{0.4cm}\textcolor{black}{\Huge\textbf{\textsf{\titre}}}\\[0.2cm]
{\color{black}\Large \hspace{1cm}\textbf{\textsf{\soustitre}}}\\[0.2cm]
{\color{black}\large \hspace{1cm}\textsf{par \auteur}}
\vfill\par
\noindent
\hspace{2cm}
\begin{minipage}{0.65\linewidth}
\vspace{5pt}
    \sffamily\tableofcontents
    \thispagestyle{empty}
\end{minipage}
\vfill
\end{titlepage}
\restoregeometry
\setlength\marginparwidth{4.5cm}
\setlength\marginparsep{0.7cm}
}