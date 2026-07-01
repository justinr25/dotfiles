-- ================================================================================================
-- TITLE : blink.cmp
-- ABOUT : Modern high-performance autocompletion engine written in Rust.
-- LINKS :
--   > github : https://github.com/Saghen/blink.cmp
-- ================================================================================================

return {
	"Saghen/blink.cmp",
	lazy = false,
	dependencies = "rafamadriz/friendly-snippets",
	version = "*", -- Use latest stable release (pre-compiled binary)

	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		-- Configure command-line autocompletion
		cmdline = {
			keymap = { preset = "inherit" },
			completion = { menu = { auto_show = true } },
		},
	},
}
