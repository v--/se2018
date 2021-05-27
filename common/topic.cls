\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../../common/topic}

\LoadClass
  [
    numbers=endperiod,
    bibliography=totocnumbered
  ]
  {scrartcl}

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
    \keys_set:nn {topic} {#1}

    \title
      {
        Тема~{ \int_use:N \l_topic_number_int }
        \\[0.2em]
        \large
          {
            \DeclareFontFamilySubstitution{T1}{cmtt}{lmtt} % Use the slightly heavier latin modern typewriter font
            \fontencoding{T1} % lmtt provides no T2A font
            \url{https://github.com/v--/se2018}
          }
      }

    % Failsafe means "use defauls if no file is found", see common/git_commit_info.sty
    \GitCommitInfoReadFailsafe { ../../git-commit-info }
      {
        \date
          {
            \normalsize
            \textbf{Оригинал:}~{ \tl_use:N \l_topic_basedate_tl } \\
            \textbf{Ревизия:}~{ \texttt{\GitCommitInfoHash}~от~\GitCommitInfoDate } \\
            За~всеки~случай~проверете~дали~няма~по-нова~ревизия
          }
      }

    \subtitle { \tl_use:N \l_topic_title_tl }
    \author   { \tl_use:N \l_topic_author_tl }
  }

\ExplSyntaxOff

% Generic math packages (load first to avoid misbehaving macros later)
\RequirePackage{mathtools} % Loads amsmath
\RequirePackage{amsthm}
\RequirePackage{thmtools}

% Fonts
%% I avoid fontspec and unicode-math (and hence XeTeX/LuaTeX) because they drastically slow down the compilation
\RequirePackage[notext,not1]{stix2} % Math font family; load after amsmath despite documentation, it breaks otherwise
\RequirePackage[tt=false,ScaleRM=1.075]{libertinus} % Serif and sans-serif font families
\RequirePackage{microtype}

% Reference packages
\RequirePackage[unicode,colorlinks]{hyperref}
%% https://tex.stackexchange.com/a/525297
\RequirePackage{xcolor}

\NewDocumentCommand \SetHRColor {mmm}
  {
    \definecolor{Hy#1color}{#2}{#3}
    \hypersetup{#1color=Hy#1color}
  }

\SetHRColor{link}{HTML}{800006}
\SetHRColor{cite}{HTML}{2E7E2A}
\SetHRColor{file}{HTML}{131877}
\SetHRColor{url} {HTML}{8A0087}
\SetHRColor{menu}{HTML}{727500}
\SetHRColor{run} {HTML}{137776}
\let\SetHRColor\relax

\RequirePackage{cleveref}
\crefname{figure}{фигура}{фигури}
\Crefname{figure}{Фигура}{Фигури}
\crefname{section}{параграф}{параграфи}
\Crefname{section}{Параграф}{Параграфи}

% Internationalization
\RequirePackage[bulgarian]{babel}
\RequirePackage[autostyle]{csquotes}
\DeclareQuoteAlias[quotes]{german}{bulgarian}

% Citations
\RequirePackage
  [
    backend=biber,
    style=authortitle,
    citestyle=authortitle
  ]
  {biblatex}

% Custom code
\RequirePackage{../../common/math_macros}
\RequirePackage{../../common/math_environments}
\RequirePackage{../../common/unicode_math_symbols}
\RequirePackage{../../common/paired_delimiters}
\RequirePackage{../../common/subproofs}
\RequirePackage{../../common/theorems}
\RequirePackage{../../common/git_commit_info}
