local capabilities = {}
local ok, blink = pcall(require, "blink.cmp")
if ok then
	capabilities = blink.get_lsp_capabilities()
end

-- Load modular server setups
require("servers.lua_ls")(capabilities)
require("servers.efm-langserver")(capabilities)
require("servers.pyright")(capabilities)
require("servers.ts_ls")(capabilities)
require("servers.clangd")(capabilities)
require("servers.emmet_ls")(capabilities)
require("servers.tailwindcss")(capabilities)

-- Enable all servers globally for matching filetypes
vim.lsp.enable({
	"lua_ls",
	"efm",
	"pyright",
	"ts_ls",
	"clangd",
	"emmet_ls",
	"tailwindcss",
})
