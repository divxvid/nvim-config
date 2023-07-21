local ok, mason = pcall(require, "mason")
if not ok then
	print("mason load failed")
end

local ok, masonLspConfig = pcall(require, "mason-lspconfig")
if not ok then
	print("masonLspConfig load failed")
end

mason.setup()
masonLspConfig.setup()

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	print("lspconfig load failed")
end

lspconfig.lua_ls.setup({})
