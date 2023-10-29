local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("treesitter load failed")
    return
end

treesitter.setup({
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>", -- set to `false` to disable one of the mappings
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
})
