require("nvim-autopairs").setup {}

require('lualine').setup {
	options = {
		icons_enabled = false
	}
}

require('material').setup({
	styles = {
		comments = { italic = true },
		strings = { --[[bold = true]] },
		functions = {  italic = true },
		types = { italic = true }
	}
})
