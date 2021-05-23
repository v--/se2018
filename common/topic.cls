\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../../common/topic}

\LoadClass[
  numbers=endperiod,
  headings=standardclasses,
  bibliography=totocnumbered
]{scrartcl}

\ExplSyntaxOn

% Setup options
\keys_define:nn {topic}
{
  number   .int_set:N = \l_topic_number_int,
  title     .tl_set:N = \l_topic_title_tl,
  basedate  .tl_set:N = \l_topic_basedate_tl,
  author    .tl_set:N = \l_topic_author_tl
}

\NewDocumentCommand \TopicSetup {m}
{
  \keys_set:nn {topic} { #1 }

  \title{ Тема~{ \int_use:N \l_topic_number_int } \\[0.2em] \large{ \url{https://github.com/v--/se2018} } }

  \date{
    \normalsize{
      \textbf{Оригинал:}~{ \tl_use:N \l_topic_basedate_tl }
      \\
      \textbf{Ревизия:}~\input{../../revision}
      \\
      За~всеки~случай~проверете~дали~няма~по-нова~ревизия
    }
  }

  \subtitle{ \tl_use:N \l_topic_title_tl }
  \author{ \tl_use:N \l_topic_author_tl }
}

% Fonts
\RequirePackage[T2A]{fontenc}
\RequirePackage{microtype}

% Generic math packages
\RequirePackage{mathtools} % Loads amsmath
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{thmtools}

% Reference packages
\RequirePackage[unicode,colorlinks]{hyperref}
%% https://tex.stackexchange.com/a/525297
\RequirePackage{xcolor}

\NewDocumentCommand \setcolor {mmm}
{
  \definecolor{Hy#1color}{#2}{#3}
  \hypersetup{#1color=Hy#1color}
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

\AfterBabelLanguage{bulgarian}
{
  \let\sh\relax
  \let\ch\relax
  \let\tg\relax
  \let\ctg\relax
  \let\arctg\relax
  \let\arcctg\relax
  \let\cth\relax
  \let\cosec\relax
}

\AfterBabelLanguage{russian}
{
  \let\Prob\relax
}

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

%
\RequirePackage{../../common/math_macros}
\RequirePackage{../../common/symbols}
\RequirePackage{../../common/paired_delimiters}
\RequirePackage{../../common/subproofs}
\RequirePackage{../../common/theorems}

\ExplSyntaxOff
