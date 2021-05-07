\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../../common/topic}

\LoadClass[
  headings=standardclasses,
  bibliography=totocnumbered,
]{scrartcl}

% Setup options
\ExplSyntaxOn

\keys_define:nn {topicsetup} {
  number   .int_set:N = \l_topicsetup_number,
  title    .tl_set:N  = \l_topicsetup_title,
  basedate .tl_set:N  = \l_topicsetup_basedate,
  author   .tl_set:N  = \l_topicsetup_author
}

\NewDocumentCommand \TopicSetup {m} {
  \keys_set:nn {topicsetup} {#1}

  \title{Тема~{\int_use:N \l_topicsetup_number} \\[0.2em] \large{\url{https://github.com/v--/se2018}}}

  \date{
    \normalsize{
      \textbf{Оригинал:}~{\tl_use:N \l_topicsetup_basedate}
      \\
      \textbf{Ревизия:}~\input{../../revision}
      \\
      За~всеки~случай~проверете~дали~няма~по-нова~ревизия
    }
  }

  \subtitle{\tl_use:N \l_topicsetup_title}
  \author{\tl_use:N \l_topicsetup_author}
}

\ExplSyntaxOff

% Generic math packages
\RequirePackage{mathtools} % Loads amsmath
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{lualatex-math}

% Reference packages
\RequirePackage[colorlinks]{hyperref}
%% https://tex.stackexchange.com/a/525297
\RequirePackage{xcolor}

\NewDocumentCommand \setcolor {mmm} {%
  \definecolor{Hy#1color}{#2}{#3}%
  \hypersetup{#1color=Hy#1color}%
}

\setcolor{link}{HTML}{800006}
\setcolor{cite}{HTML}{2E7E2A}
\setcolor{file}{HTML}{131877}
\setcolor{url} {HTML}{8A0087}
\setcolor{menu}{HTML}{727500}
\setcolor{run} {HTML}{137776}

\RequirePackage{cleveref}
\crefname{figure}{фигура}{фигури}
\Crefname{figure}{Фигура}{Фигури}
\crefname{section}{параграф}{параграфи}
\Crefname{section}{Параграф}{Параграфи}

% Internationalization
\RequirePackage[base]{babel}

%% Relax some conflicting macros in the Russian and Bulgarian babel files
\ExplSyntaxOn

\AfterBabelLanguage{bulgarian}{
  \let\sh\relax
  \let\ch\relax
  \let\tg\relax
  \let\ctg\relax
  \let\arctg\relax
  \let\arcctg\relax
  \let\cth\relax
  \let\cosec\relax
}

\AfterBabelLanguage{russian}{
  \let\Prob\relax
}

\ExplSyntaxOff

%% This definition came up after a lot of attempts to make the Russian and Bulgarian babel files work together
\def\bulgarianhyphenmins{\tw@ \tw@}

\RequirePackage[english,russian,main=bulgarian]{babel}
\RequirePackage[autostyle]{csquotes}
\DeclareQuoteAlias[quotes]{german}{bulgarian}

% Citations
\RequirePackage[
  backend=biber,
  autolang=other,
  style=authortitle,
  citestyle=authortitle
]{biblatex}

% Fonts
\RequirePackage{fontspec}
\setmainfont{Stix Two Text}
\setsansfont{CMU Sans Serif}
\setmonofont{CMU Typewriter Text}

%% Disable generic warnings about compatibility with mathtools.
\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
\setmathfont{Stix Two Math}

\RequirePackage{microtype}

%
\RequirePackage{../../common/math_macros}
\RequirePackage{../../common/delimiters}
\RequirePackage{../../common/subproofs}
\RequirePackage{../../common/theorem_styles}
