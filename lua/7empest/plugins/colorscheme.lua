-- local ok, rosePine = pcall(require, "rose-pine")
-- if not ok then
-- 	print("rose-pine load failed")
--     return
-- end
--
-- rosePine.setup({
-- 	variant = 'main',
-- 	disable_italics = true,
-- })
--
-- vim.cmd('colorscheme rose-pine')
-- local ok, melange = pcall(require, "melange")
-- if not ok then
-- 	print("melange load failed")
--     -- return
-- end
vim.opt.termguicolors = true
vim.cmd.colorscheme 'melange'
