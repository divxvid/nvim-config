-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")


-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement
