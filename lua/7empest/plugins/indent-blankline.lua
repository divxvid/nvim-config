local ok, ibl = pcall(require, "ibl")
if not ok then
    print("could not load indent-blankline")
    return
end

ibl.setup()
