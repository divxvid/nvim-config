local ok, autoclose = pcall(require, "autoclose")
if not ok then
    print("autoclose cannot be loaded")
end

autoclose.setup()
