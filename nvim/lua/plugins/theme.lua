-- ================================================================================================
-- TITLE : Theme Configuration
-- ABOUT : Easily toggle between Catppuccin and Tokyonight
-- LINKS :
--   > Catppuccin : https://github.com/catppuccin/nvim
--   > Tokyonight : https://github.com/folke/tokyonight.nvim
-- ================================================================================================

-- Change this to "catppuccin" or "tokyonight" to switch themes!
local active_theme = "catppuccin"
-- local active_theme = "tokyonight"

return {
	-- Catppuccin Configuration
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = active_theme ~= "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = true,
				show_end_of_buffer = false,
				integrations = {
					blink_cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope = true,
					},
				},
			})
			if active_theme == "catppuccin" then
				vim.cmd.colorscheme("catppuccin")
			end
		end,
	},

	-- Tokyonight Configuration
	{
		"folke/tokyonight.nvim",
		lazy = active_theme ~= "tokyonight",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon", -- storm, moon, night, day
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
			if active_theme == "tokyonight" then
				vim.cmd.colorscheme("tokyonight")
			end
		end,
	},
}
