% Auth: Nicklas Vraa
% Docs: https://github.com/NicklasVraa/LiX
% ------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{novella}[2023/02/10 For works of fiction]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,oneside]{book}

% SETUP: -----------------------------------------------------------------------
\RequirePackage[basics, formatting, header, headings, metadata, size]{lix}
\RequirePackage[lining]{ebgaramond}

% OVERRIDES: -------------------------------------------------------------------
\authorfont{\normalsize}
\RenewDocumentCommand{\l}{mg}{
    \lettrine[nindent=2.4pt, findent=-1.5pt, loversize=0.25]{#1}{\IfValueTF{#2}{#2}{}}
}

% SIZE, MARGINS: ---------------------------------------------------------------
\geometry{letterpaper, top=36mm, bottom=40mm, left=40mm, right=40mm}

% HEADINGS: --------------------------------------------------------------------
\setlength{\headsep}{5mm}
\setcounter{secnumdepth}{1}% Levels of heading that will be numbered.
\titlespacing{\chapter}{-1pt}{-45pt}{10pt}
\titlespacing{\numberless}{0pt}{14pt}{4pt}
\titlespacing{\section}{0pt}{14pt}{4pt}
\titlespacing{\subsection}{0pt}{14pt}{4pt}
\titlespacing{\subsubsection}{0pt}{14pt}{4pt}
\titleformat*{\section}{\bfseries\scshape}
\titleformat*{\subsection}{\bfseries\scshape}
\titleformat*{\subsubsection}{\bfseries\scshape}
\titleformat{\chapter}[display]{%
    \normalsize%
}{% Prefix.
    \centering\hspace{1pt}\small\scshape\color{darkgray}\chaptertitlename \ \thechapter%
}{% Vertical space between.
    -9pt%
}{% Chapter name.
    \centering\LARGE\bfseries\scshape%
}

% PAGESTYLES: ------------------------------------------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\fancyhead[L]{}
\fancyhead[C]{\small\scshape\color{darkgray} \theTitle}
\fancyhead[R]{}
\fancyfoot[C]{\large\scshape\thepage}%
\renewcommand{\headrulewidth}{0pt}%

% LAYOUT: ----------------------------------------------------------------------
\wrap{%
    \@ifundefined{theTitle}{}{%
        \@ifundefined{theSubtitle}{%
            \oldtitle{\Huge\textbf{\textsc{\theTitle}}}%
        }{%
            \oldtitle{\Huge\textbf{\textsc{\theTitle}}\\[0.4ex]%
            \large\scshape\theSubtitle}%
        }
    }
    \@ifundefined{theAuthor}{%
        \oldauthor{}%
    }{%
        \oldauthor{\theAuthor}%
    }
    \@ifundefined{theDate}{%
        \olddate{}%
    }{%
        \olddate{\normalsize{\theDate}}%
    }
    \@ifundefined{theTitle}{}{%
        \maketitle%
    }
    \addMetadata
}
