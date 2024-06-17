let mapleader =","
lua require('plugins')

"call plug#begin('~/.config/nvim/plugged')
"
""Plug 'mattn/emmet-vim' "måste fixa så inte ctrl-y krockar med coc
"Plug 'glacambre/firenvim'
"Plug 'lervag/vimtex'
"Plug 'vimwiki/vimwiki'
"Plug 'junegunn/goyo.vim'
"
"Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
"Plug 'L3MON4D3/LuaSnip'
"
"Plug 'crivotz/nvim-colorizer.lua'
"Plug 'mhinz/vim-startify'
"Plug 'xiyaowong/nvim-transparent'
"Plug 'morhetz/gruvbox'
"Plug 'preservim/nerdtree'
""Plug 'dylanaraps/wal.vim'
"Plug 'calviken/vim-gdscript3'
"Plug 'tpope/vim-surround'
"Plug 'nvim-lualine/lualine.nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'preservim/nerdcommenter'
"Plug 'windwp/nvim-autopairs'
"Plug 'sheerun/vim-polyglot'
"
"Plug 'marko-cerovac/material.nvim'
"Plug 'ozkanonur/nimda.vim'
"Plug 'phanviet/vim-monokai-pro'
"Plug 'Everblush/everblush.vim'
"Plug 'joshdick/onedark.vim'
"Plug 'tomasiser/vim-code-dark'
"Plug 'Mofiqul/vscode.nvim'
"Plug 'ghifarit53/tokyonight-vim'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ymatz/vim-latex-completion'

"call plug#end()

let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
"let g:NERDTreeFileNode = ''
let NERDTreeShowLineNumbers=1
"let g:NERDCustomDelimiters = { 'text': { 'left': '#','right': '' } }
let g:tex_flavor = 'latex'

" make sure relative line numbers are used
set nocompatible
set spelllang=sv
filetype plugin on
set mouse=a "Aktiverar musen i vim
set ic "icke case sens search
set smartcase "override ignorecase om det man söker på innehåller stor bokstav
set clipboard+=unnamedplus "Gör att man kan yanka o pastea från vim till andra program
set number relativenumber
set termguicolors 
set splitbelow splitright
set smartindent
set autoindent
imap <C-BS> <C-W>
set nohls
set guicursor+=a:blinkon1
"set noshowmode "inge popups när visual, insert osv.
lua require'colorizer'.setup()
:command WQ wq
:command Wq wq
:command W w
:command Q q
set cursorline

let g:transparent_enabled = v:true "Ger transparency

""Plugins settings

"Emmet, bättre keybinds
"let g:user_emmet_mode = 'n' 
"let g:user_emmet_leader_key = '<Space>'

"Goyo settings
function! s:goyo_enter()
	set linebreak
	set spell
	set invcursorline
	filetype detect
endfunction

function! s:goyo_leave()
	set nolinebreak
	set nospell
	set cursorline
	filetype detect
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Coc
let b:coc_diagnostic_disable = 1
let b:coc_format_disable = 1

"Vimwiki
let g:vimwiki_list = [{'path': '$XDG_DATA_HOME/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}


""Shortcuts
	
lua require('keys')

	""Dessa är för att köra kod i c från nvim, funkar bara för c och andra kompilerade språk. Gör en mer universiell version, där kollar file extension så om det är .py kör python, ksk finns en plugin redan vene.
	"map <leader>R :sp \| term ./"$(printf % \| sed 's/\..*//')" <CR>
	"map <leader><C-R> :vs \| term ./"$(printf % \| sed 's/\..*//')" <CR>
	"map <leader>r :!./"$(printf % \| sed 's/\..*//')" <CR>

	"map <leader>s :vsplit 
	"map <leader>f :filetype detect <CR>
	"map <leader>i :w! \| PlugInstall <CR>
	"map <C-c> :colorscheme 
	"map <leader>F :!setsid -f $TERMINAL -e lfub >/dev/null <CR> 
	"map <leader>t :!setsid -f $TERMINAL >/dev/null 2> <CR>
	"map <leader>T :vs \| term <CR>
	"map <leader><C-t> :sp \| term <CR>
	"map W :w! <CR>
	"map E ea
	""map <leader>w :!countword <CR>
	"map <leader>q :q! <CR>
	"map <leader><Enter> :w! \| !compiler "<c-r>%"<CR>
	"map <leader>P :w! \| !pdconvert "<c-r>%"<CR>
	"map <leader>x :! xelatex % <CR>
	"map <leader>o :w! \| !opout "<c-r>%"<CR><CR>
	"map <leader>p :! setsid -f sent % >/dev/null <CR><CR>
	"map <leader>g :Goyo <CR> 
	"map <leader>n :NERDTreeToggle<CR> 
	"map <leader>c :! pdflatex % >/dev/null <CR><CR>

	autocmd BufRead,BufNewFile *.tex set filetype=tex "Filetype detect for.tex files"
	"Filetype detect for .md files funka ej"
	autocmd BufRead,BufNewFile FileType markdown :filetype detect 

 	"Tar bort automatic commenting vid newline
	autocmd FileType * set formatoptions-=cro
	"autocmd FileType * setlocal formatoptions-=c formatoptions-=f formatoptions-=o

	autocmd BufRead,BufNewFile *.scd SCNvimStart "Supercollider start 

	"Recompile dwm on config edit.
	autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm/; doas make install

	"Recompile st on config edit.
  autocmd BufWritePost ~/.local/src/st/config.h !cd ~/.local/src/st/; doas make install
	
" Recompile dwblocks on config edit 
 	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; doas make install

" Recompile dmenu on config edit 
 	autocmd BufWritePost ~/.local/src/dmenu/config.h !cd ~/.local/src/dmenu/; doas make install

" Recompile xmenu on config edit 
 	autocmd BufWritePost ~/.local/src/xmenu/config.h !cd ~/.local/src/xmenu/; doas make install

" Recompile xmenunonint on config edit 
 	autocmd BufWritePost ~/.local/src/xmenunonint/config.h !cd ~/.local/src/xmenunonint/; doas make install

""Statusbar auto-signal
"Väder
  	autocmd BufWritePost ~/.local/bin/status/väder !sigdwmblocks 14
"stangav
 	autocmd BufWritePost ~/.local/bin/status/stangav !sigdwmblocks 6
"Tid "Gör så att silent inte press return prompt
 	autocmd BufWritePost ~/.local/bin/status/tid !sigdwmblocks 1 
"Nätverk
 	autocmd BufWritePost ~/.local/bin/status/nätverk !sigdwmblocks 2 
"Volym
	autocmd BufWritePost ~/.local/bin/status/volym !sigdwmblocks 9 
"Batteri
	autocmd BufWritePost ~/.local/bin/status/batteri !sigdwmblocks 3 
"Minne
	autocmd BufWritePost ~/.local/bin/status/minne !sigdwmblocks 7 
"Cputemp
	autocmd BufWritePost ~/.local/bin/status/cputemp !sigdwmblocks 12 
"Packages
	autocmd BufWritePost ~/.local/bin/status/packages !sigdwmblocks 5 
"ifrec
	autocmd BufWritePost ~/.local/bin/status/ifrec !sigdwmblocks 6 
"Musik
	autocmd BufWritePost ~/.local/bin/status/musik !sigdwmblocks 8

"autocmd FileType tex inoremap ;bg \begin{%DELRN%}<Enter><Enter>\end{%DELRN%}<Esc>2kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c

"Flytta upp och ner rader snabbt
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '>-2<CR>gv=gv
vnoremap <A-k> :m .-2<CR>==

inoremap ;+ <Esc>/<++><Enter>"_c4l
inoremap ;( []<Esc>i
inoremap ;) []<Esc>i
inoremap ;8 ()<Esc>i
inoremap ;9 ()<Esc>i
inoremap ;0 {}<Esc>i
"inoremap <silent><expr> <c-space> coc#refresh()

inoremap <C-H> <C-W>

"inoremap ( ()<Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

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
""<Space>{<Enter><Enter>}<Esc>ki<Tab><++><Esc>

"Detta gör att alla comments efteråt blir konstiga, lägg till i annan fil eller nåt vene

lua require('nvim.luasettings')

""Theme
let g:material_style = "darker"
colorscheme material
