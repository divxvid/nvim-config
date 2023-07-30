local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    print("gitsigns cannot be loaded")
end

gitsigns.setup()
