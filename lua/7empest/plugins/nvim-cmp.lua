local ok, cmp = pcall(require, "cmp")
if not ok then
	print("nvim-cmp failed to load")
    return
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
    print("luasnip failed to load")
    return
end

local ok, lspkind = pcall(require, "lspkind")
if not ok then
    print("lspkind failed to load")
    return
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		--for more sources go here: https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
		{ name = 'nvim_lsp' }, -- from hrsh7th/cmp-nvim-lsp
		-- { name = 'luasnip' }, -- from saadparwaiz1/cmp_luasnip
		{ name = 'buffer' }, -- from hrsh7th/cmp-buffer
		{ name = 'path' }, -- from hrsh7th/cmp-path
		-- { name = 'cmdline' }, -- from hrsh7th/cmp-cmdline
	}),
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {"i", "s"}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {"i", "s"}),
	}),
	window = {
		completion = cmp.config.window.bordered(), --creates borders around suggestion boxes
		documentation = cmp.config.window.bordered(), --creates borders around documnetation boxes
	},
    formatting = {
        format = lspkind.cmp_format(),
    },
})


local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	print("cmp_nvim_lsp failed to load")
    return
end
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	print("lspconfig failed to load")
    return
end

local capabilities = cmp_lsp.default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local installed_lsp = {
	'lua_ls',
    'gopls',
}

for _, v in pairs(installed_lsp) do
	lspconfig[v].setup {
		capabilities = capabilities
	}
end
