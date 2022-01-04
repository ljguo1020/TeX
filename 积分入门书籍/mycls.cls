\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mycls}[2021/05/21 v1.0]
\LoadClass[openany]{ctexbook}

%----------Packages----------%
\RequirePackage[a4paper,bottom=3cm,left=2cm,right=2cm]{geometry}
\RequirePackage{xcolor}
\RequirePackage{tikz,newtxtext}
\RequirePackage{ctex}
\RequirePackage[many]{tcolorbox}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{amsthm}
\RequirePackage{graphicx}
\RequirePackage{zhlipsum}
\RequirePackage{titletoc}
%\RequirePackage{newtxtext}
%\RequirePackage{newtxmath}
\everymath{\displaystyle}



%--------font---------%
\setCJKfamilyfont{shuti}{方正舒体}
\newcommand{\shuti}{\CJKfamily{shuti}}
\setCJKfamilyfont{xingkai}{华文行楷}
\newcommand{\xingkai}{\CJKfamily{xingkai}}









%---------直立积分号--------%
\DeclareSymbolFont{EulerExtension}{U}{euex}{m}{n}
\DeclareMathSymbol{\euintop}{\mathop} {EulerExtension}{"52}
\DeclareMathSymbol{\euointop}{\mathop} {EulerExtension}{"48}
\let\intop\euintop
\let\ointop\euointop

%--------预处理命令-------%
\DeclareRobustCommand*\vision[1]{\gdef\@vision{#1}}
\DeclareRobustCommand*\slogan[1]{\gdef\@slogan{#1}}


%----------定制页码-------%
\newcommand{\pageo}{
	\begin{tikzpicture}
	\draw [line width=2pt](0,0) circle [radius=10pt];
	(0,0) \node [red] {\thepage };
	\end{tikzpicture}	
}
%------定制页眉页脚-----%
\fancyhead[L]{}
\fancyhead[R]{}
\fancyhead[L]{}
\fancyfoot[L]{\textcolor{cyan}{微信公众号}}
\fancyfoot[C]{\textcolor{cyan}{\pageo }}
\fancyfoot[R]{\textcolor{cyan}{芒果不盲的数学小屋}}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}

\setlength{\footskip}{25.7942pt}
	

  %-------------------定制封面-------%
\renewcommand{\maketitle}{	\begin{titlepage}
  	
        \begin{tikzpicture}[remember picture, overlay]
        \fill[green!40!blue](current page.south east)rectangle (current page.north west);
        
        %填充页面颜色
        \coordinate (A) at ([yshift=0.72\textheight,xshift=-0.05\textwidth]current page.south east);
        \coordinate (B) at ([yshift=-0.2\textheight,xshift=-0.05\textwidth]current page.north east);
        \coordinate (C) at ([xshift=-0.17\textwidth]A);
        \coordinate (D) at ([xshift=-0.17\textwidth]B);




        \node[font=\Huge\sffamily\bfseries,align=center,anchor=east] at ([yshift=0.35\textheight,xshift=-0.05\textwidth]current page.east){\begin{name} \shuti\zihao{0}
           \@title
        \end{name}};
       

        %书名框，待优化
        
        \coordinate (e1) at ([yshift=0.15\textheight]current page.south west);
        \coordinate (e2) at ([yshift=0.155\textheight]current page.south west);
        \coordinate (e3) at ([yshift=0.35\textheight]current page.south west);
        \coordinate (e4) at ([yshift=0.355\textheight]current page.south west);
        \coordinate (e5) at ([yshift=0.55\textheight]current page.south west);
        \coordinate (e6) at ([yshift=0.555\textheight]current page.south west);
        \coordinate (e7) at ([yshift=0.75\textheight]current page.south west);
        \coordinate (e8) at ([yshift=0.755\textheight]current page.south west);
        \coordinate (e9) at ([yshift=0.95\textheight]current page.south west);
        \coordinate (e10) at ([yshift=0.955\textheight]current page.south west);
        \coordinate (e11) at ([yshift=1.15\textheight]current page.south west);
        \coordinate (e12) at ([yshift=1.155\textheight]current page.south west);
        %左侧小白条
        
       % \draw[line width=5pt,qianzi](B)--(D)--(C)--(A)--cycle;
      %  \fill[qianfen](A) rectangle (D);
        
        %\node[font=\Huge\sffamily\bfseries,align=center,anchor=north, scale=1.3,inner xsep=3mm,
       % inner ysep=3mm] at ([xshift=-1.5cm,yshift=-0.5cm]B){\heiti 积\\[0cm]\heiti 分\\[0.5mm]\heiti 入\\[0.5mm]\heiti 门};
        
        \fill [white](e1)--++(2,0)--([xshift=2cm]e2)--(e2);
        \fill [white](e3)--++(2,0)--([xshift=2cm]e4)--(e4);
        \fill [white](e5)--++(2,0)--([xshift=2cm]e6)--(e6);
        \fill [white](e7)--++(2,0)--([xshift=2cm]e8)--(e8);
        \fill [white](e9)--++(2,0)--([xshift=2cm]e10)--(e10);
        \fill [white](e11)--++(2,0)--([xshift=2cm]e12)--(e12);
        \fill [white]([xshift=1.95cm,yshift=-3.5cm]e1) rectangle ([xshift=2.05cm,yshift=3cm]e12);
        \node[font=\LARGE,anchor=east,inner xsep=3mm,inner ysep=3mm,align=left] at ([yshift=-0.35\textheight,xshift=-0.05\textwidth]current page.east){
            \fcolorbox{qianzi}{qianfen} {\heiti 作者：\hspace*{-0.3cm}\@author}

     \\[0.7cm]

        \fcolorbox{qianzi}{qianfen}{\heiti 版本：\hspace*{-0.3cm}\@vision }  
        
        %\\[0.7cm]

        %\fcolorbox{qianzi}{qianfen}{\heiti 时间：\hspace*{-0.3cm}\@date }
           
       };
        
      
        \node [font=\LARGE,align=center,anchor=south,inner xsep=3mm,inner ysep=3mm] at ([yshift=0.05\textheight]current page.south){\heiti  \@slogan};
        
        \node[] at ([yshift=0\textheight]current page.center){\includegraphics[scale=1.0]{fengmian/pig1.pdf}};
        \node[anchor=south,inner xsep=3mm,inner ysep=3mm,scale=1.8] at([yshift=0.2\textheight,xshift=-0.1\textwidth]current page.south){\color{black!30!white}\heiti
        $ \int_{a}^{b}f(x)\,\mathrm{d}x=F(b)-F(a) $
        };
        \node[anchor=north,inner xsep=3mm,inner ysep=3mm,scale=1.8,rotate=30] at([yshift=-0.2\textheight,xshift=-0.1\textwidth]current page.north){\color{black!30!white} \heiti
           
           $ \int\limits_{\gamma}f(z)\,\mathrm{d}z=2\pi i\sum_{k=1}^{n}\mathsf{Res}(f,z_{k}) $  
        
        };
        \end{tikzpicture}
        
    \end{titlepage}}

%-----Color-------%
\definecolor{qianfen}{RGB}{255 ,228, 225}
\definecolor{hailan}{RGB}{0, 191 ,255}
\definecolor{qianzi1}{RGB}{255 ,20 ,147}
\definecolor{qianzi}{RGB}{148 ,0 ,211}
\definecolor{hailan1}{RGB}{0 ,245, 255}
\definecolor{qianlv}{RGB}{0, 255, 127}
\definecolor{hyperrefcolor}{RGB}{153 ,50, 204}

\definecolor{structurecolor}{RGB}{0,120,2}
%------define command-------%


\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt,font=\bfseries\small,fill=qianfen!50] (char) {\textcolor{red}{#1}};}}









%-------tcolorbox---------%
\newtcolorbox{name}{colframe=qianzi,colback=qianfen,left=4pt,right=4pt,top=7pt,bottom=7pt,sharp corners=all,text width=2em}




\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  colorlinks,
  linkcolor=hyperrefcolor,
  citecolor=hyperrefcolor,
  urlcolor=hyperrefcolor,
  plainpages=false,
  linktocpage
}


\ctexset{contentsname =\color{blue} 目录,
chapter = {
name={\textcolor{qianzi}{第},\textcolor{qianzi}{章}},
  numberformat = \color{hailan}\zihao{1}\itshape,
		 format = \Huge\bfseries\raggedright,
		pagestyle = empty
},section = {
format = \Large \bfseries\raggedright,}	,
}





%------目录-------%
      
\newcommand\boxedd[1]{
   \begin{tcolorbox}
     [ nobeforeafter ,fontupper=\large\bfseries,fontlower=\large\bfseries,colframe=white,colupper=white,colback=hailan,top=0mm,bottom=0pt,left=2pt,right=1pt,arc=0pt,outer arc=0pt,bicolor,sidebyside,boxrule=0pt,halign=center,halign lower=left,lefthand width=7em,sidebyside gap=3mm,colbacklower=gray!20]\thecontentslabel\tcblower #1
   \end{tcolorbox}
   
}

\newcommand\boxeddd[1]{
    \begin{tcolorbox}
      [ nobeforeafter ,fontupper=\large\bfseries,fontlower=\large\bfseries,colframe=white,colupper=white,colback=hailan,top=0mm,bottom=0pt,left=2pt,right=1pt,arc=0pt,outer arc=0pt,bicolor,sidebyside,boxrule=0pt,halign=center,halign lower=left,lefthand width=7em,sidebyside gap=3mm,colbacklower=gray!20]#1 \tcblower 
    \end{tcolorbox}
    
 }
 \titlecontents{chapter}[0mm]
 {\addvspace{0.5em}}
 {\boxedd}
 {\boxeddd}
 {}
 [\addvspace{0.3em}]  
