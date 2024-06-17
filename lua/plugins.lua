local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'mattn/emmet-vim'
Plug 'glacambre/firenvim'
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'

Plug 'davidgranstrom/scnvim'--, { 'do': {-> scnvim#install() } }
--Plug('davidgranstrom/scnvim', {['do'] = {-> scnvim#install() }})
Plug 'L3MON4D3/LuaSnip'

Plug 'crivotz/nvim-colorizer.lua'
Plug 'mhinz/vim-startify'
Plug 'xiyaowong/nvim-transparent'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'calviken/vim-gdscript3'
Plug 'tpope/vim-surround'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'saadparwaiz1/cmp_luasnip'
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'preservim/nerdcommenter'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'SidOfc/mkdx' --Markdown stuff

--Plug 'sheerun/vim-polyglot'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

Plug 'nvim-lualine/lualine.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'ozkanonur/nimda.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'Everblush/everblush.vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'Mofiqul/vscode.nvim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gosukiwi/vim-atom-dark'

vim.call ('plug#end')
