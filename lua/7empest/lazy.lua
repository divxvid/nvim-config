local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"folke/which-key.nvim",
	"nvim-treesitter/nvim-treesitter",
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},
	"rose-pine/neovim",
	"nvim-lua/plenary.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
}

-- optional configuration; check: https://github.com/folke/lazy.nvim
local opts = {
}

require("lazy").setup(plugins, opts)
