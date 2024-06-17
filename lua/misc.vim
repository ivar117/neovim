function! s:goyo_enter()
	set linebreak
	set spell
	"set invcursorline
	filetype detect
endfunction

function! s:goyo_leave()
	set nolinebreak
	set nospell
	"set cursorline
	filetype detect
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" On window resize, if goyo is active, do <c-w>= to resize the window
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif

"function! ToggleCheckbox() let line = getline('.')

  "if line =~ '- \[ \]'
		"call setline('.', substitute(line, '- \[ \]', '- \[x\]', ''))
	      "elseif line =~ '- \[x\]'
		"call setline('.', substitute(line, '- \[x\]', '- \[ \]', ''))
	      "elseif line =~ '- '
		"call setline('.', substitute(line, '- ', '- \[ \] ', ''))
	      "endif
	    "endf
	    
"nnoremap <Leader>c :call ToggleCheckbox()<CR>
