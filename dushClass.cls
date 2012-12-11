%% Document Class Dush Rapport
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dushClass}
  [2011/07/27 v1.0 Classe latex -- by Dush]

%% Déclarations des options
\newif\if@smPt \@smPtfalse
\newif\if@iso \@isofalse
\newif\if@algo \@algofalse
\newif\if@smallTitle \@smallTitlefalse
\newif\if@enib \@enibtrue
\newif\if@vertanis \@vertanisfalse
\newif\if@color \@colortrue
\newif\if@footerAuthor \@footerAuthortrue

\DeclareOption{10pt}{\@smPttrue}
\DeclareOption{iso}{\@isotrue}
\DeclareOption{algo}{\@algotrue}
\DeclareOption{small}{\@smallTitletrue}	% Réduit au minimum la page de garde
\DeclareOption{nocolor}{\@colorfalse}
\DeclareOption{noauthor}{\@footerAuthorfalse}
\DeclareOption*{}
\ProcessOptions
 
%% Variables suplémentaires possibles
\def\logo#1{\def\@logo{#1}}
\def\company#1{\def\@company{#1}}
\def\subtitle#1{\def\@subtitle{#1}}
\def\group#1{\def\@group{#1}}

%% Initialisation par défaut des variables
\newif\if@andtitre \@andtitrefalse	% Pour la commande \and de author

\title{Mon titre}
\author{\name{Thomas}{Duchatelle}}
\subtitle{}
\group{}
\logo{}
\company{}


%% Chargement des package de bases
\if@smPt \LoadClass[10pt]{article}
\else \LoadClass[11pt]{article} \fi

\usepackage[paper=a4paper,textwidth=170mm]{geometry}

\usepackage{fancyhdr}
%\usepackage{placeins}
\usepackage[francais]{babel}

\makeatletter
	\if@iso
	\usepackage[latin1]{inputenc}
	\else
	\usepackage[utf8]{inputenc}
	\fi
\makeatother

\usepackage{graphicx}
\usepackage{amsmath}
\usepackage[french]{varioref}
%\usepackage{supertabular}
\usepackage{float}
\usepackage{color}
\usepackage{fancyhdr}
\usepackage{titlesec}
\usepackage{titletoc}
\usepackage{xspace}
\usepackage{ifthen}
%\usepackage{soul}

%\setcounter{secnumdepth}{3}	%% Numérotation jusqu'à subsubsection 

%% Pour le code
\makeatletter
\if@algo
	\usepackage{listings}
	\lstset{language=Java, numbers=left, tabsize=2, frame=single, breaklines=true,  numberstyle=\tiny\ttfamily,basicstyle=\small, framexleftmargin=13mm, backgroundcolor=\color{fontcolor}, xleftmargin=12mm }
	\fi
\makeatother


%% A garder en dernier 
\usepackage[pdfborder = {0 0 0}]{hyperref}
\usepackage{remreset} 
\makeatletter 
	\@addtoreset{section}{part} %% Reset des section au changement de partie
\makeatother	


%% Haut et pied de page 
\pagestyle{fancy}
\graphicspath{{figures/}}
%% \renewcommand{\sectionmark}[1]{\markboth{#1}{}}
%% \renewcommand{\subsectionmark}[1]{\markright{#1}}

\fancyhead{} % clear all header fields

\fancyfoot{} % clear all footer fields
\makeatletter
	\if@twoside
		\fancyhead[LE]{\@title}
		\fancyhead[RE]{\@subtitle}
	\else
		\fancyhead[LO]{\@title ~-- \@subtitle}
	\fi
 \if@smallTitle
%% 	\fancyhead[RO]{\@author}
 \else
	\fancyhead[RO]{\slshape\leftmark}
 \fi
 \if@footerAuthor
	\fancyfoot[CO,CE]{\@author}
 \fi
\fancyfoot[LE,RO]{\thepage}

\fancyfoot[LO,RE]{\bfseries\@company}

\makeatother

%% 

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %      Paramètres réglables          %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength{\larg}
\setlength{\larg}{16cm}
\newlength{\vCentre}
\setlength{\vCentre}{8cm}
\newlength{\indentSubSection}
\setlength{\indentSubSection}{3cm}

% L'utilisateur peut les redéfinir ceux-ci «\renewcommand» si besoin :

\makeatletter
\if@color
	\definecolor{primarycolor}{rgb}{0,0,0.5}	%niceblue
	\definecolor{primarydegcolor}{rgb}{0.1,0.1,1}	%degrade
	\definecolor{secondarycolor}{rgb}{1,0.4,0}
	\definecolor{fontcolor}{rgb}{0.92,0.92,0.99}
	\definecolor{cadrecolor}{rgb}{0,0,0}
	
	% Couleur capgémini
	\definecolor{colorcap}{rgb}{0,0.32,0.6}
	\definecolor{colorgemini}{rgb}{0,0.55,0.75}
\else
	\definecolor{primarycolor}{rgb}{0,0,0}
	\definecolor{primarydegcolor}{rgb}{0,0,0}
	\definecolor{secondarycolor}{rgb}{0,0,0}
	\definecolor{fontcolor}{rgb}{0.9,0.9,0.9}
	\definecolor{cadrecolor}{rgb}{0,0,0}
	\definecolor{red}{rgb}{0,0,0}
	
	% Couleur capgémini
	\definecolor{colorcap}{rgb}{0,0,0}
	\definecolor{colorgemini}{rgb}{0,0,0}
\fi
\makeatother

   %%%%%%%%%%%%%%%%%%%%%%%%%
   %%     RACCOUCIS       %%
   %%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\enib}[0] {E.N.I.B.}
\newcommand{\Enib}[0] {Ecole Nationale d'Ing\'enieurs de Brest}

\newcommand{\Cap}[0]{\textcolor{colorcap}{Cap}\textcolor{colorgemini}{g\'emini}}

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %     Macros pratiques       %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\er{{\scriptsize$^{\hbox{er}}$}\xspace}
\def\ere{{\scriptsize$^{\hbox{\`ere}}$}\xspace}
\def\eme{{\scriptsize$^{\hbox{\`eme}}$}\xspace}
\def\rd{{\scriptsize$^{\hbox{rd}}$}\xspace}
\def\st{{\scriptsize$^{\hbox{st}}$}\xspace}

\newcommand\name[2]{#1 \textsc{#2}\xspace}

\newcommand{\markref}[1] {$^{hbox{\ref{#1}}}}%$	% Pour référence coisée

% Gestion des encadrés
\newcommand\encadre[2]{		%% 1 : Titre de l'encadré ; 2 : contenu
\colorencadre{#1}{#2}{primarycolor}
}
\newcommand\colorencadre[3]{		%% 1 : Titre de l'encadré ; 2 : contenu ; 3 : couleur
\noindent
	\fcolorbox{secondarycolor}{fontcolor}{
		\begin{minipage}{\textwidth}
			\textcolor{#3}{\bfseries #1 : }
			#2
		\end{minipage}
	}
}

\definecolor{astucecolor}{rgb}{0.1,0.6,0.34}

\newcommand\technique[1]{
	\encadre{Détail technique} {#1}\\~\\
}
\newcommand\astuce[1]{	
	\colorencadre{Astuce} {#1} {astucecolor}\\~\\
}
\newcommand\rem[1]{	
	\colorencadre{Remarque} {#1} {primarycolor}\\~\\
}
\newcommand\alert[1]{	
	\colorencadre{Attention} {#1} {red}\\~\\
}

\newcommand\refmark[1]{{\scriptsize$^{\hbox{\ref{#1}}}$\xspace}}

% Listes / description
%\newenvironment{maliste}%
%{ \begin{list}%
%	{$\bullet$}%
%	{\setlength{\labelwidth}{30pt}%
%	 \setlength{\leftmargin}{35pt}%
%	 \setlength{\itemsep}{\parsep}}}%
%{ \end{list} }



	%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% 		PRESENTATION	 %%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Sommaire

    \newlength{\ajustementchapter}
    \newlength{\ajustementsection}

    % lignes à changer pour ajustement la taille des numéros
    \setlength{\ajustementchapter}{0em}
    \setlength{\ajustementsection}{1em}

    \titlecontents{chapter}%
      [\dimexpr 1em+\ajustementchapter]
      {\vspace{1em}\bfseries}
      {\contentslabel{\dimexpr 1.3em+\ajustementchapter}}
      {\hspace{\dimexpr -1.3em-\ajustementchapter}}
      {\hfill\contentspage}

    \titlecontents{section}%
      [\dimexpr 1.5em+\ajustementsection]
      {\vspace{1em}\bfseries}
      {\contentslabel{\dimexpr 1.3em+\ajustementsection}}
      {\hspace{\dimexpr -1.3em-\ajustementsection}}
      {\hfill\contentspage}
      
      
\dottedcontents{subsection}%
  [\dimexpr 4em+\ajustementsection]
  {}
  {\dimexpr 1em+\ajustementsection}
  {0.75em}

\dottedcontents{subsubsection}%
  [\dimexpr 6em+\ajustementsection]
  {}
  {\dimexpr 1em+\ajustementsection}
  {0.75em}


%% Headers
\makeatletter
\if@smallTitle
	\newcommand\fullheader[0]
	{
		\pagestyle{empty}
		\maketitle
		\tableofcontents
		\cleardoublepage
		\pagestyle{fancy}
	}
\else
	\newcommand\fullheader[0]
	{
		\pagestyle{empty}
		\maketitle
		\cleardoublepage

		\tableofcontents
		\cleardoublepage
		\pagestyle{fancy}
	}
\fi

\AtBeginDocument{
  \fullheader
}

\renewcommand\and{\if@andtitre \\\else et \fi}
\makeatother

\newcommand\headerPerso[2] {
\begin{flushleft}
	\begin{minipage}{6cm}
		\ifthenelse{\equal{#1}{}}% It does NOT work
		{~}
		{\includegraphics[height=2cm]{#1}}
	\end{minipage}
	\begin{minipage}{10cm}
		\begin{flushright}
			\Large #2%
		\end{flushright}
	\end{minipage}
\end{flushleft}
{
	\rule{18cm}{0.1mm}}
}

\makeatletter

%% Définition de la page de garde 
\def\maketitle{%
\if@smallTitle
  \headerPerso{\@logo}{\@andtitretrue\@author\and\@date\@andtitrefalse}	%\and\@group
  \vskip 0.5cm
  \begin{center}
  {\LARGE\bfseries\center\textcolor{primarycolor}{\@title}}
  {\large\bfseries\center-- \textcolor{primarydegcolor}{\@subtitle} ~--}
  %  \@title  
  \end{center}
  \vskip 0.5cm
\else
  \null
  \thispagestyle{empty}%
  \headerPerso{\@logo}{\LARGE\bfseries\@company}
  \vfill
  \begin{center}\leavevmode
   \normalfont
   	 \vskip -4cm
		%{\rule{\larg}{1mm}}
		{\color{secondarycolor}{\rule{\larg}{0.5mm}}}
		{\sc\Huge\textcolor{primarycolor}{\@title}\par}	%%\textbf
		\vskip 7mm
		{\Large \textcolor{primarydegcolor}{\@subtitle}\par}
		%{\rule{\larg}{1mm}}
		{\color{secondarycolor}{\rule{\larg}{0.5mm}}}
		\vskip 7mm
  \end{center}%
  \begin{flushright}
%  		{\Large \@date\par}%
  		{\Large \@andtitretrue\textcolor{primarycolor}{\@author\and\@group}\@andtitrefalse\par}%
  \end{flushright}
  \vfill
  \begin{center}
  		\textcolor{black}{\Large \@date}
  \end{center}
  \null
  \cleardoublepage
\fi
}


%% Définition des titres

\if@smallTitle
	\titleformat{\section}
			{\reset@font\Large\raggedright\scshape\mdseries\rmfamily\color{primarycolor}}
			{\hspace{2ex}\thesection ~-}{1ex}{~~}[\vspace{-2.5ex}{\hspace{0ex}\rule{15cm}{0.1mm}}]
		\titlespacing{\section}{0ex}{0ex}{4ex}
	\titlespacing{\section}{0ex}{6ex}{1.8ex}
	%\renewcommand{\section}{\@startsection {section}{2}{\z@}%
	%	{-5.0ex \@plus -1ex \@minus -.2ex }%
	%	{3.5ex \@plus.2ex}%
	%	{\ \ \ \ \reset@font\large\underline}}
	\renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}%
		{-2.5ex \@plus -1ex \@minus -.2ex }%
		{2.0ex \@plus.2ex}%
		{\hspace{4ex}\reset@font\color{primarydegcolor}\large\bfseries\underline}}
	\renewcommand\subsubsection{\@startsection {subsubsection}{3}{\z@}%
		{-1.5ex }%
		{1ex}%
		{\hspace{8ex}\reset@font\color{secondarycolor}\bfseries}}
\else
	%\renewcommand{\section}{\@startsection {section}{1}{\z@}%
	%	{-3.5ex \@plus -1ex \@minus -.2ex }%
	%	{8ex \@plus.2ex}%
	%	{ \cleardoublepage\reset@font\LARGE\bfseries\center}} %\cleardoublepage %\FloatBarrier n'existe plus ..
	\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
		{-7ex}%
		{2.5ex \@plus.2ex}%
		{\hspace{4ex}\reset@font\color{primarydegcolor}\Large\bfseries\underline}}
	\renewcommand\subsubsection{\@startsection {subsubsection}{3}{\z@}%
		{-1.5ex }%
		{1ex}%
		{\hspace{6ex}\reset@font\color{secondarycolor}\large \bfseries}}
	
	\newcommand{\sectionbreak}{\cleardoublepage}
	\titleformat{\section}
		{\reset@font\LARGE\raggedright\scshape\mdseries\rmfamily\color{primarycolor}}
		{\hspace{2ex}\thesection ~-}{1ex}{~~}[\vspace{-2.5ex}{\hspace{0ex}\rule{15cm}{0.1mm}}]
	\titlespacing{\section}{0ex}{0ex}{4ex}
\fi
	

\makeatother

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\alph{subsubsection}.}

%% Définition des sauts de pages
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}

\let\cleardoublepage\clearemptydoublepage


