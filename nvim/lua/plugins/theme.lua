-- ================================================================================================
-- TITLE : catpuccin
-- ABOUT : A popular, soothing colorscheme for Neovim
-- LINKS :
--   > github : https://github.com/catppuccin/nvim
-- ================================================================================================

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true, -- Enable transparent background
        show_end_of_buffer = false, -- Hide ~ at end of buffer
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
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
