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
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",      opts = {} },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        }
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    "sainnhe/gruvbox-material",
    "navarasu/onedark.nvim",
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    { "bluz71/vim-nightfly-colors",          name = "nightfly", lazy = false, priority = 1000 },
    { "bluz71/vim-moonfly-colors",           name = "moonfly",  lazy = false, priority = 1000 },
    "ThePrimeagen/git-worktree.nvim",
    "AlexvZyl/nordic.nvim",
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    "folke/tokyonight.nvim",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
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
    --testing new colorscheme
    "savq/melange-nvim",
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
    "onsails/lspkind.nvim",

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
    },

    --commenter
    "numToStr/Comment.nvim",

    --lualine
    "nvim-lualine/lualine.nvim",

    --fugitive
    "tpope/vim-fugitive",

    --gitsigns
    "lewis6991/gitsigns.nvim",

    --lsp loading spinner
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
    },

    --autoclose brackets
    "m4xshen/autoclose.nvim",

    --neorg
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},  -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = {      -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/neorg-notes",
                            },
                        },
                    },
                },
            }
        end,
    },
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
