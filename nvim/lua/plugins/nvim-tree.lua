-- ================================================================================================
-- TITLE : nvim-tree.lua
-- ABOUT : A file explorer tree for Neovim, written in Lua.
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-tree.lua
-- ================================================================================================

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false, -- Show hidden files (dotfiles)
			},
			view = {
				adaptive_size = true,
			},
		})

        -- Set keymaps
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })
	end,
}
