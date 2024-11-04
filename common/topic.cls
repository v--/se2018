\ExplSyntaxOn

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../../common/topic}

\LoadClass
  [
    numbers=endperiod,
    bibliography=totocnumbered
  ]
  {scrartcl}

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

% Generic math packages (load first to avoid misbehaving macros later)
\RequirePackage{mathtools} % Loads amsmath
\RequirePackage{amsthm}
\RequirePackage{thmtools}

% Fonts
\RequirePackage[stixtwo]{fontsetup}
\setsansfont[BoldItalicFont={Libertinus~Sans}]{Libertinus~Sans}
\RequirePackage{microtype}

% Reference packages
\RequirePackage[unicode,colorlinks]{hyperref}

%% Based on https://tex.stackexchange.com/a/525297
\RequirePackage[x11names]{xcolor}
\hypersetup
  {
    linkcolor=DeepSkyBlue3,
    citecolor=DeepSkyBlue3,
    urlcolor=DeepSkyBlue3,
    filecolor=Coral4,
    menucolor=Coral4,
    runcolor=Coral4,
    linkbordercolor=DeepSkyBlue3,
    citebordercolor=DeepSkyBlue3,
    urlbordercolor=DeepSkyBlue3,
    filebordercolor=Coral4,
    menubordercolor=Coral4,
    runbordercolor=Coral4
  }

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
\RequirePackage{../../common/paired_delimiters}
\RequirePackage{../../common/subproofs}
\RequirePackage{../../common/theorems}
\RequirePackage{../../common/git_commit_info}

\ExplSyntaxOff
