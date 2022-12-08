%%%% resume.cls
%%%% Brian M. Moore (mooreb@ukans.edu)
%%%% Mon Feb 23 08:51:06 1998
%%%%
%%%% I wrote this class file while reading _The_LaTeX_Companion_ by
%%%% Goosens et. al., p. 460-468.
%%%
%%% Todo: 
%%%  * Labels of sections in the left hand column do not
%%%    overlap. 
%%%
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Provide the following resume sections (environments) and commands:
%%
%%     \name{<name>} Your name as you'd like it to appear at the top.
%%     \address{<address spec>} Your address, as you'd like it to
%%        appear at the top. Use \hfill between separate address
%%        if you have two: 
%%          \address{add1_line_1 \hfill add2_line_1 \\
%%                   add1_line_2 \hfill add2_line_2}
%%
%%      resume \begin{resume} ... \end{resume} All resume text
%%        should be contained in this environment.
%%
%%      Objective  \begin{Objective} ... \end{Objective}
%%      Profile    \begin{Profile}   ... \end{Profile}
%%      Education  \begin{Education} ... \end{Education}
%%      Projects    \begin{Projects} ... \end{Projects}
%%      Special    \begin{Skills} ... \end{Skills}
%%       skills
%%      Employment \begin{Employment} ... \end{Employment}
%%      Awards     \begin{Awards} ... \end{Awards}
%%      Activities \begin{Activities} ... \end{Activities}
%%      References \begin{References} ... \end{References}
%%
%%   Use these environments inside the environments above:
%% 
%%      job        \begin{job}{<title>}{<location>}{<date>}
%%                    <duties as separate paragraphs>
%%                 \end{job}
%%      reference  \begin{reference} 
%%                     <each line of a referee. end with \\>
%%                 \end{reference}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Identification Part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
              [1998/02/23 v1.0
 (Brian Moore's resume class)]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Initial Code Part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Declaration of Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Execution of Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Package Loading Part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Main Code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this command has to be first to define secname in the state section
% control the section headings in the left column
\newcommand{\secname}[1]{\large{\textbf{#1}}}

%%%% State
% this counter will specify the width of the longest label.
% it's a terrible hack.
% I really want something like max...
\newlength{\leftlength}
\settowidth{\leftlength}{\secname{Employment}}
\addtolength{\leftlength}{1em}

\newsavebox{\addressbox}
\newsavebox{\namebox}

% provide 1" margins and pagestyle
\pagestyle{empty}
\marginparwidth 0pt
\oddsidemargin 0pt
\evensidemargin 0pt
\marginparsep 0pt
\topmargin 0pt
\headheight 0pt
\headsep 0pt
\textheight 9in
\textwidth 6in

%%%% Commands

% control the name and address of the resume owner
\newcommand{\name}[1]{\savebox{\namebox}{\bf\huge #1}}
\newcommand{\address}[1]{\savebox{\addressbox}{\parbox{\textwidth}{#1}}}
\newcommand{\boxify}[1]{\parbox[t]{\leftlength}{\raggedright{#1}}}

%%%% Environments

\newenvironment{resume}%
  {\begin{center}\usebox{\namebox}\end{center}%
   \usebox{\addressbox}%
   \vskip 3pt\hrule}
  {\hrule}

\newenvironment{ressection}[1]%
  {\begin{list}{}{%
     \renewcommand{\makelabel}[1]{\secname{##1}\hfil}%
     \setlength{\labelwidth}{\leftlength}%
     \setlength{\leftmargin}{\labelwidth}}%
   \item[#1]}%
  {\end{list}}

\newenvironment{Objective}%
  {\begin{ressection}{\boxify{Objective}}}
  {\end{ressection}}

\newenvironment{Profile}%
  {\begin{ressection}{\boxify{Profile}}}
  {\end{ressection}}

\newenvironment{Education}%
  {\begin{ressection}{\boxify{Education}}}
  {\end{ressection}}

\newenvironment{Projects}%
  {\begin{ressection}{\boxify{Projects}}}
  {\end{ressection}}

\newenvironment{Employment}%
  {\begin{ressection}{\boxify{Employment}}}
  {\end{ressection}}

\newenvironment{Skills}%
  {\begin{ressection}{\boxify{Special Skills}}}
  {\end{ressection}}

\newenvironment{Awards}%
  {\begin{ressection}{\boxify{Awards}}}
  {\end{ressection}}

\newenvironment{Activities}%
  {\begin{ressection}{\boxify{Activities}}}
  {\end{ressection}}

\newenvironment{References}%
  {\begin{ressection}{\boxify{References}}}
  {\end{ressection}}

\newenvironment{job}[3]%
  {\begin{description}%
     \item[#1]#2.\\%
     #3.%
     \begin{verse}}
  {\end{verse}\end{description}}

\newenvironment{reference}%
  {\begin{flushleft}}
  {\end{flushleft}}
