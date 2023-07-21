local ok, whichKey = pcall(require, "which-key")
if not ok then
	print("which-key load failed")
end

local opts = {}

local setupTable = {}

local mappings = {}

whichKey.setup(setupTable)
whichKey.register(mappings, opts)
