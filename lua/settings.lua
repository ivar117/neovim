--https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
local g = vim.g
local o = vim.o
local bo = vim.bo

--General settings--
g.mapleader = ','

vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o') --disable autocommenting
o.termguicolors = true 
--o.nocompatible = true --Deprecated/Funkar inte
o.spelllang = "en" --Standard språket för spellcheck vid set spell
vim.cmd('filetype plugin on')
o.mouse = 'a' --Sätt på mus

o.number = true
o.numberwidth = 8 --space between line numbers and left edge of screens
o.cursorline = true 
o.relativenumber = true
o.clipboard = 'unnamedplus' --neovim respects os clipboard

o.ignorecase = true
o.smartcase = true --override ignorecase om det man söker på innehåller stor bokstav

o.splitbelow = true
o.splitright = true

o.smartindent = true
o.autoindent = true

--o.nohls = true --Deprecated/Funkar inte
--o.guicursor = 'a:blinkon1' --if on the cursor won't change when switching mode, doesn't work
--o.noshowmode = true
--g.maplocalleader = ','

vim.cmd 'imap <C-BS> <C-W>' --funkar ej för att få ctrl-backspace funktionalitet

vim.cmd([[
	command WQ wq
	command Wq wq
	command W w
	command Q q
]])

--Plugins settings--

g.tex_flavor = 'latex'

require("nvim-autopairs").setup {}

--Nerdtree
g.NERDTreeDirArrowExpandable = ' '
g.NERDTreeDirArrowCollapsible = ' '
--g.NERDTreeFileNode = ''
g.NERDTreeShowLineNumbers = 1

--Emmet
--g.user_emmet_mode = ',' 
g.user_emmet_leader_key = '<C-Z>'

--Goyo settings
--vim.api([[
--vim.api.nvim_exec([[
--vim.cmd([[
--function! s:goyo_enter()
	--set linebreak
	--set spell
	--set invcursorline
	--filetype detect
--endfunction
--]])

----vim.api.nvim_exec([[
--vim.cmd([[
--function! s:goyo_leave()
	--set nolinebreak
	--set nospell
	--set cursorline
	--filetype detect
--endfunction
--]])

----vim.api.nvim_exec([[
--vim.cmd([[
	--autocmd! User GoyoEnter nested call <SID>goyo_enter()
	--autocmd! User GoyoLeave nested call <SID>goyo_leave()
--]])
vim.cmd('source $XDG_CONFIG_HOME/nvim/lua/misc.vim') --Funkar ej det som ovan att göra från lua

require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'auto',
		component_separators = '|',
	}
}

--Syntax highlighting för filer i telescope plz
require('telescope').load_extension('media_files') 
--require('telescope').setup {
    --pickers = {
      --find_files = {
	--follow = true
      --}
    --}
--}

require('nvim-treesitter.configs').setup { -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'rust', 'typescript', 'python', 'help', 'html', 'css', 'supercollider', 'javascript' },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

--Vimwiki
g.vimwiki_list = {{path = '$XDG_DATA_HOME/vimwiki/', syntax = 'markdown', ext = '.md'}}
vim.cmd([[
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
]])
--g.vimwiki_ext2syntax = {.Rmd = 'markdown', .rmd = 'markdown', .md = 'markdown', .markdown = 'markdown', .mdown = 'markdown'}
--g.vimwiki_ext2syntax = {'.Rmd' = 'markdown', '.rmd' = 'markdown', '.md' = 'markdown', '.markdown' = 'markdown', '.mdown' = 'markdown'}
--g.vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
g.vimwiki_global_ext = 0 --markdown files don't get vimwiki syntax

--Transparency
g.transparent_enabled = 'v:true'

--Coc
vim.cmd([[
	let b:coc_diagnostic_disable = 1
	let b:coc_format_disable = 1
]])

--Material theme settings
require('material').setup({
	contrast = {
		cursor_line = true,
	},
	styles = {
		comments = { italic = true },
		strings = { italic = true },
		functions = { italic = true },
		types = { italic = false },
		keywords = { bold = true },
	},
	disable = {
		background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
	},
  high_visibility = {
  	darker = true -- Enable higher contrast text for darker style
  },
	lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
})

--Indent-blankline
require("ibl").setup {
	--indent = { highlight = highlight, char = "|" }
	indent = { char = "|" }
}

--require("indent_blankline").setup {
    ---- for example, context is off by default, use this to turn it on
    --char = "|",
    --show_current_context = false,
    --show_current_context_start = false,
--}

-- Luasnip
snippet = {
  engine = {
    name = 'luasnip',
  }
}

-- Scnvim
local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

require('scnvim').setup({
        keymaps = {
                ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
                ['<C-e>'] = {
                  map('editor.send_block', {'i', 'n'}),
                  map('editor.send_selection', 'x'),
                },
                ['<CR>'] = map('postwin.toggle'),
                ['<M-CR>'] = map('postwin.toggle', 'i'),
                ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
                ['<C-k>'] = map('signature.show', {'n', 'i'}),
                ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
                ['<leader>st'] = map('sclang.start'),
                ['<leader>sk'] = map('sclang.recompile'),
                ['<F1>'] = map_expr('s.boot'),
                ['<F2>'] = map_expr('s.meter'),
                ['<F3>'] = map_expr('s.plotTree'),
          }
})
g.scnvim_snippet_format = "luasnip"
require("luasnip").add_snippets("supercollider", require("scnvim/utils").get_snippets())

g.scnvim_postwin_size = 30

-- nvim-cmp
local cmp = require'cmp'

cmp.setup({
snippet = {
	expand = function(args)
	require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	end,
	},
sources = {
	{ name = 'tags' },
	{ name = 'luasnip' }, -- For luasnip users.
}
})

-- Configure the color of the evaluation flash
vim.cmd([[ highlight SCNvimEval guifg=black guibg=white ctermfg=black ctermbg=white ]])

--Theme
--require('codedark').set()
--g.airline_theme = 'codedark'
g.material_style = 'ocean'
--vim.cmd 'colorscheme material'
vim.cmd 'colorscheme atom-dark'
vim.cmd 'highlight LineNr  ctermfg=DarkGrey guifg=DarkGrey' --line number color
vim.cmd 'highlight LineNr  ctermbg=NONE guibg=NONE' --keep terminal bg on linenr bg
vim.cmd 'highlight Normal ctermbg=NONE guibg=NONE' --keep terminal bg

--Color previews
require('colorizer').setup()
