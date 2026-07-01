-- ================================================================================================
-- TITLE : clangd (C/C++ Language Server) LSP Setup
-- ================================================================================================

return function(capabilities)
	vim.lsp.config("clangd", {
		capabilities = capabilities,
		filetypes = { "c", "cpp", "objc", "objcpp" },
	})
end
