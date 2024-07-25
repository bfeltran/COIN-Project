%Essa classe foi fortemente inspirada e teve trechos copiados do open source evan.sty ( https://github.com/vEnhance/dotfiles/blob/main/texmf/tex/latex/evan/evan.sty )
%%%% EVAN.STY %%%%
%BOOST SOFTWARE LICENSE - VERSION 1.0 - 17 AUGUST 2003
%
% Copyright (c) 2023 Evan Chen [evan at evanchen.cc]
% https://web.evanchen.cc/ || github.com/vEnhance
%
% Available for download at:
% https://github.com/vEnhance/dotfiles/blob/main/texmf/tex/latex/evan/evan.sty
%%%% -------- %%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coin}
\LoadClass[twoside,12pt]{article}
\ProcessOptions\relax
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[portuguese]{babel}
\RequirePackage{graphicx,float,geometry,enumitem,varwidth,calc}
\RequirePackage{ifthen,import,xparse,soul,emptypage,float,indentfirst}
\RequirePackage{tikz,asymptote,pgfplots}
\RequirePackage{biblatex}
\RequirePackage{amssymb,amsfonts,amsmath,amsthm,thmtools,pifont}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fancyhdr,titlesec}
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{units}%(https://linorg.usp.br/CTAN/macros/latex/contrib/units/units.pdf)
%Pacotes importados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cores e estilos
\newcommand{\bfont}{\sffamily\selectfont}%fonte bonitinha

\hypersetup{
colorlinks=true,
linkcolor=Cyan,
urlcolor=RubineRed,
filecolor=RubineRed,
citecolor=ForestGreen,
linktocpage=true,
}%cores dos links
\newcommand{\hrulebar}{\par\noindent\hspace{\fill}\rule{0.95\linewidth}{.7pt}\hspace{\fill}
  \par\nointerlineskip \vspace{\baselineskip}}%barrinha
  
\newcommand{\emfase}[1]{{\bfseries\bfont\hl{#1}}\normalfont}

\newcommand{\destaque}[1]{\textbf{\bfont\textcolor{purple}{#1}}}

\newgeometry{
bottom=3cm,
left=1.5cm,
right=1.5cm,
top=2.7cm,
}
\newcommand{\coin}{{\bfont\bfseries\color{teal}COIN}} %usado para mencionar o projeto coin
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
\renewcommand{\tableofcontents}{\hrulebar

\@starttoc{toc}}

\renewcommand{\maketitle}{\thispagestyle{plain}{\centering\vspace*{2cm}
\Huge\bfseries\bfont\@title\\\bigskip
\Large COIN Project \raisebox{-0.2\totalheight}{\includegraphics[height=0.7cm]{coin.png}}\\\bigskip\medskip
\normalfont \large Material criado por: \em\@author\\\vspace{1.5cm}
}\pagestyle{ffancy}
}%Fazendo o Título lindo

\titleformat{\section}[hang]{\Large  \bfseries \bfont }{\noindent\hspace{0.1cm}\fbox{\textcolor{purple}{\thesection}}}{0.2cm}{}[\hrulefill]%titulo de secao
\titlespacing{\section}{0cm}{0.7cm}{0.3cm}

\titleformat{\subsection}[hang]{\large \bfseries \bfont}{}{0.3cm}{\textcolor{purple}{$\blacksquare~$}}[]%titulo de subsecao
\titlespacing{\subsection}{0cm}{0.4cm}{0.2cm}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Comandos matemáticos para facilitar
% Esses comandos sao inspirados/copiados pelo evan.sty

\makeatletter
\DeclareFontFamily{U}{tipa}{}
\DeclareFontShape{U}{tipa}{m}{n}{<->tipa10}{}
\newcommand{\arc@char}{{\usefont{U}{tipa}{m}{n}\symbol{62}}}%

\newcommand{\arc}[1]{\mathpalette\arc@arc{#1}}

\newcommand{\arc@arc}[2]{%
  \sbox0{$\m@th#1#2$}%
  \vbox{
    \hbox{\resizebox{\wd0}{\height}{\arc@char}}
    \nointerlineskip
    \box0
  }%
}
\makeatother%arco

%Geometria
\newcommand{\ol}[1]{\overline{#1}}
\renewcommand{\ul}[1]{\underline{#1}}
\newcommand{\wtil}[1]{\widetilde{#1}}%til
\newcommand{\what}[1]{\widehat{#1}}%chapéu
\newcommand{\dangle}{\measuredangle}%ângulo direcionado
\newcommand{\dg}{^\circ}%grau
\newcommand{\ray}[1]{\overrightarrow{#1}}%semirreta
\newcommand{\seg}[1]{\overline{#1}}%segmento
\newcommand{\pencil}{\mathcal C}%Lapis de retas

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
\newcommand{\union}{\cup}%união
\newcommand{\inter}{\cap}%intersecção
%Outras coisas
\newcommand{\cbrt}[1]{\sqrt[3]{#1}}%raiz cubica
\newcommand{\eps}{\varepsilon}%epsilon diferente
\DeclareMathOperator{\cis}{cis}%cis (complexos)
\DeclareMathOperator{\sen}{sen}%seno brasileiro
\DeclareMathOperator{\tg}{tg}%tangente brasileira
\DeclareMathOperator{\senh}{senh}%seno hiperbólico brasileiro
\DeclareMathOperator{\sech}{sech}%secante hiperbólica
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
\newcommand{\absurd}{{\bfont\textcolor{red}{ABS \xmark}}}%absurdo
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

%Fisica inspirado pelo Kevin Zhou
\newcommand{\grad}{\nabla}
\newcommand{\curl}{\nabla \times}
\newcommand{\vect}[1]{\mathbf{#1}}
% improvements on existing commands
\let\oldemptyset\emptyset         % save bad looking empty set
\let\emptyset\varnothing          % good looking empty set
\let\det\relax                    % determinant with correct exponent placement
\DeclareMathOperator{\det}{det} 
\newcommand{\division}{\div}      % save old division command
\let\div\relax                    % divergence, not division
\newcommand{\div}{\nabla \cdot}
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
      backgroundcolor=blue!5,
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
      skipabove=12pt,
      skipbelow=4pt,
      linewidth=2pt,
      innertopmargin=4pt,
      innerbottommargin=8pt,
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
      linewidth=2pt,
      skipbelow=0pt,
      rightline=false,
      leftline=true,
      topline=false,
      bottomline=false,
      linecolor=Yellow,
      backgroundcolor=GreenYellow!20,
    }
    \declaretheoremstyle[
      headfont=\sffamily\bfseries\color{Yellow!50!Sepia},
      bodyfont=\normalfont,
      spaceabove=2pt,
      spacebelow=1pt,
      mdframed={style=mdyellowbox}
    ]{thmyellowbox}
    \declaretheoremstyle[
        headfont=\color{blue!40!black}\normalfont\bfseries,
        spaceabove=8pt,
        spacebelow=8pt,
        bodyfont=\normalfont
      ]{basehead}
    \mdfdefinestyle{mdyellowbox}{%
      skipabove=8pt,
      linewidth=2pt,
      skipbelow=0pt,
      rightline=false,
      leftline=true,
      topline=false,
      bottomline=false,
      linecolor=Yellow,
      backgroundcolor=GreenYellow!20,
    }
    \declaretheoremstyle[
      headfont=\sffamily\bfseries\color{Yellow!50!Sepia},
      bodyfont=\normalfont,
      spaceabove=2pt,
      spacebelow=1pt,
      mdframed={style=mdyellowbox}
    ]{thmyellowbox}
    \mdfdefinestyle{mdwaterbox}{%
      linewidth=0.5pt,
      skipabove=12pt,
      frametitleaboveskip=5pt,
      frametitlebelowskip=0pt,
      skipbelow=2pt,
      frametitlefont=\bfseries,
      innertopmargin=4pt,
      innerbottommargin=8pt,
      nobreak=true,
      backgroundcolor=BlueGreen!5,
      rightline=false,
      leftline=false,
      topline=false,
      bottomline=false,
    }
    \declaretheoremstyle[
      headfont=\sffamily\bfseries\color{blue!40!black},
      mdframed={style=mdwaterbox},
      headpunct={\\[3pt]},
      postheadspace={0pt},
    ]{thmwaterbox}
    \newcommand{\listhack}{$\empty$\vspace{-2em}}
    \theoremstyle{definition}
    \declaretheorem[style=thmbluebox,name=Teorema]{atheorem}
    \newenvironment{theorem}[1][ ]{\begin{atheorem}[#1]\label{thm\theatheorem}}{\end{atheorem}}
    \declaretheorem[style=thmbluebox,name=Teorema,numbered=no]{theorem*}
    \declaretheorem[style=thmbluebox,name=Lema,sibling=atheorem]{alemma}
    \newenvironment{lemma}[1][ ]{\begin{alemma}[#1]\label{thm\theatheorem}}{\end{alemma}}
    \declaretheorem[style=thmbluebox,name=Lema,numbered=no]{lemma*}
    %
    \declaretheorem[style=thmpinkbox,name=Proposição]{aproposition}
    \newenvironment{proposition}[1][ ]{\begin{aproposition}[#1]\label{prop\theaproposition}}{\end{aproposition}}
    \declaretheorem[style=thmpinkbox,name=Proposição,numbered=no]{proposition*}
    \declaretheorem[style=thmpinkbox,name=Afirmação,numbered=no]{claim}
    \declaretheorem[style=thmpinkbox,name=Ideia]{aidea}
    \newenvironment{idea}[1][ ]{\begin{aidea}[#1]\label{idea\theaidea}}{\end{aidea}}
    \declaretheorem[style=thmpinkbox,name=Ideia,numbered=no]{idea*}
    %
    \declaretheorem[style=thmwaterbox,name=Corolário]{acorollary}[parent=atheorem]
    \newenvironment{corollary}[1][ ]{\begin{acorollary}[#1]\label{cor\theacorollary}}{\end{acorollary}}
    \declaretheorem[style=thmwaterbox,name=Corolário,numbered=no]{corollary*}
    %
    \declaretheorem[style=thmredbox,name=Exemplo]{aexample}
    \newenvironment{example}[1][ ]{\begin{aexample}[#1]\label{ex\theaexample}}{\end{aexample}}
    \declaretheorem[style=thmredbox,name=Exemplo,numbered=no]{example*}
    %
    \declaretheorem[style=thmblackbox,name=Nota,numbered=no]{remark}
    %
    \declaretheorem[style=thmyellowbox,name=Definição]{adefinition}
    \newenvironment{definition}[1][ ]{\begin{adefinition}[#1]\label{def\theadefinition}}{\end{adefinition}}
    \declaretheorem[style=thmyellowbox,name=Definição,numbered=no]{definition*}
    \declaretheorem[style=thmyellowbox,name=Fato]{afact}
    \newenvironment{fact}[1][ ]{\begin{afact}[#1]\label{fact\theafact}}{\end{afact}}
    \declaretheorem[style=thmyellowbox,name=Fato,numbered=no]{fact*}
    %
    \declaretheorem[style=basehead,name=Problema]{aproblem}
    \newenvironment{problem}[1][ ]{\begin{aproblem}[#1]\label{p\theaproblem}}{\end{aproblem}}
    %
    \declaretheorem[style=thmgreenbox,name=Método,numbered=no]{method}
\newcounter{step}
\DeclareDocumentEnvironment{solution}{O{1}o}{
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
\par \medskip \noindent
$\circ$~{\bfont\color{teal}\textbf{#1:}}
}{
\par \medskip
}
\newcommand{\wtext}[1]{\end{enumerate}#1\begin{enumerate}[resume*]}
\newenvironment{walk}[1][]{\par\noindent\textbf{\textcolor{green!30!black}{Solução Guiada --- }}#1\begin{enumerate}[label=\bfseries(\alph*)]}{\end{enumerate}}
\mdfdefinestyle{importat}{
      linewidth=1pt,
      skipabove=12pt,
      frametitleaboveskip=5pt,
      frametitlebelowskip=0pt,
      skipbelow=2pt,
      frametitlefont=\bfseries,
      innertopmargin=8pt,
      innerbottommargin=8pt,
      nobreak=true,
      align=center,
      linecolor=ForestGreen,}
\newcommand{\important}[1]{
\newlength{\leng}
\newdimen\mywidth
\setbox0=\hbox{\bfseries#1}
\mywidth=\wd0
\ifdim\mywidth>16cm
\setlength{\leng}{16cm}
\else\setlength{\leng}{\mywidth}
\fi
\addtolength{\leng}{20pt}
\begin{mdframed}[userdefinedwidth=\leng,style=importat]
\color{ForestGreen}\bfseries#1 
\end{mdframed}
}
\mdfdefinestyle{warn}{
      linewidth=1pt,
      skipabove=12pt,
      frametitleaboveskip=5pt,
      frametitlebelowskip=0pt,
      skipbelow=2pt,
      frametitlefont=\bfseries,
      innertopmargin=8pt,
      innerbottommargin=8pt,
      nobreak=true,
      align=center,
      linecolor=BrickRed,
      backgroundcolor=Mahogany!5,}
\newcommand{\warning}[1]{
\newlength{\leng}
\newdimen\mywidth
\setbox0=\hbox{Importante! #1}
\mywidth=\wd0
\ifdim\mywidth>16cm
\setlength{\leng}{16cm}
\else\setlength{\leng}{\mywidth}
\fi
\addtolength{\leng}{20pt}
\begin{mdframed}[userdefinedwidth=\leng,style=warn]
\color{BrickRed}\textbf{\bfont Importante!~}#1 
\end{mdframed}
}
