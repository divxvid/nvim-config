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
    --treesitter plugin for advanced syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    --Mason to manage and install LSPs/Formatters/Linters/Debuggers
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    --the best colorscheme <3
    "rose-pine/neovim",
    --utils package used by many plugins
    "nvim-lua/plenary.nvim",
    --integrates linters/formatters with lsp
    "jose-elias-alvarez/null-ls.nvim",
    --LSP related stuff
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    --Autocompletion related stuff
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",

    --telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- lazygit support
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }
}

-- optional configuration; check: https://github.com/folke/lazy.nvim
local opts = {
}

local ok, lazy = pcall(require, "lazy")
if not ok then
    print("could not load lazy plugin manager.")
    return
end
lazy.setup(plugins, opts)
