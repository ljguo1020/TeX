\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{exam-zh-cn}[2021/11/06 v1.0]
\LoadClass{ctexart}
\RequirePackage{amsmath,amssymb,amsfonts,amsxtra,upgreek,bm}
\RequirePackage{graphicx,pifont,xeCJKfntef}
\RequirePackage{expl3}
\RequirePackage{xparse}

\RequirePackage{lastpage,eso-pic}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage[a3paper,landscape,twocolumn,left=3cm,right=2cm,top=2cm,bottom=3cm]{geometry}
\setlength{\columnsep}{2cm}

\NewDocumentCommand{\circled}{m}{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt] (char) {#1};}}

\DeclareRobustCommand*\class[1]{\gdef\@class{#1}}

\RenewDocumentCommand{\maketitle}{}{%
\begin{center}
    {\zihao{3}\@title}\\\vspace*{0.3cm}
		{\zihao{-2}\heiti \@class}
\end{center}
\AddToShipoutPictureBG{\begin{tikzpicture}[remember picture,overlay]
    \coordinate (a) at ([yshift=2cm]current page.south west);
    \coordinate (b) at ([yshift=2cm]current page.south east);
    \coordinate (c) at ([yshift=-2cm]current page.north west);
    \node[] at ($(a)!1/4!(b)$) {第~\thepage~页~ （共~\pageref{LastPage}~页）};
    \node[] at ($(a)!3/4!(b)$) {\stepcounter{page}第~\thepage~页~ （共~\pageref{LastPage}~页）};    
\end{tikzpicture}}
\begin{tikzpicture}[remember picture,overlay]
\coordinate (a) at ([shift={(2.5,0)}]current page.south west);
\coordinate (c) at ([shift={(2.5,0)}]current page.north west); 
\draw[thick](a)--(c); 
\node[rotate=90,scale=1.2,inner sep=0pt] (xm) at  ($([xshift=-1.5cm]a)!0.15!([xshift=-1.5cm]c)$){姓名:};
\def\x{3.5}
\draw[thick] (xm.south east)--++(0,\x);
\node[rotate=90,scale=1.2,inner sep=0pt] (bj) at ($([xshift=-1.5cm]a)!0.35!([xshift=-1.5cm]c)$) {班级:};
\draw[thick] (bj.south east)--++(0,\x);
\node[rotate=90,scale=1.2,inner sep=0pt] (zwh) at ($([xshift=-1.5cm]a)!0.55!([xshift=-1.5cm]c)$) {座位号:};
\draw[thick] (zwh.south east)--++(0,\x);
\node[rotate=90,scale=1.2,inner sep=0pt] (kh) at ($([xshift=-1.5cm]a)!0.75!([xshift=-1.5cm]c)$) {考号:};
\draw[thick] (kh.south east)--++(0,\x);
\end{tikzpicture}

}

\pagestyle{empty}

\ExplSyntaxOn
\cs_new_protected:Npn \g_choice: #1#2#3#4 {
  \par\noindent
\box_clear_new:N \l_choiceA_box
\box_clear_new:N \l_choiceB_box
\box_clear_new:N \l_choiceC_box
\box_clear_new:N \l_choiceD_box

\hbox_set:Nn \l_choiceA_box{A.#1~~}
\hbox_set:Nn \l_choiceB_box{B.#2~~}
\hbox_set:Nn \l_choiceC_box{C.#3~~}
\hbox_set:Nn \l_choiceD_box{D.#4~~}

\dim_zero_new:N \l_choice_wd_max_AB
\dim_zero_new:N \l_choice_wd_max_CD 
\dim_zero_new:N \l_choice_wd_max
 \dim_set:Nn \l_choice_wd_max_AB {\dim_max:nn{\box_wd:N \l_choiceA_box}{\box_wd:N \l_choiceB_box}}
 \dim_set:Nn \l_choice_wd_max_CD {\dim_max:nn{\box_wd:N \l_choiceC_box}{\box_wd:N \l_choiceD_box}}
 \dim_set:Nn \l_choice_wd_max {\dim_max:nn{\dim_use:N \l_choice_wd_max_AB}{\dim_use:N \l_choice_wd_max_CD}}

\dim_compare:nNnTF{\dim_use:N \l_choice_wd_max} < {0.25\linewidth}
{
\box_set_wd:Nn \l_choiceA_box {0.25\linewidth}
\box_set_wd:Nn \l_choiceB_box {0.25\linewidth}
\box_set_wd:Nn \l_choiceC_box {0.25\linewidth}
\box_set_wd:Nn \l_choiceD_box {0.25\linewidth}

\box_use:N \l_choiceA_box
\box_use:N \l_choiceB_box
\box_use:N \l_choiceC_box
\box_use:N \l_choiceD_box
}
{
\dim_compare:nNnTF{\dim_use:N \l_choice_wd_max} < {0.5\linewidth}
{
\box_set_wd:Nn \l_choiceA_box {0.45\linewidth}
\box_set_wd:Nn \l_choiceB_box {0.45\linewidth}
\box_set_wd:Nn \l_choiceC_box {0.45\linewidth}
\box_set_wd:Nn \l_choiceD_box {0.45\linewidth}

\box_use:N \l_choiceA_box
\box_use:N \l_choiceB_box
\par\vspace*{0.5em}\hspace{2em}
\box_use:N \l_choiceC_box
\box_use:N \l_choiceD_box
}
{
\box_use:N \l_choiceA_box
\par\vspace*{0.5em}\hspace{2em}
\box_use:N \l_choiceB_box
\par\vspace*{0.5em}\hspace{2em}
\box_use:N \l_choiceC_box
\par\vspace*{0.5em}\hspace{2em}
\box_use:N \l_choiceD_box   
}
}
}
\cs_set_eq:NN \choice \g_choice:
\ExplSyntaxOff

\RequirePackage[shortlabels]{enumitem}
\RequirePackage{titlesec,titletoc}
\titleformat{\section}{ \zihao {5}\bfseries }{\chinese{section}、}{0.5em}{}

\newcommand{\tk}{\CJKunderline{\hspace{0.7cm}\ding{115}\hspace{0.7cm}}}
\newcommand{\xzt}{选择题:(每题3分，共30分)\vspace{-0.3cm}}
\newcommand{\tkt}{填空题:(每题3分，共24分)\vspace{-0.3cm}}
\newcommand{\jdt}{解答题:(共64分)\vspace{-0.3cm}}