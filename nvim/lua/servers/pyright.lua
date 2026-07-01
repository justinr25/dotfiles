-- ================================================================================================
-- TITLE : pyright (Python Language Server) LSP Setup
-- ================================================================================================

return function(capabilities)
	vim.lsp.config("pyright", {
		capabilities = capabilities,
		filetypes = { "python" },
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
					typeCheckingMode = "basic",
				},
			},
		},
	})
end
