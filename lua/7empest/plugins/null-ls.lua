local ok, null_ls = pcall(require, "null-ls")
if not ok then
	print("null-ls failed to load")
    return
end

null_ls.setup({
	sources = {
	},
})
