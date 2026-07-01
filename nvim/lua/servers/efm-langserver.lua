-- ================================================================================================
-- TITLE : efm-langserver
-- ABOUT : a general purpose language server protocol implemented here for linters/formatters
-- LINKS :
--   > github : https://github.com/mattn/efm-langserver
--   > configs: https://github.com/creativenull/efmls-configs-nvim/tree/main
-- ================================================================================================

--- @param capabilities table LSP client capabilities (from blink)
--- @return nil
return function(capabilities)
	local selene = require("efmls-configs.linters.selene") -- Lua linter
	local stylua = require("efmls-configs.formatters.stylua") -- Lua formatter
	local flake8 = require("efmls-configs.linters.flake8") -- Python linter
	local black = require("efmls-configs.formatters.black") -- Python formatter
	local eslint_d = require("efmls-configs.linters.eslint_d") -- JS/TS/JSON linter
	local prettier_d = require("efmls-configs.formatters.prettier_d") -- JS/TS/HTML/CSS/Markdown formatter
	local fixjson = require("efmls-configs.formatters.fixjson") -- JSON formatter
	local cpplint = require("efmls-configs.linters.cpplint") -- C/C++ linter
	local clangformat = require("efmls-configs.formatters.clang_format") -- C/C++ formatter

	vim.lsp.config("efm", {
		capabilities = capabilities,
		filetypes = {
			"c",
			"cpp",
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"typescript",
			"typescriptreact",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				c = { clangformat, cpplint },
				cpp = { clangformat, cpplint },
				css = { prettier_d },
				html = { prettier_d },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				json = { fixjson, eslint_d },
				jsonc = { fixjson, eslint_d },
				lua = { selene, stylua },
				markdown = { prettier_d },
				python = { flake8, black },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
			},
		},
	})
end
