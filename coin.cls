%Essa classe foi fortemente inspirada e teve trechos copiados do open source evan.sty ( https://github.com/vEnhance/dotfiles/blob/main/texmf/tex/latex/evan/evan.sty )
%BOOST SOFTWARE LICENSE - VERSION 1.0 - 17 AUGUST 2003
%
% Copyright (c) 2023 Evan Chen [evan at evanchen.cc]
% https://web.evanchen.cc/ || github.com/vEnhance
%
% Available for download at:
% https://github.com/vEnhance/dotfiles/blob/main/texmf/tex/latex/evan/evan.sty
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coin}
\LoadClass[twoside,12pt]{article}
\ProcessOptions\relax
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{graphicx,float}
\RequirePackage[margin=1.2in]{geometry}
\RequirePackage[portuguese]{babel}
\RequirePackage{booktabs,csquotes}
\RequirePackage{ifthen,import}
\RequirePackage{tikz,asymptote}
\RequirePackage{enumitem,lipsum,multicol}
\RequirePackage[sorting=none,backend=biber,style=numeric]{biblatex}
\RequirePackage{amssymb,amsfonts,amsmath,amsthm,xparse,tipa,thmtools}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{pifont}
\RequirePackage{soul,emptypage,float}
\RequirePackage{fancyhdr,titlesec}
\RequirePackage[framemethod=TikZ]{mdframed}
%Pacotes importados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cores e estilos
\definecolor{bblue}{rgb}{0.36,0.44,0.66}%Azul fofinho

\newcommand{\bfont}{\fontfamily{lmss}\selectfont}%fonte bonitinha

\hypersetup{
colorlinks=true,
linkcolor=purple,
urlcolor=blue,
filecolor=RubineRed,
linktocpage=true,
}%cores dos links

\newcommand{\tbox}[1]{\setlength{\fboxrule}{3pt}\fbox{#1}\setlength{\fboxrule}{0.4pt}}%caixinha

\newcommand{\hrulebar}{\par\noindent\hspace{\fill}\rule{0.95\linewidth}{.7pt}\hspace{\fill}
  \par\nointerlineskip \vspace{\baselineskip}}%barrinha
\newcommand{\emfase}[1]{\bfont\textbf{\hl{#1}}\normalfont}
\newcommand{\destaque}[1]{\textbf{\bfont\textcolor{Blue}{#1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\headheight}{25pt}
\addtolength{\topmargin}{-9pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Definição dos headers e footers
\fancypagestyle{plain}{
\fancyfoot{}
\fancyhead{}
\renewcommand{\headrule}{}
\fancyfoot[LO,RE]{\rule{1.5in}{.4pt}\par\thepage}
}

\fancypagestyle{ffancy}{
\fancyhead{}
\fancyfoot{}
\fancyhead[RE]{\bfseries\bfont\@title}
\fancyhead[LO]{\bfont\nouppercase{\leftmark}}
\fancyhead[CE]{\large\bfseries\bfont COIN Project}
\fancyhead[CO]{\centering\includegraphics[height=0.7cm]{coin.png}}
\fancyfoot[RE,LO]{\rule{1.5in}{.4pt}\par\thepage}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Titulos
\renewcommand{\maketitle}[1]{
\newgeometry{left=0pt,top=0pt,bottom=0pt}
\begin{titlepage}\begin{multicols}{2}
{\color{bblue}\rule{2.5in}{\textheight}}\\
\begin{flushright}
\bfseries
\vspace{5cm}
\fontsize{30pt}{20pt}\bfont \@title\\
\bigskip
\Large Projeto COIN 
\hspace{.4cm}\includegraphics[height=0.7cm]{coin.png}\\
\vspace{3cm}
\tbox{\centering\includegraphics[height=8cm]{#1}}\\
\vspace{4cm}
\hrulefill
\begin{flushleft}
\normalfont\large Material criado por: \em\@author
\end{flushleft}
\end{flushright}
\end{multicols}\end{titlepage}\restoregeometry
}%Fazendo o Título lindo

\titleformat{\section}[hang]{\Large \bfseries \bfont }{}{1cm}{\noindent\fbox{\textcolor{purple}{\thesection}} }[\hrulebar]%titulo de secao
\titleformat{\subsection}[hang]{\large \bfseries \bfont}{}{1em}{\textcolor{purple}{$\blacksquare$} }[]%titulo de subsecao
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Comandos matemáticos para facilitar
% Esses comandos sao inspirados/copiados pelo evan.sty
%Geometria
\newcommand{\ol}[1]{\overline{#1}}
\newcommand{\wtil}[1]{\widetilde{#1}}%til
\newcommand{\what}[1]{\widehat{#1}}%chapéu
\newcommand{\arc}[1]{{%arco
  \setbox9=\hbox{#1}%
  \ooalign{\resizebox{\wd9}{\height}{\texttoptiebar{\phantom{A}}}\cr#1}}}
\newcommand{\dangle}{\measuredangle}%ângulo direcionado
\newcommand{\dg}{^\circ}%grau
\newcommand{\ray}[1]{\overrightarrow{#1}}%semirreta
\newcommand{\seg}[1]{\overline{#1}}%segmento

%TN
\DeclareMathOperator{\mdc}{mdc}%mdc
\DeclareMathOperator{\mmc}{mmc}%mmc
\DeclareMathOperator{\sgn}{sgn}%sinal
\DeclareMathOperator{\id}{id}%identidade
\let\ord\relax
\DeclareMathOperator{\ord}{ord}%ordem
\DeclareMathOperator{\vp}{\nu}%valorizacao p-adica

%Comb e Conjuntos
\newcommand{\CC}{\mathbb C}%complexos
\newcommand{\FF}{\mathbb F}%corpo
\newcommand{\NN}{\mathbb N}%naturais
\newcommand{\QQ}{\mathbb Q}%racionais
\newcommand{\RR}{\mathbb R}%reais
\newcommand{\ZZ}{\mathbb Z}%inteiros
\newcommand{\EE}{\mathbb E}%valor esperado
\newcommand{\PP}{\mathbb P}%plano projetivo
\newcommand{\pencil}{\mathcal C}
%Outras coisas
\newcommand{\cbrt}[1]{\sqrt[3]{#1}}%raiz cubica
\newcommand{\eps}{\varepsilon}%epsilon diferente
\DeclareMathOperator{\cis}{cis}%cis (complexos)
\DeclareMathOperator{\sen}{sen}%seno brasileiro
\DeclareMathOperator{\tg}{tg}%tangente brasileira
\newcommand{\cycsum}{\sum_{\mathrm{cic}}}%somatorio ciclico
\newcommand{\symsum}{\sum_{\mathrm{sim}}}%somatorio simetrico
\newcommand{\cycprod}{\prod_{\mathrm{cic}}}%produtorio ciclico
\newcommand{\symprod}{\prod_{\mathrm{sim}}}%produtorio simetrico
\DeclareMathOperator{\re}{Re}%parte real
\DeclareMathOperator{\im}{Im}%parte imaginaria
\DeclareMathOperator{\img}{im}%imagem
\newcommand{\inv}{^{-1}}%inverso
\newcommand{\half}{\frac{1}{2}}%meio
\newcommand{\bcha}[1]{\left\lbrace #1 \right\rbrace}%chaves elegante 
\newcommand{\bpar}[1]{\left( #1 \right)} %parenteses elegante
\newcommand{\bcol}[1]{\left[ #1 \right]} %colchetes elegante
\newcommand{\bvec}[1]{\left< #1 \right>} %vetor elegante
\newcommand{\abs}[1]{\left\lvert #1 \right\rvert}%modulo
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}%modulo duplo
\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}%teto
\newcommand{\ceil}[1]{\left\lceil #1 \right\rceil}%piso
\newcommand{\then}{\Rightarrow}%entao
\newcommand{\xmark}{\textcolor{red}{\ding{55}}}%cross, nao
\newcommand{\absurd}{\bfont\textcolor{red}{ABS \xmark}}%absurdo
\newcommand{\cmark}{\textcolor{LimeGreen}{\ding{51}}}%check
\renewcommand{\qed}{\hspace{1cm} $\blacksquare$}%qed
\newcommand{\dev}[3][1]{
\ifnum #1=1
\frac{d#2}{d#3}
\else
\frac{d^{#1}#2}{d#3^{#1}}
\fi
}%derivada
\newcommand{\pardev}[3][1]{
\ifnum#1=1
\frac{\partial#2}{\partial#3}
\else
\frac{\partial^{#1}#2}{\partial#3^{#1}}
\fi
}%derivada parcial
\newcommand{\upbrace}[2]{\overbrace{#1}^{#2}}
\newcommand{\downbrace}[2]{\underbrace{#1}_{#2}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Definicao pro asy do evan (copiado)
\begin{asydef}
    defaultpen(fontsize(10pt));
    size(8cm); // set a reasonable default
    usepackage("amsmath");
    usepackage("amssymb");
    settings.tex="pdflatex";
    settings.outformat="pdf";
    // Replacement for olympiad+cse5 which is not standard
    import geometry;
    // recalibrate fill and filldraw for conics
    void filldraw(picture pic = currentpicture, conic g, pen fillpen=defaultpen, pen drawpen=defaultpen)
      { filldraw(pic, (path) g, fillpen, drawpen); }
    void fill(picture pic = currentpicture, conic g, pen p=defaultpen)
      { filldraw(pic, (path) g, p); }
    // some geometry
    pair foot(pair P, pair A, pair B) { return foot(triangle(A,B,P).VC); }
    pair centroid(pair A, pair B, pair C) { return (A+B+C)/3; }
    // cse5 abbreviations
    path CP(pair P, pair A) { return circle(P, abs(A-P)); }
    path CR(pair P, real r) { return circle(P, r); }
    pair IP(path p, path q) { return intersectionpoints(p,q)[0]; }
    pair OP(path p, path q) { return intersectionpoints(p,q)[1]; }
    path Line(pair A, pair B, real a=0.6, real b=a) { return (a*(A-B)+A)--(b*(B-A)+B); }
    // cse5 more useful functions
    picture CC() {
      picture p=rotate(0)*currentpicture;
      currentpicture.erase();
      return p;
    }
    pair MP(Label s, pair A, pair B = plain.S, pen p = defaultpen) {
      Label L = s;
      L.s = "$"+s.s+"$";
      label(L, A, B, p);
      return A;
    }
    pair Drawing(Label s = "", pair A, pair B = plain.S, pen p = defaultpen) {
      dot(MP(s, A, B, p), p);
      return A;
    }
    path Drawing(path g, pen p = defaultpen, arrowbar ar = None) {
      draw(g, p, ar);
      return g;
    }
    void rightang(point A,point B,point C){
    point P,Q,R;
    P=.08*unit(A-B)+B;
    Q=.08*unit(C-B)+B;
    R=P+Q-B;
    draw(P--R--Q,blue);
    }
\end{asydef}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ambientes Matematicos
\usetikzlibrary{shadows}
    % https://tex.stackexchange.com/a/292090/76888
    % https://github.com/marcodaniel/mdframed/issues/12
    \mdfdefinestyle{mdbluebox}{%
      roundcorner=10pt,
      linewidth=1pt,
      skipabove=12pt,
      innerbottommargin=9pt,
      skipbelow=2pt,
      linecolor=BlueViolet,
      nobreak=true,
      backgroundcolor=Blue!5,
    }
    \declaretheoremstyle[
      headfont=\sffamily\bfseries\color{Blue},
      mdframed={style=mdbluebox},
      headpunct={\\[3pt]},
      postheadspace={0pt}
    ]{thmbluebox}
    \mdfdefinestyle{mdredbox}{%
      linewidth=0.5pt,
      skipabove=12pt,
      frametitleaboveskip=5pt,
      frametitlebelowskip=0pt,
      skipbelow=2pt,
      frametitlefont=\bfseries,
      innertopmargin=4pt,
      innerbottommargin=8pt,
      nobreak=true,
      backgroundcolor=Salmon!5,
      linecolor=RawSienna,
    }
    \declaretheoremstyle[
      headfont=\bfseries\color{RawSienna},
      mdframed={style=mdredbox},
      headpunct={\\[3pt]},
      postheadspace={0pt},
    ]{thmredbox}

\mdfdefinestyle{mdpinkbox}{%
      linewidth=0.5pt,
      skipabove=12pt,
      frametitleaboveskip=5pt,
      frametitlebelowskip=0pt,
      skipbelow=2pt,
      frametitlefont=\bfseries,
      innertopmargin=4pt,
      innerbottommargin=8pt,
      nobreak=true,
      backgroundcolor=Thistle!15,
      rightline=false,
      leftline=false,
      topline=false,
      bottomline=false,
    }
    \declaretheoremstyle[
      headfont=\sffamily\bfseries\color{RubineRed!40!black},
      mdframed={style=mdpinkbox},
      headpunct={\\[3pt]},
      postheadspace={0pt},
    ]{thmpinkbox}

    \mdfdefinestyle{mdgreenbox}{%
      skipabove=8pt,
      skipbelow=0pt,
      linewidth=2pt,
      rightline=false,
      leftline=true,
      topline=false,
      bottomline=false,
      linecolor=ForestGreen,
      backgroundcolor=ForestGreen!5,
    }
    \declaretheoremstyle[
      headfont=\bfseries\sffamily\color{ForestGreen!70!black},
      bodyfont=\normalfont,
      spaceabove=2pt,
      spacebelow=1pt,
      mdframed={style=mdgreenbox},
      headpunct={ --- },
    ]{thmgreenbox}
\declaretheoremstyle[
      headfont=\bfseries\sffamily\color{ForestGreen!70!black},
      bodyfont=\normalfont,
      spaceabove=2pt,
      spacebelow=1pt,
      mdframed={style=mdgreenbox},
    ]{thmgrenbox}
    \mdfdefinestyle{mdblackbox}{%
      skipabove=8pt,
      linewidth=3pt,
      rightline=false,
      leftline=true,
      topline=false,
      bottomline=false,
      linecolor=black,
      backgroundcolor=RedViolet!5!gray!5,
    }
    \declaretheoremstyle[
      headfont=\bfseries,
      bodyfont=\normalfont\small,
      spaceabove=0pt,
      spacebelow=0pt,
      mdframed={style=mdblackbox}
    ]{thmblackbox}
    \mdfdefinestyle{mdyellowbox}{%
      skipabove=8pt,
      skipbelow=0pt,
      linewidth=2pt,
      rightline=false,
      leftline=true,
      topline=false,
      bottomline=false,
      linecolor=Yellow,
      backgroundcolor=GreenYellow!20,
    }
    \declaretheoremstyle[
      headfont=\sffamily\bfseries\color{Yellow!50!Sepia},
      bodyfont=\normalfont\small,
      spaceabove=2pt,
      spacebelow=1pt,
      mdframed={style=mdyellowbox}
    ]{thmyellowbox}
    \newcommand{\listhack}{$\empty$\vspace{-2em}}
    \theoremstyle{definition}
    \declaretheorem[style=thmbluebox,name=Teorema]{theorem}
    \declaretheorem[style=thmbluebox,name=Lema,sibling=theorem]{lemma}
      \declaretheorem[style=thmpinkbox,name=Proposição]{proposition}
      \declaretheorem[style=thmpinkbox,name=Corolário]{corollary}[parent=theorem]
      \declaretheorem[style=thmbluebox,name=Teorema,numbered=no]{theorem*}
      \declaretheorem[style=thmbluebox,name=Lema,numbered=no]{lemma*}
      \declaretheorem[style=thmpinkbox,name=Proposição,numbered=no]{proposition*}
      \declaretheorem[style=thmpinkbox,name=Corolário,numbered=no]{corollary*}
      \declaretheorem[style=thmgreenbox,name=Algoritmo,numbered=no]{algorithm}
      \declaretheorem[style=thmgrenbox,name=Solução Guiada,numbered=no]{walkthrough}
      \declaretheorem[style=thmredbox,name=Exemplo]{example}
      \declaretheorem[style=thmredbox,name=Exemplo,numbered=no]{example*}
      \declaretheorem[style=thmblackbox,name=Nota,numbered=no]{remark}
      \declaretheoremstyle[
        headfont=\color{blue!40!black}\normalfont\bfseries,
        spaceabove=8pt,
        spacebelow=8pt,
        bodyfont=\normalfont
      ]{basehead}
    \declaretheorem[style=thmgreenbox,name=Definição]{definition}
    \declaretheorem[style=thmgreenbox,name=Definição,numbered=no]{definition*}
      \declaretheorem[style=thmyellowbox,name=Afirmação,numbered=no]{claim}
    \declaretheorem[style=thmyellowbox,name=Fato]{fact}
    \declaretheorem[style=thmyellowbox,name=Fato,numbered=no]{fact*}
    \declaretheorem[style=basehead,name=Problema]{problem}
\newcounter{step}
\newenvironment{solution}[2][1,Boldenkryptz]{
\par \medskip
\setcounter{step}{1}
\ifnum #1=1 \emph{Solução} \fi
\ifnum #1=2 \emph{Demonstração} \fi
\ifnum #1=3 \emph{#2} \fi
\par%
\leftskip=4em\rightskip=2em%
\ignorespaces\noindent}{\qed
\par\medskip}
\newenvironment{step}[1][Passo ~\thestep]{
\par \medskip \indent
$\circ$~{\bfont\color{teal}\textbf{#1:}}
}{
\par \medskip
}

