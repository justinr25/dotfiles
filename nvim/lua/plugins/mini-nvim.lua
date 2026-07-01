-- ================================================================================================
-- TITLE : mini.nvim
-- LINKS :
--   > github : https://github.com/echasnovski/mini.nvim
-- ABOUT : Library of 40+ independent Lua modules.
-- ================================================================================================

return {
	{ "echasnovski/mini.ai", version = "*", opts = {} }, -- Smart text objects (select inside/around brackets, functions)
	{ "echasnovski/mini.comment", version = "*", opts = {} }, -- Toggle comments (gcc for line, gc for visual selection)
	--{ "echasnovski/mini.surround", version = "*", opts = {} },    -- Add, delete, replace surrounding marks (quotes, brackets)
	{ "echasnovski/mini.cursorword", version = "*", opts = {} }, -- Automatically underline matching words under the cursor
	{ "echasnovski/mini.indentscope", version = "*", opts = {} }, -- Highlight the current indentation scope block visually
	{ "echasnovski/mini.pairs", version = "*", opts = {} }, -- Automatically close bracket/quote pairs as you type
	{ "echasnovski/mini.trailspace", version = "*", opts = {} }, -- Highlight and clean up trailing whitespaces at end of lines
	--{ "echasnovski/mini.bufremove", version = "*", opts = {} },   -- Close buffers without closing/messing up window layouts
	{ "echasnovski/mini.notify", version = "*", opts = {} }, -- Sleek, non-intrusive notification manager popups
}
