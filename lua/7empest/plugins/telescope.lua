local ok, telescope = pcall(require, "telescope")
if not ok then
    print("telescope failed to load")
end

local ok, builtin = pcall(require, "telescope.builtin")
if not ok then
    print("telescope builtin could not be loaded")
    return
end

telescope.setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },
    },
})

--keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>sG', builtin.live_grep, {})
vim.keymap.set('n', '<leader>,', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {})
--vim.keymap.set('n', '<leader>ts', builtin.lsp_document_symbols, {}) -- using treesitter instead of lsp
vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})
vim.keymap.set('n', '<leader>sg', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>qf', builtin.quickfix, {})
