local ok, worktree = pcall(require, "git-worktree")
if not ok then
    print("Cannot load git-worktree")
end

worktree.setup()
