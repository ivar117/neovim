local A = vim.api
--bara gör allt till en vim.cmd ksk

vim.cmd ([[
""Html
autocmd FileType html inoremap ;1 <h1></h1><Esc>4hi
autocmd FileType html inoremap ;TE <Esc>:!cat ~/.local/share/templates/template.html \| xclip -sel clip<Enter>P

""Markdown autocmd
autocmd FileType markdown inoremap ;TE <Esc>:!cat ~/.local/share/templates/template.md \| xclip -sel clip<Enter>P

""latex autocomplete
"Begin
autocmd FileType tex inoremap ;be \begin{enumerate}<Enter><Enter>\end{enumerate}<Esc>ka<Tab>\item<Space>
autocmd FileType tex inoremap ;bi \begin{itemize}<Enter><Enter>\end{itemize}<Esc>ka<Tab>\item<Space>
autocmd FileType tex inoremap ;bc \begin{center}<Enter><Enter>\end{center}<Esc>ki
autocmd FileType tex inoremap ;bd \begin{document}<Enter><Enter>\end{document}<Esc>ki
autocmd FileType tex inoremap ;ba \begin{abstract}<Enter><Enter>\end{abstract}<Esc>ki
autocmd FileType tex inoremap ;bA \begin{align*}<Enter><Enter>\end{align*}<Esc>ki<Tab>
autocmd FileType tex inoremap ;bk \begin{columns}<Enter><Enter>\end{columns}<Esc>ki<Enter><Enter><Esc>ki
"autocmd FileType tex inoremap ;bfi \begin{figure}[]<Enter><Enter>\end{figure}<Esc>?begin{figure}<Enter>$i
autocmd FileType tex inoremap ;bfi \begin{figure}[h]<Enter><Enter>\end{figure}<Esc>ka
autocmd FileType tex inoremap ;bw \begin{wrapfigure}{}{2in}<Enter><++><Enter>\end{wrapfigure}<Esc>2k$2F{a
autocmd FileType tex inoremap ;btb \begin{tabular}{\|}<Enter>\toprule<Enter><++><Enter>\midrule<Enter><++><Enter>\bottomrule<Enter>\end{tabular}<Esc>6k$F{a
autocmd FileType tex inoremap ;bta \begin{tabular}{\|\|\|}<Enter>\hline<Enter><++><Enter>\hline<Enter>\end{tabular}<Esc>4k$F{la


autocmd FileType tex inoremap ;" ``''<Esc>hi
autocmd FileType tex inoremap ;ni \noindent
autocmd FileType tex inoremap ;np \newpage
autocmd FileType tex inoremap ;it \item<Space>
autocmd FileType tex inoremap ;is \itemsep20pt
autocmd FileType tex inoremap ;m \maketitle
autocmd FileType tex inoremap ;dc \documentclass{}<Esc>i
autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;tb \textbf{}<Esc>i
autocmd FileType tex inoremap ;ti \textit{}<Esc>i
autocmd FileType tex inoremap ;tu \underline{}<Esc>i
autocmd FileType tex inoremap ;s \section*{}<Enter><++><Esc>kf{a
autocmd FileType tex inoremap ;S \subsection*{}<Enter><++><Esc>kf{a
autocmd FileType tex inoremap ;d \setlength\parindent{0pt}
autocmd FileType tex inoremap ;gr \includegraphics[width=2in,height=\textheight,keepaspectratio]{}<Esc>i
autocmd FileType tex inoremap ;ru \rule{\linewidth}{0.2mm}
autocmd FileType tex inoremap ;ce \centering
autocmd FileType tex inoremap ;ca \caption{}<Esc>i
autocmd FileType tex inoremap ;FO \(\)<Esc>2ha
autocmd FileType tex inoremap ;FC \[\]<Esc>2ha
autocmd FileType tex inoremap ;F/ \frac{}{<++>}<Esc>6hi
autocmd FileType tex inoremap ;F* \cdot<Space>
autocmd FileType tex inoremap ;FA \approx<Space>
autocmd FileType tex inoremap ;FR \sqrt{}<Esc>i
autocmd FileType tex inoremap ;FT \text{}<Esc>i
autocmd FileType tex inoremap ;co \color{}<Esc>i
autocmd FileType tex inoremap ;lä \href{}{\color{blue}<++>}<Esc>5ba
autocmd FileType tex inoremap ;0 {}<Esc>i
autocmd FileType tex inoremap ;9 []<Esc>i
autocmd FileType tex inoremap ;fn \footnote{}<Esc>i
autocmd FileType tex inoremap ;li \par\noindent\rule{\textwidth}{0.7pt}

"Beamer
autocmd FileType tex inoremap ;os \onslide
autocmd FileType tex inoremap ;bg {<Enter>\usebackgroundtemplate{\includegraphics[width=1.0\paperwidth,keepaspectratio]{}}<Esc>2ha
autocmd FileType tex inoremap ;k \column{.5\textwidth}<Enter><Enter>
autocmd FileType tex inoremap ;bfr \begin{frame}<Enter><Enter>\end{frame}<Esc>ki\frametitle{}<Esc>i
autocmd FileType tex inoremap ;ft \frametitle{}<Esc>i
autocmd FileType tex inoremap ;p \pause<Esc>
autocmd FileType tex inoremap ;vs \vspace{em}<Esc>2hi
autocmd FileType tex inoremap ;hs \hspace{em}<Esc>2hi

"Latex Templates
autocmd FileType tex inoremap ;TE <Esc>:!cat ~/.local/share/templates/template.tex \| xclip -sel clip<Enter>P
autocmd FileType tex inoremap ;TP <Esc>:!cat ~/.local/share/templates/beamer.tex \| xclip -sel clip<Enter>P
autocmd FileType tex inoremap ;TR <Esc>:!cat ~/.local/share/templates/report.tex \| xclip -sel clip<Enter>P
"autocmd FileType tex inoremap ;TE \documentclass{article}<Enter>\usepackage[utf8]{inputenc}<Enter>\usepackage{mathptmx}<Enter>\usepackage[swedish]{babel}<Enter><Enter>\title{<++>}<Enter>\author{Ivar Bjerling}<Enter>\date{\today}<Enter><Enter>\begin{document}<Enter><Enter>\maketitle<Enter><Enter>\end{document}<Esc>gg012ja<Enter>
"autocmd FileType tex inoremap ;TS \documentclass{article}<Enter>\usepackage[utf8]{inputenc}<Enter>\usepackage{mathptmx}<Enter>\usepackage[swedish]{babel}<Enter>\setlength\parindent{0pt}<Enter>\title{}<Enter>\author{Ivar}<Enter>\date{\today}<Enter><Enter>\begin{document}<Enter><Enter>\end{document}<Esc>gg010ja

""Programmering

augroup project
  autocmd!
  autocmd BufWrite,BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

""C shortcuts
"autocmd FileType c inoremap ;FI int<Space>main()<Enter><Backspace>{<Enter><Enter><Backspace>}<Esc>ki<Tab>
autocmd FileType c inoremap ;F ()<Enter><Backspace>{<Enter><Enter><Backspace>}<Esc>ki<Tab>
autocmd FileType c inoremap ;0 {<Enter><Enter><Backspace>}<Esc>ki<Tab>
autocmd FileType c inoremap ;c /*<Space>*/<Esc>2hi<Space>
autocmd FileType c inoremap ;wh while<Space>() <++><Esc>5hi<Backspace>(
"autocmd FileType c inoremap ;wh while<Space>() {<Enter><Enter><Esc>:s/.//g<Enter>i}<Esc>ka<Tab>
autocmd FileType c inoremap ;if if<Space>() <++><Esc>5hi<Backspace>(
autocmd FileType c inoremap ;fo for<Space>() <++><Esc>5hi<Backspace>(
autocmd FileType c inoremap ;pr printf("");<Esc>2hi
autocmd FileType c inoremap ;sc scanf("%", <++>);<Esc>8hi
autocmd FileType c inoremap ;in #include <.h><Esc>2hi
autocmd FileType c inoremap ;in #include <.h><Esc>2hi
autocmd FileType c inoremap ;de #define<Space>

"template(s)
autocmd FileType c,cpp inoremap ;TE <Esc>:!cat ~/.local/share/templates/template.c \| xclip -sel clip<Enter>P
]])
