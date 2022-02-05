% mins.sty
%  Take minutes of meetings
% 2005-Sept-01 Jim Hefferon jhefferon@smcvt.edu

% --- Class structure: identification part
% ---
\ProvidesClass{mins}[2005/09/01 version 1.00 Minutes of meetings]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: initial code part
% ---

% what is meeting? 
\def\@committeename{}
\newcommand{\setcommittee}[1]{\def\@committee{#1}}
\newcommand{\show@committee}{\@committee}

% who is meeting? 
\def\@members{None}
\newcommand{\setmembers}[1]{\def\@members{#1}}
\newcommand{\show@members}{\@members}
% what role do they have (e.g., chair)
\newcommand{\role}[2]{#1~(#2)}
\newcommand{\chair}[1]{\role{#1}{Chair}}
\newcommand{\secretary}[1]{\role{#1}{Secretary}}

% who is absent? 
\global\let\@absent\@empty
\newcommand{\setabsent}[1]{\def\@absent{#1}}
\let\absent\setabsent %
\newcommand{\show@absent}{\@absent}

% who is present?  (not used at the moment)
\global\let\@present\@empty
\newcommand{\setpresent}[1]{\def\@present{#1}}
\newcommand{\show@present}{\@present}

% who is also present?
\global\let\@alsopresent\@empty
\newcommand{\setalsopresent}[1]{\def\@alsopresent{#1}}
\let\alsopresent\setalsopresent %
\newcommand{\show@alsopresent}{\@alsopresent}

% what day is it?
\def\@date{\today}
\newcommand{\setdate}[1]{\def\@date{#1}}
\newcommand{\show@date}{\@date}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article, unless the file
% named "<currentoption>.min" exists, in which case it is loaded
%\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
%    \PassOptionsToClass{\CurrentOption}{article}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}

% --- Class structure: execution of options part
% ---
\ProcessOptions \relax

% --- Class structure: declaration of options part
% ---
\LoadClass{article}

% --- Class structure: main code part
% ---

% material heading the minutes
\newcommand{\head@list}{
\begin{description}
\item[Members:] \show@members
\ifx\@absent\@empty
  \relax
\else
  \item[Absent:] \show@absent
\fi %
\ifx\@alsopresent\@empty
  \relax
\else
  \item[Also present:] \show@alsopresent
\fi %
\end{description}
}

% basic definition of the minutes environ
\newenvironment{minutes}{%
\begin{center}
  {\large\textbf{Minutes, \show@committee}}  \\[1ex]
  \show@date
\end{center}
\vspace{1.5ex}
\head@list
\vspace{1ex}
}{%
}

% environments inside the minutes
\newenvironment{businesslist}[1]{%
%\renewcommand\theenumi{\alph{\enumi}}
\vspace{2ex}\par\noindent\textbf{#1}\par
\begin{enumerate}
}{%
\end{enumerate}
}


\newenvironment{business}{%
\begin{businesslist}{Business}
}{%
\end{businesslist}
}

\newenvironment{oldbusiness}{%
\begin{businesslist}{Old Business}
}{%
\end{businesslist}
}

\newenvironment{newbusiness}{%
\begin{businesslist}{New Business}
}{%
\end{businesslist}
}

\newenvironment{announcements}{%
\begin{businesslist}{Announcements}
}{%
\end{businesslist}
}

% when is the next meeting?
\newcommand{\nextmeeting}[1]{%
\par\noindent\textbf{Next Meeting:} #1\par
}

% OK the minutes of the last meeting
\newcommand{\priormins}{The minutes of the last meeting were approved. }


% Page layout
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{%
  \fancyhf{} % clear all six fields
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
  \fancyhf{} % clear all six fields
  \fancyhead[RE,LO]{\show@committee, \show@date}
  \fancyhead[LE,RO]{page \thepage}
  \renewcommand{\headrulewidth}{1pt}
  \renewcommand{\footrulewidth}{0pt}
}


\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}