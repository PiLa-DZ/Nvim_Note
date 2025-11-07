-- (nvim-cmp) --> Simple Auto Compate
return {
	-- 1. الإطار الرئيسي للإكمال التلقائي (nvim-cmp)
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer", -- مصدر لـ Buffers المفتوحة
			"hrsh7th/cmp-path", -- مصدر لمسارات الملفات
			"L3MON4D3/LuaSnip", -- لتوفير القصاصات البرمجية (Snippets)
			"saadparwaiz1/cmp_luasnip", -- مصدر لـ LuaSnip
			-- لا نحتاج cmp-nvim-lsp حالياً، لكن سنضيفه لاحقاً
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- استخدام LuaSnip كـ Snippet Engine
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(), -- تفعيل الإكمال يدوياً
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- تأكيد الاكمال
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					-- سنضيف مصدر Neorg لاحقاً بعد التأكد من عمله
					{ name = "buffer" },
					{ name = "path" },
					{ name = "luasnip" },
				}),
			})
		end,
	},
}
