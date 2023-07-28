local ok, fidget = pcall(require, 'fidget')
if not ok then 
    print("cannot load fidget")
end

fidget.setup()
