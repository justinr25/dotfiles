-- ================================================================================================
-- TITLE : ts_ls (TypeScript/JavaScript Language Server) LSP Setup
-- ================================================================================================

return function(capabilities)
	vim.lsp.config("ts_ls", {
		capabilities = capabilities,
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		settings = {
			typescript = {
				indentStyle = "space",
				indentSize = 4,
			},
		},
	})
end
