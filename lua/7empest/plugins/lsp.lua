local ok, mason = pcall(require, "mason")
if not ok then
	print("mason load failed")
    return
end

local ok, masonLspConfig = pcall(require, "mason-lspconfig")
if not ok then
	print("masonLspConfig load failed")
    return
end

mason.setup()
masonLspConfig.setup()

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	print("lspconfig load failed")
    return
end

--NOTE: add all lsp names to installed_lsps table in nvim-cmp for autocompletion suggestions
lspconfig.lua_ls.setup({})

--keymaps
--to restart the lsp
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>")
