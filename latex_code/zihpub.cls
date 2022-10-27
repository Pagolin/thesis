%%
%% ZIH Style-File fuer ZIH Publikationen
%%
%% Autor: Guido Juckeland (guido.juckeland@tu-dresden.de)
%% Datum: Aug 14, 2012
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zihpub}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load packages

% Font-Codierung setzen
\RequirePackage[T1]{fontenc}

% Schriftart setzen
\RequirePackage{times}

% Bilder einbinden
\RequirePackage{graphicx}

% URL's zulassen
\RequirePackage{url}

% schoene Listings
\RequirePackage{fancyvrb}

% Mathe-krempel laden
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

% farbe fuer correctme
\RequirePackage{color}

% enumerates mit benutzerdefinierten labels
\RequirePackage{enumerate}

% besseres 1.5 zeilig
\RequirePackage{setspace}

% code beispiele
%\RequirePackage{listings}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Provide Options

% Diplom Inf-Vorlage
\newif\if@diplominf
\@diplominffalse
\DeclareOption{diplominf}{%
  \@diplominftrue
}


% keine Aufgabenstellung
\newif\if@kurz
\@kurzfalse
\DeclareOption{kurz}{%
  \@kurztrue%
}%

% fuer die Frauen das "in" am Titel
\newif\if@female
\@femalefalse
\DeclareOption{female}{%
  \@femaletrue
}

\def\@faculty{Informatik}
\def\@doctype{Diplomarbeit}

% References numbered not alpha
\newif\if@bibnum
\@bibnumfalse
\DeclareOption{bibnum}{\@bibnumtrue}

% Abbildungsverzeichnis
\newif\if@lof
\@loffalse
\DeclareOption{lof}{\@loftrue}

% Tabellenverzeichnis
\newif\if@lot
\@lotfalse
\DeclareOption{lot}{\@lottrue}


% Hyperref
\newif\if@hyperref
\@hyperreffalse
\DeclareOption{hyperref}{%
  \@hyperreftrue
}

% Nomenclature
\newif\if@nomencl
\@nomenclfalse
\DeclareOption{nomencl}{%
  \@nomencltrue
}

%utf8-Zeichenkodierung
\newif\if@utf
\@utffalse
\DeclareOption{utf8}{
  \@utftrue
}


%german-Option verarbeiten
\newif\if@german
\@germanfalse
\DeclareOption{german}{%
  \@germantrue%
}%

% formatierung fuer zih-report
\newif\if@final
\@finalfalse
\DeclareOption{final}{%
  \@finaltrue%
}%

% kein Inhaltsverzeichnis
\newif\if@notoc
\@notocfalse
\DeclareOption{notoc}{%
  \@notoctrue%
}%

% keine Aufgabenstellung
\newif\if@noproblem
\@noproblemfalse
\DeclareOption{noproblem}{%
  \@noproblemtrue%
}%

% keine Titelseite
\newif\if@notitlepage
\@notitlepagefalse
\DeclareOption{notitlepage}{%
  \@notitlepagetrue%
}%


% zweiseitig wenn nicht 'final'
\newif\if@twoside
\@twosidefalse
\DeclareOption{twoside}{%
  \@twosidetrue%
}%
\ProcessOptions


% umnutzung vorh. variablen
\newcommand\matno[1]{\def\@matno{#1}}
\newcommand\betreuer[1]{\def\@betreuer{#1}}
\newcommand\hsl[1]{\def\@hsl{#1}}
\newcommand\copyrighterklaerung[1]{\def\@copyrighterklaerung{#1}}
\newcommand\bibfiles[1]{\def\@bibfiles{#1}}
\newcommand\gutachter[1]{\def\@gutachter{#1}}
\newcommand\birthday[1]{\def\@birthdate{#1}}
\newcommand\placeofbirth[1]{\def\@birthplace{#1}}
\newcommand\acknowledgments[1]{\def\@acknowledgments{#1}}

%\newif\if@isreport \@isreportfalse \DeclareOption{isreport}{\@isreporttrue}
\def\@acknowledgments{}
\def\@isreport{}
\def\@isplain{}
\def\@isdiploma{}
\def\@bibfiles{}
\def\@copyrighterklaerung{}
\def\@abstractde{}
\def\@abstracten{}
\def\@hsl{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set document type

\if@diplominf
  \def\@isreport{1}
  \def\@isdiploma{1}
\fi
\ifx\@empty\@isreport
  \if@final
    \LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstract=true, numbers=noenddot, twoside,titlepage,headings=normal]{scrartcl}%
  \else
    \if@twoside
      \LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstract=true, numbers=noenddot, twoside,titlepage,headings=normal]{scrartcl}%
    \else
      \LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstract=true, numbers=noenddot, oneside,titlepage,headings=normal]{scrartcl}%
    \fi
  \fi
\else
  \if@final
    \LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstract=true, numbers=noenddot, twoside,titlepage,openright,headings=normal]{scrreprt}%
  \else
    \if@twoside
      \LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstract=true, numbers=noenddot, twoside,titlepage,openright,headings=normal]{scrreprt}%
    \else
      \LoadClass[cleardoublepage=empty, listof=totoc, bibliography=totoc, index=totoc, 11pt, abstract=true, numbers=noenddot, oneside,titlepage,openright,headings=normal]{scrreprt}%
    \fi
  \fi
\fi

% deckblatttitel, je nachdem, was fuer ein dokument erstellt werden soll

\newcommand{\titleheader}[0]{$\quad$}
\newcommand{\copyrightinfo}[0]{ }
\newcommand{\betreuerlabel}[0]{ }
\newcommand{\hsllabel}[0]{ }
\newcommand{\matnolabel}[0]{ }
\newcommand{\matnoclosing}[0]{ }
\newcommand{\birthstart}[0]{ }
\newcommand{\birthmiddle}[0]{ }
\newcommand{\birthclosing}[0]{ }


\if@female
 \def\@female{in}
\else
 \def\@female{}
\fi

%\ifx\@empty\@isdiploma


\if@diplominf%
\renewcommand{\titleheader}[0]{Diplomarbeit \\[1cm]\large zur Erlangung des akademischen Grades\\ Diplom-Informatiker\@female}
\def\@faculty{Informatik}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set page-layout

% Definition der Seitenraender
%\setlength{\hoffset}{-1in}
%\addtolength{\hoffset}{2cm}
%\setlength{\voffset}{-1in}
%\addtolength{\voffset}{2cm}
%\addtolength{\voffset}{-\baselineskip}
%\setlength{\topmargin}{0mm}
%\setlength{\headheight}{2.0\baselineskip}
%\setlength{\headsep}{\baselineskip}
\setlength{\textheight}{24.5cm}
\setlength{\textwidth}{16cm}
\setlength{\evensidemargin}{0mm}
\setlength{\oddsidemargin}{0mm}
%\setlength{\marginparsep}{0mm}
%\setlength{\marginparwidth}{0mm}
%\setlength{\marginparpush}{0mm}
%\setlength{\footskip}{\baselineskip}
\setlength{\parindent}{0mm}
%\setlength{\parskip}{2mm}
%\setlength{\partopsep}{0mm}
\renewcommand{\cleardoublepage}{\cleardoublestandardpage}
\def\@chapapp{}
% enhanced tables
\RequirePackage{tabularx}
\RequirePackage{longtable}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Option "german" bearbeiten

% Sprach-Dateien
\if@german%
  \RequirePackage[american,main=ngerman]{babel}
\else
  \RequirePackage[main=american,ngerman]{babel}
\fi


\if@german%
  \def\@copyrightlabel{Erkl\"{a}rungen zum Urheberrecht}
  \renewcommand\copyrightinfo[0]{%
    \cleardoublepage
    \ifx\@empty\@isreport
      \section*{\@copyrightlabel}
    \else
      \chapter*{\@copyrightlabel}
    \fi
    \@copyrighterklaerung}
  \ifx\@empty\@isplain
    \renewcommand{\betreuerlabel}[0]{Betreuer: }
    \renewcommand{\hsllabel}[0]{Hochschullehrer: }
    \renewcommand{\matnolabel}[0]{(Mat.-Nr.: }
    \renewcommand{\matnoclosing}[0]{)}
    \renewcommand{\birthstart}[0]{(Geboren am }
    \renewcommand{\birthmiddle}[0]{ in }
    \renewcommand{\birthclosing}[0]{)}
  \fi
\else
  \def\@copyrightlabel{Copyright Information}
  \renewcommand\copyrightinfo[0]{%
    \cleardoublepage
    \ifx\@empty\@isreport
    \section*{\@copyrightlabel}
  \else
    \chapter*{\@copyrightlabel}
  \fi
  \@copyrighterklaerung}
  \ifx\@empty\@isplain
    \renewcommand{\betreuerlabel}[0]{Supervisor: }
    \renewcommand{\hsllabel}[0]{Reviewer: }
    \renewcommand{\matnolabel}[0]{(Mat.-No.: }
    \renewcommand{\matnoclosing}[0]{)}
    \renewcommand{\birthstart}[0]{(Born }
    \renewcommand{\birthmiddle}[0]{ in }
    \renewcommand{\birthclosing}[0]{)}
  \fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Format der Eingabedateien; Standard: latin1
\if@utf
\RequirePackage[utf8]{inputenc}
\else
\RequirePackage[latin1]{inputenc}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hyperref laden, wenn gewuenscht
\if@hyperref
\RequirePackage{hyperref}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nomenclature laden
\if@nomencl
  \if@german
    \RequirePackage[german,intoc]{nomencl}
  \else
    \RequirePackage[intoc]{nomencl}
  \fi

  % Randbreite definieren
  \def\@nomenclmargin{3cm}
  \newcommand\setnomenclmargin[1]{\def\@nomenclmargin{#1}}

  % index erstellen
  \makenomenclature

\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Abstracts zusammenbauen
\newcommand{\abstractde}[1]{\def\@abstractde{#1}}
\newcommand{\abstracten}[1]{\def\@abstracten{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Gliederung und Numerierung
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% kopfzeile auch bei chapters
\ifx\@empty\@isreport
\else
\renewcommand*{\chapterpagestyle}{fancy}
\fi

% kopfzeile auch bei abstract
\let\@altab=\abstract
\let\end@altab=\endabstract
\renewenvironment{abstract}{%
\fancyfoot{}
\fancyhead{}
\if@final
  \fancyhead[LE,RO]{\thepage}
\else
  \if@twoside
    \fancyhead[LE,RO]{\thepage}
  \else
    \fancyhead[R]{\thepage}
  \fi
\fi
\begin{@altab}%
\thispagestyle{fancy}}{\end{@altab}%
\cleardoublepage
\ifx\@empty\@isreport
  \if@final
    \fancyhead[LO]{\@author}
    \fancyhead[RE]{\@title}
  \else
    \if@twoside
      \fancyhead[LO]{\@author}
      \fancyhead[RE]{\@title}
    \else
      \fancyhead[L]{\@author -- \@title}
    \fi
  \fi
\else
  \if@final
    \fancyhead[LO]{\rightmark}
    \fancyhead[RE]{\leftmark}
  \else
    \if@twoside
      \fancyhead[LO]{\rightmark}
      \fancyhead[RE]{\leftmark}
    \else
      \fancyhead[L]{\rightmark}
    \fi
  \fi
\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Institution fuer Titelseite
\if@german
	  \newcommand{\@institution}{
	    \begin{center}
	    %Institution an der die Arbeit geschrieben wurde
	    \huge
	    \textsc{Technische Universit\"{a}t Dresden}

	    \bigskip
	    \Large
	    \textsc{Fakult\"{a}t Informatik\\
	    Institut f\"{u}r Compilerbau}
	    \end{center}
	  }
\else
	  \newcommand{\@institution}{
	    \begin{center}
	    %Institution an der die Arbeit geschrieben wurde
	    \huge
	    \textsc{Technical University Dresden}

	    \bigskip
	    \Large
	    \textsc{Department of Computer Science\\
	    Institute of Computer Engineering\\
	    Chair for Compiler Construction}
	    \end{center}
	  }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Style fuer Bibliography
\if@bibnum
  \if@german
    \bibliographystyle{plaindin}
  \else
    \bibliographystyle{plain}
  \fi
\else
  \if@german
    \bibliographystyle{alphadin}
  \else
    \bibliographystyle{alpha}
  \fi
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% List of tables/figures hinzu falls gewuenscht
\if@lof
  \newcommand{\printlof}{\listoffigures}
\else
  \newcommand{\printlof}{ }
\fi
\if@lot
  \newcommand{\printlot}{\listoftables}
\else
  \newcommand{\printlot}{ }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% zeile unter dem autor zusammenstellen

    \ifx\@empty\@isplain
      \def\@subauthor{\matnolabel\@matno\matnoclosing}
    \else
      \def\@subauthor{$\quad$}
    \fi

  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Literatur-, Abbildungs- und Tabellenverzeichnis vor dem Anhang
\def\@haveapp{}
\let\@altapp=\appendix
\renewcommand{\appendix}[0]{\cleardoublestandardpage
\ifx\@empty\@bibfiles
\else
  \bibliography{\@bibfiles}
\fi
\cleardoublestandardpage
\printlof
\cleardoublestandardpage
\printlot
\cleardoublestandardpage
\@altapp
\def\@haveapp{1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kopfzeile
\RequirePackage{fancyhdr}

% Automatische Generierung des Dokumentgrundgeruests
	\let\@altdoc=\document
	\let\end@altdoc=\enddocument
	\renewenvironment{document}{%
	\begin{@altdoc}%
	%\thispagestyle{empty}
	%\pagestyle{empty}
	
	\begin{titlepage}
		 \thispagestyle{empty}

            \begin{tabular*}{160mm}[b]{p{160mm}@{\extracolsep\fill}}
          % TUD-Logo
            \hspace*{-19mm}\includegraphics[height=16.73mm]{logos/TU_Logo_SW}%  width=57mm
            \hfill\includegraphics[height=16.73mm]{logos/BI_Logo.pdf}%
            \\[3.75mm]
            \hline%
        \end{tabular*}\hspace{-160mm}%

	\hrule


	\begingroup\centering
	\vspace{1cm}
	{\Large\noindent \titleheader \par}
	\vspace{0.5cm}
	{\LARGE\noindent \textbf{Bricks of a Network Stack} \par}
	\vspace{0.5cm}

	{\LARGE\noindent Lisza Zeidler \par} 
    \endgroup
	\vspace{12cm}
		
	\hrule
	\vspace{0.3cm}
	


	\begin{table}[h!]
	    \begin{large}
			\begin{tabular}{p{0.2\textwidth}p{0.6\textwidth}}
				Advisor:    &  \textbf{Dr.-Ing.  Sebastian Ertel} \\
				1. Examiner:           & \textbf{Prof.  Dr.-Ing.  Jeronimo Castrillon} \\ 
				& Chair for Compiler Construction,\\
				& TU Dresden\\
			    2. Examiner:           & \textbf{Dr.-Ing.  Sebastian Ertel} \\
			    & Composable Operating Systems Group,\\
			    & Barkhausen Institut\\
			\end{tabular}
        \end{large}
	\end{table}
		\end{titlepage}
	    \pagestyle{empty}
		\cleardoublepage

	
	% Seitenstil festlegen
	\fancyfoot{}
	\fancyhead{}
	\pagestyle{fancy}
	\thispagestyle{fancy}
	
	\cleardoublestandardpage
	%Selbst‰ndigkeitserklaerung
	\ifx\@empty\@isdiploma
	\else
             \if@german
             \else
               \selectlanguage{ngerman}
             \fi

	     \chapter*{Selbstst\"{a}ndigkeitserkl\"{a}rung}
	
	    Hiermit erkl\"{a}re ich, dass ich die von mir am heutigen Tag dem Pr\"{u}fungsausschuss der Fakult\"{a}t \@faculty~eingereichte \@doctype~zum Thema:
	     \begin{center}
	     \textit{\@title}
	     \end{center}
	
	     vollkommen selbstst\"{a}ndig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt sowie Zitate kenntlich gemacht habe.\\[2cm]
	
	    Dresden, den \@date\\[3cm]
	    \@author

             \if@german
             \else
               \selectlanguage{american}
             \fi
	\fi
	\cleardoublestandardpage
	%Zusammenfassung
	\if@german
	  {\vspace*{2cm}
	  \minisec{Kurzfassung}
	  \@abstractde
	  \vspace{2cm}
 	  \selectlanguage{american}
	  \minisec{Abstract}
	  \@abstracten
	  \selectlanguage{ngerman}
	  }
    \else
	  {\vspace*{2cm}
  	  \selectlanguage{ngerman}
	  \minisec{Kurzfassung}
	  \@abstractde
	  \selectlanguage{american}
	  \vspace{2cm}
	  \minisec{Abstract}
	  \@abstracten
	  }
    \fi
	% zeilenabstand ja nach variante
	\if@final
	  %\singlespacing
	\else
	  \onehalfspacing
	\fi
	\normalsize
	\cleardoublestandardpage
	%Inhaltsverzeichnis
	\pagenumbering{arabic}
	\if@final
	  \fancyhead[LE,RO]{\thepage}
	\else
	  \if@twoside
	    \fancyhead[LE,RO]{\thepage}
	  \else
	    \fancyhead[R]{\thepage}
	  \fi
	\fi
	\if@notoc
	\else
	  \tableofcontents
	  \cleardoublestandardpage
	\fi
	%Nomenclature
	\if@nomencl
	%  \if@german
	%    \addcontentsline{toc}{chapter}{Symbolverzeichnis}
	%  \else
	%    \addcontentsline{toc}{chapter}{Nomenclature}
	%  \fi
	%  \label{sec:Nomenclature}
	  \printnomenclature[\@nomenclmargin]
	\fi
	%Kopfzeile basteln
	\markboth{}{}
	\ifx\@empty\@isreport
	  \if@final
	    \fancyhead[LO]{\@author}
	    \fancyhead[RE]{\@title}
	  \else
	    \if@twoside
	      \fancyhead[LO]{\@author}
	      \fancyhead[RE]{\@title}
	    \else
	      \fancyhead[L]{\@author -- \@title}
	    \fi
	  \fi
	\else
	  \if@final
	    \fancyhead[LO]{\rightmark}
	    \fancyhead[RE]{\leftmark}
	  \else
	    \if@twoside
	      \fancyhead[LO]{\rightmark}
	      \fancyhead[RE]{\leftmark}
	    \else
	      \fancyhead[L]{\leftmark}
	    \fi
	  \fi
	\fi}{%
	% Literatur-, Abbildungs- und Tabellenverzeichnis, wenn nicht schon bei
	% \appendix automatisch davor eingefuegt
	\ifx\@empty\@haveapp
	  \cleardoublestandardpage
	  \ifx\@empty\@bibfiles
	  \else
	    \bibliography{\@bibfiles}
	  \fi
	  \cleardoublestandardpage
	  \printlof
	  \cleardoublestandardpage
	  \printlot
	\fi
	\cleardoublestandardpage
	%Danksagung
	\ifx\@empty\@acknowledgments
	\else
	  \if@german
	    \@mkboth{Danksagung}{}
	  \else
	    \@mkboth{Acknowledgments}
	  \fi
	  \ifx\@empty\@isreport
	    \if@german
	      \section*{Danksagung}
	    \else
	      \section*{Acknowledgments}
	    \fi
	  \else
	    \if@german
	      \chapter*{Danksagung}
	    \else
	      \chapter*{Acknowledgments}
	    \fi
	  \fi
	  \@acknowledgments
	\fi
	% Copyright-Kram
	\cleardoublestandardpage
	\ifx\@empty\@copyrighterklaerung
	\else
	  \@mkboth{\@copyrightlabel}{}
	  \copyrightinfo
	\fi
	\cleardoublestandardpage
	\end{@altdoc}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nuetzliche Zusatzkommandos

\newcommand\longcite[2]{(vgl.~\cite{#1}, S.~#2)}

\newcommand\shortcite[2]{(\cite{#1}, S.~#2)}

%% itemize ohne abstand zw. den items
%\let\@altitemize=\itemize
%\let\end@altitemize=\enditemize
%\renewenvironment{itemize}{%
%\begin{@altitemize}%
%\ifnum \@itemdepth = 1
%  \vspace{-10pt}
%  \setlength{\itemsep}{-1pt}
%\else
%  \ifnum \@itemdepth = 2
%    \vspace{-6pt}
%    \setlength{\itemsep}{0pt}
%  \else
%    \ifnum \@itemdepth = 3
%      \vspace{-2pt}
%      \setlength{\itemsep}{1pt}
%    \else
%      \vspace{0pt}
%      \setlength{\itemsep}{2pt}
%    \fi
%  \fi
%\fi
%  \setlength{\parsep}{0pt}
%\setlength{\labelsep}{12pt}
%}%
%{\end{@altitemize}\vspace{-2pt}}

%% enumerate ohne abstand zw. den items
%\def\enumerate{%
%  \ifnum \@enumdepth >3 \@toodeep\else
%	\ifnum \@enumdepth = 0
%	  \vspace{-10pt}
%	  \setlength{\itemsep}{-1pt}
%	\else
%	  \ifnum \@enumdepth = 1
%	    \vspace{-6pt}
%	    \setlength{\itemsep}{0pt}
%	  \else
%	    \ifnum \@enumdepth = 2
%	      \vspace{-2pt}
%	      \setlength{\itemsep}{1pt}
%	    \else
%	      \vspace{0pt}
%	      \setlength{\itemsep}{2pt}
%	    \fi
%	  \fi
%	\fi
%	\setlength{\parsep}{0pt}
%	\setlength{\labelsep}{12pt}
%      \advance\@enumdepth \@ne
%      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\fi
%  \@ifnextchar[{\@@enum@}{\@enum@}}
%\def\@@enum@[#1]{%
%  \@enLab{}\let\@enThe\@enQmark
%  \@enloop#1\@enum@
%  \ifx\@enThe\@enQmark\@warning{The counter will not be printed.%
%   ^^J\space\@spaces\@spaces\@spaces The label is: \the\@enLab}\fi
%  \expandafter\edef\csname label\@enumctr\endcsname{\the\@enLab}%
%  \expandafter\let\csname the\@enumctr\endcsname\@enThe
%  \csname c@\@enumctr\endcsname7
%  \expandafter\settowidth
%            \csname leftmargin\romannumeral\@enumdepth\endcsname
%            {\the\@enLab\hspace{\labelsep}}%
%  \@enum@}
%\def\@enum@{\list{\csname label\@enumctr\endcsname}%
%           {\usecounter{\@enumctr}\def\makelabel##1{\hss\llap{##1}}}}

% paragraph mit Zeilenumbruch nach der Ueberschrift
\newcommand\Paragraph[1]{\minisec{#1}}

% im text korrekturen anzeigen
\newcommand{\correctme}[1]{\textcolor{red}{#1}}

% korrekturen ueber mehrere absaetze
\newenvironment{correctmore}{\color{red}}{\color{black}}
