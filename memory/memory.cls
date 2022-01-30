\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{memory}[2022/01/05 v1.0]
\LoadClass[openany]{book}
\RequirePackage{fontawesome5}
\RequirePackage{graphicx}
\RequirePackage{magicwatermark}
\RequirePackage{tikzlings}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{geometry}
\RequirePackage{pifont}
\RequirePackage{ctex}
\usetikzlibrary{decorations.pathmorphing,shapes.misc,shadows,shapes.symbols}
\geometry{left=6.5cm,right=1cm,top=2cm,bottom=2cm}
\def\evencolor{cyan!30}
\def\oddcolor{pink!30}
%%%============页面效果设计==============%%%
\PageSetup*
{
    \begin{tikzpicture}[remember picture,overlay]
        \node[shift={(0,1.0)},scale=1.2,starburst,drop shadow,fill=white,draw,inner ysep=0pt,inner xsep=3pt] at (current page.south){\thepage};
        \node[scale=2,opacity=0.5]at (current page.center) {\includegraphics{rose.pdf}};
    \end{tikzpicture}
}
\EvenPageSetup*
{
    \begin{tikzpicture}[remember picture,overlay]
        \fill[fill=\evencolor,opacity=0.6,decorate, decoration=zigzag] ([shift={(-0.5,2)}]current page.south east) rectangle +(-5.5,\paperheight -4cm);
        \node[scale=2,font=\bfseries] at ([shift={(-3.25,-3)}]current page.north east)
        { 
            \begin{tikzpicture}
                \begin{scope}[shift={(-0.8,0)}]
                    \node[rounded corners,double,rectangle,draw] {小课堂};
                \end{scope}
                \begin{scope}[scale=0.3,shift={(0.8,-1)}]
                    \bear[bubblecolour=gray!30!white]
                \end{scope}      
             \end{tikzpicture}
        };      
    \end{tikzpicture}
}
\OddPageSetup*
{
    \begin{tikzpicture}[remember picture,overlay]
        \fill[fill=\oddcolor,opacity=0.6,decorate, decoration=zigzag] ([shift={(0.5,2)}]current page.south west) rectangle +(5.5,\paperheight -4cm);
        \node[scale=2,font=\bfseries] at ([shift={(3.25,-3)}]current page.north west)
        {
            \begin{tikzpicture}
                \begin{scope}[shift={(-0.8,0)}]
                    \node[rounded corners,double,rectangle,draw] {小课堂};
                \end{scope}
                \begin{scope}[scale=0.3,shift={(0.8,-1)}]
                    \owl
                \end{scope}           
             \end{tikzpicture}

        };
    \end{tikzpicture}
}
%%%=========修改chapter命令，避免其分页===========%%%
\RequirePackage{xpatch}

\xpatchcmd{\chapter}
  {\if@openright\cleardoublepage\else\clearpage\fi}{\par\relax}
  {}{}
\xpatchcmd{\chapter}
{\thispagestyle{plain}}{\thispagestyle{empty}}
{}{}

%%%==========将数字转化为大写============%%%

\ExplSyntaxOn
\cs_new:Npn \int_to_zh:n #1
{
    \int_to_symbols:nnn {#1}{20}
    {
        {1}{壹}
        {2}{贰}
        {3}{叁}
        {4}{肆}
        {5}{伍}
        {6}{陆}
        {7}{柒}
        {8}{捌}
        {9}{玖}
        {10}{拾}
        {11}{拾壹}
        {12}{拾贰}
        {13}{拾叁}
        {14}{拾肆}
        {15}{拾伍}
        {16}{拾陆}
        {17}{拾柒}
        {18}{拾捌}
        {19}{拾玖}
        {20}{贰拾}
    }
}
\NewDocumentCommand{\inttozh}{m}
{
    \int_to_zh:n #1
}
\ExplSyntaxOff

%%%%===========章节样式============%%%

\RequirePackage[explicit]{titlesec}

\titleformat{\chapter}{\Huge\bfseries}
{
    \begin{tikzpicture}[remember picture,overlay,scale=0.5,yshift=-0.5cm,xshift=-0.5cm]
        \elephant[signpost={\footnotesize\inttozh{\thechapter}}]
    \end{tikzpicture}
}{1pt}
{
    \filcenter
    \Huge
    #1
}
\titleformat{\section}{\large\bfseries}
{
    \begin{tikzpicture}[remember picture,overlay,scale=0.3,xshift=-0.5cm,yshift=-0.5cm]
        \penguin[think={\tiny\thesection}]
    \end{tikzpicture}
}{1pt}
{
 \filright
 \large
 \begin{tikzpicture}[remember picture,overlay,scale=0.5,yshift=0.5cm,xshift=0.5cm]
    \node[chamfered rectangle,white, fill=brown, double=brown, draw, very thick,inner ysep=1pt,anchor=west,inner xsep=5pt]
{\bfseries #1};
 \end{tikzpicture}
}

\titleformat{\subsection}{\bfseries}
{
\relax
}{1pt}
{
 \filright
 \begin{tikzpicture}[remember picture,overlay,scale=0.5,yshift=0.5cm,xshift=0.5cm]
    \node[rounded rectangle left arc=none,anchor=west,draw, rounded rectangle,scale=0.8,fill=brown,text=white]
{\bfseries #1};
 \end{tikzpicture}
}[\setcounter{snake}{1}]

%%%==========定义目录===========%%%
\RequirePackage[most]{tcolorbox}

\RenewDocumentCommand{\tableofcontents}{}
{
  \newgeometry{left=2.5cm,right=2.5cm,top=2cm,bottom=2cm}
  \begin{tcolorbox}[enhanced,title=目\quad 录,sharp corners,breakable,
    colframe=blue!50!black,colback=blue!10!white,colbacktitle=blue!5!yellow!10!white,
    fonttitle=\bfseries,coltitle=black,attach boxed title to top center=
      {yshift=-0.25mm-\tcboxedtitleheight/2,yshifttext=2mm-\tcboxedtitleheight/2},
    boxed title style={boxrule=0.5mm,
      frame code={ \path[tcb fill frame] ([xshift=-4mm]frame.west)
      -- (frame.north west) -- (frame.north east) -- ([xshift=4mm]frame.east)
      -- (frame.south east) -- (frame.south west) -- cycle; },
      interior code={ \path[tcb fill interior] ([xshift=-2mm] interior.west)
      -- (interior.north west) -- (interior.north east)
      --([xshift=2mm] interior.east) -- (interior.south east) -- (interior.south west)
      --cycle;} }]
    \@starttoc{toc} 
  \end{tcolorbox}
  \newpage
  \restoregeometry 
}

%%%=============定义note环境============%%%
\ExplSyntaxOn
\dim_zero_new:N \l_note_text_width_dim
\box_clear_new:N \l_note_text_box
\NewDocumentEnvironment{note}{O{}+b}
{
    \hbox_set:Nn \l_note_text_box{#2}
    \dim_compare:nNnTF{\box_wd:N \l_note_text_box} < {5cm}
    {
        \dim_set:Nn \l_note_text_width_dim {\box_wd:N \l_note_text_box}
    }
    {\dim_set:Nn \l_note_text_width_dim{4.7cm}}
    \int_if_odd:nTF{\int_use:N \value{page}}
    {
        \group_begin:
        \keys_set:nn{note}{#1}
        \tikz[remember~picture,overlay]
        {   
          \use:x 
         {\exp_not:N
           \node
           [
               anchor=north~west,
               align=\tl_use:N \l_align_tl,
               text~width=\dim_use:N \l_note_text_width_dim,
               yshift=-\dim_use:N\l_distance_dim,
               font=\tl_use:N\l_font_tl,
               \exp_not:V \l_note_style_tl,


           ] 
         } (note) at ([shift={(0.7,-5)}]current~page.north~west){#2};
         \tl_use:N \l_note_style_plus_tl 
        }
        \group_end: 
    }
    {
        \group_begin:
        \keys_set:nn{note}{#1}
        \tikz[remember~picture,overlay]
        {   
          \use:x 
            {\exp_not:N
               \node
             [
                anchor=north~west,
                align=\tl_use:N \l_align_tl,
                text~width=\dim_use:N \l_note_text_width_dim,
                yshift=-\dim_use:N\l_distance_dim,
                font=\tl_use:N\l_font_tl,
                \exp_not:V \l_note_style_tl,
  
             ] 
            } (note) at ([shift={(-5.7,-5)}]current~page.north~east){#2};
            \tl_use:N \l_note_style_plus_tl 
        }
        \group_end: 
    }
    
}{}
%%%===========设计note环境的键值============%%%
\tl_clear:N \l_note_style_tl 
\tl_clear:N \l_note_style_plus_tl 
\definecolor{bookstyle}{RGB}{143,75,46}
\keys_define:nn{note}
{
    distance.dim_set:N = \l_distance_dim,
    distance.initial:n = 0pt,
    distance.default:n = 0pt,
    font.tl_set:N      = \l_font_tl,
    font.initial:n     = \xingkai,
    font.default:n     = \xingkai,
    align.tl_set:N     = \l_align_tl,
    align.initial:n    = left,
    align.default:n    = left,
    style. choice:,
    style/school.code:n = {\tl_set:Nn \l_note_style_tl {fill=yellow!50,draw,thick,decorate, decoration={random~steps,segment~length=3pt,amplitude=1pt},drop~shadow={opacity=.8,fill=gray!50!black}}},

    style/book.code:n = {\tl_set:Nn \l_note_style_tl{draw,rounded~corners,text=white,fill=bookstyle,drop~shadow={opacity=.8,fill=gray!50!black}}},

    style/mac.code:n = {\tl_set:Nn \l_note_style_tl{fill=white,draw,very~thin,rounded~corners=2pt,inner~ysep=8pt,drop~shadow={opacity=.8,fill=gray!50!black}} \tl_set:Nn \l_note_style_plus_tl
    {
        \fill[fill=red]([shift={(4pt,-4pt)}]note.north~west)circle(2.5pt);
        \fill[fill=yellow]([shift={(10pt,-4pt)}]note.north~west)circle(2.5pt);
        \fill[fill=green]([shift={(16pt,-4pt)}]note.north~west)circle(2.5pt);
    }}    
}


\ExplSyntaxOff
%%%=============字体==============%%%
\RequirePackage{xeCJK,fontspec}
\IfFontExistsTF{FZKTK.TTF}
{
  \setCJKmainfont{FZKTK.TTF}  
}
{}
\IfFontExistsTF{FZFSK.TTF}
{
  \setCJKfamilyfont{fzfs}{FZFSK.TTF}
  \newcommand{\fzfs}{\CJKfamily{fzfs}}
}
{\let\fzfs\relax}
\IfFontExistsTF{STXINGKA.TTF}
{
  \setCJKfamilyfont{xingkai}{STXINGKA.TTF}
  \newcommand{\xingkai}{\CJKfamily{xingkai}}
}
{\let\xingkai\relax}
\IfFontExistsTF{FZSTK.TTF}
{
  \setCJKfamilyfont{shuti}{FZSTK.TTF}
  \newcommand{\shuti}{\CJKfamily{shuti}}
}
{\let\shuti\relax}

% \AtBeginDocument{}





\definecolor{cover}{RGB}{110,123,139}
\newcommand{\covercolor}{cover}
\DeclareRobustCommand*\version[1]{\gdef\@version{#1}}


\NewDocumentCommand{\logo}{}
{
    \newcounter{density}
     \setcounter{density}{20}
     \begin{tikzpicture}
         \def\couleur{cyan}
         \path[coordinate] (0,0)  coordinate(A)
                     ++( 60:12cm) coordinate(B)
                     ++(-60:12cm) coordinate(C);
         \draw[fill=\couleur!\thedensity] (A) -- (B) -- (C) -- cycle;
         \foreach \x in {1,...,15}{%
             \pgfmathsetcounter{density}{\thedensity+10}
             \setcounter{density}{\thedensity}
             \path[coordinate] coordinate(X) at (A){};
             \path[coordinate] (A) -- (B) coordinate[pos=.15](A)
                                 -- (C) coordinate[pos=.15](B)
                                 -- (X) coordinate[pos=.15](C);
             \draw[fill=\couleur!\thedensity] (A)--(B)--(C)--cycle;
         }
     \end{tikzpicture}
}
\RenewDocumentCommand{\maketitle}{}
{
    \begin{tikzpicture}[remember picture,overlay]
        \node[scale=0.8]at([shift={(0,-0.7\paperheight)}]current page.north)
        {
           \logo
        }; 
        \node[font=\bfseries\Huge\shuti,scale=2]at([shift={(0,-0.25\paperheight)}]current page.north){\color{\covercolor}\@title};
        \node[font=\bfseries\large\shuti,scale=2]at([shift={(0,-0.33\paperheight)}]current page.north){\color{\covercolor}作者：\@author};
        \node[font=\bfseries\large\shuti,scale=2]at([shift={(0,-0.38\paperheight)}]current page.north){\color{\covercolor}版本：\@version};
    \end{tikzpicture}
}




\newtcbox{\highlight}[1][magenta]{on line,
arc=0pt,outer arc=0pt,colback=#1!10!white,colframe=#1!50!black,
boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt,
boxrule=0pt,bottomrule=0.3pt,toprule=0.3pt}


\ExplSyntaxOn
\newcounter{snake}[subsection]

\tl_new:N \g_snake_star_tl
\tl_gset:Nn \g_snake_star_tl{\raisebox{-0.2ex}{\textcolor{red}{\ding{77}}}}
\tl_new:N \g_snake_pen_tl
\tl_gset:Nn \g_snake_pen_tl{\raisebox{-0.2ex}{\textcolor{magenta}{\ding{49}}}}
\tl_new:N \g_snake_triangle_tl
\tl_gset:Nn \g_snake_triangle_tl{\raisebox{-0.2ex}{\textcolor{red}{\ding{115}}}}
\tl_new:N \g_snake_write_tl
\tl_gset:Nn \g_snake_write_tl{\raisebox{-0.2ex}{\textcolor{cyan}{\ding{45}}}}
\NewDocumentCommand{\snake}{o+m}
{   
    \IfNoValueTF{#1}
    {
        \begin{flushleft}
        \textcolor{brown}{\thesnake .#2}   
        \end{flushleft}  
        \stepcounter{snake} 
    }
    { 
        \str_if_in:nnTF{star,pen,triangle,write}{#1}
        {
           \begin{flushleft}
           \textcolor{brown}{\thesnake .
           (
             \str_case:nn{#1}
             {
                 {star}{\tl_use:N \g_snake_star_tl}
                 {pen}{\tl_use:N \g_snake_pen_tl}
                 {triangle}{\tl_use:N \g_snake_triangle_tl}
                 {write}{\tl_use:N \g_snake_write_tl}
             }
           )
           #2}  
        \end{flushleft}   
        }
        {
            \begin{flushleft}
                \textcolor{brown}{\thesnake . (#1) #2}  
             \end{flushleft} 
        }
        \stepcounter{snake} 
    }
}


\ExplSyntaxOff
\pagestyle{empty}
\endinput
