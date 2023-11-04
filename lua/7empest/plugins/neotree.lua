local ok, neotree = pcall(require, "neo-tree")
if not ok then
    print("cannot load neotree")
    return
end

neotree.setup({
    filesystem = {
        follow_current_file = {
            enabled = true,         -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        }
    }
})
