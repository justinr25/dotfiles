-- ================================================================================================
-- TITLE : lspsaga.nvim
-- ABOUT : Highly customizable UI wrapper plugin for Neovim's built-in LSP client.
-- LINKS :
--   > github : https://github.com/nvimdev/lspsaga.nvim
-- ================================================================================================

return {
	"glepnir/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	config = function()
		require("lspsaga").setup({
			-- keybinds for navigation in lspsaga window
			move_in_saga = { prev = "<C-k>", next = "<C-j>" },
			-- use enter to open file with finder
			finder_action_keys = {
				open = "<CR>",
			},
			-- use enter to open file with definition preview
			definition_action_keys = {
				edit = "<CR>",
			},
		})
	end,
}
