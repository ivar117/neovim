local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- TODO:
-- Terminal: gör så att det blir som en dropdown
-- Ändrade alla \| från vim till bara |, tror inte det behöves i lua

--vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
map('n', '<leader>f', ':filetype detect <CR>') --detect filetype
map('n', '<C-c>', ':colorscheme ') --theme
map('n', '<leader>i', ':w! | PlugInstall <CR>') --install plugins
map('n', '<leader>g', ':Goyo <CR>') --Write-friendly mode
map('n', '<leader>n', ':NERDTreeToggle<CR>') --Nerdtree file browser toggle
map('n', '<leader>zf', ':Telescope find_files<CR>') --Nerdtree file browser toggle
map('n', '<leader>zh', ':Telescope help_tags<CR>') --Nerdtree file browser toggle

map('n', '<c-H>', ':noh <CR>') --Remove highlighting after search
map('n', 'W', ':w! <CR>') --write
map('n', '<leader>q', ':q! <CR>') --quit
map('n', 'E', 'ea')

map('n', '<leader>F', ':!setsid -f $TERMINAL -e lfub >/dev/null 2>&1 <CR><CR>')  
map('n', '<leader>t', ':!setsid -f $TERMINAL >/dev/null 2>&1 <CR><CR>') --open terminal in working dir
map('n', '<leader>T', ':vs | term <CR>') --vsplit terminal
map('n', '<leader><C-t>', ':sp | term <CR>') --bottom split terminal, todo gör så attare minskar den automatiskt, för stor lol https://vimtricks.com/p/splitting-to-a-specific-size/
map('n', '<leader>s', ':vsplit ') --vsplit
--
map('n', '<leader><Enter>', ':w! | !compiler "<c-r>%"<CR>' ) --compile
map('n', '<leader>o', ':w! | !opout "<c-r>%"<CR><CR>' ) --open
map('n', '<leader>x', ':! xelatex % >/dev/null <CR><CR>' ) --xelatex
map('n', '<leader>p', ':! sent % >/dev/null <CR><CR>' ) --sent presentations
map('n', '<leader><C-p>', ':! tpt % >/dev/null <CR><CR>' ) --sent presentations
map('n', '<leader>P', ':w! | !pdconvert "<c-r>%"<CR>' ) --Pandoc converter script

--Dessa är för att köra kod i c från nvim, funkar bara för c och andra kompilerade språk.
--Gör en mer universiell version vore bra, där kollar file extension så om det är .py kör python, ksk finns en plugin redan vene.
vim.cmd([[
map <leader>R :sp \| term ./"$(printf % \| sed 's/\..*//')" <CR>
map <leader><C-R> :vs \| term ./"$(printf % \| sed 's/\..*//')" <CR>
map <leader>r :!./"$(printf % \| sed 's/\..*//')" <CR>
]])
--Svårt i lua med citat
--map('n', '<leader>R', ':sp | term ./"$(printf % | sed 's/\..*//')" <CR>') --Run c program in bottom split terminal
--map('n', '<leader><C-R>', ':vs | term ./"$(printf % | sed 's/\..*//')" <CR>') --Run c program in vertical split terminal
--map('n', '<leader>r', ':w! | !./"$(printf % | sed 's/\..*//')"' ) --run c program
