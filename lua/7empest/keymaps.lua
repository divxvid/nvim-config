-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")


-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

keymap.set("n", "<leader>e", ":Explore<CR>") --open netrw file explorer
keymap.set("n", "<leader>dd", ":bdelete<CR>") --deletes the current buffer
