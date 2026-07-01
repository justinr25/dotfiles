-- ================================================================================================
-- TITLE : globals
-- ABOUT : you may have different global & local leaders
-- ================================================================================================

-- Prepend Mason bin directory to Neovim's PATH environment variable
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Set up leaders before any keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "
