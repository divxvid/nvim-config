local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	print("treesitter load failed")
    return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
    autotag = {
        enable = true,
        filetypes = {"html", "xml", "jsx", "tsx", "php", "heex", "html.heex"},
    }
})
