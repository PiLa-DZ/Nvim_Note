-- (Conform) --> Text Formating
--
-- TODO: You have to install
-- -- (Prettier) Using --> (Mason)
-- -- (StyLua) Using --> (Mason)

return {
	-- Conform: التنسيق التلقائي عند الحفظ
	{
		"stevearc/conform.nvim",
		dependencies = { "williamboman/mason.nvim" }, -- لضمان عمل Mason أولاً
		lazy = false, -- يمكن تحميله عند بدء التشغيل

		-- اختصار المفاتيح (Keymap) للتنسيق اليدوي: <Leader>fm
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer (Conform)",
			},
		},

		config = function()
			require("conform").setup({
				-- تحديد المنسقات لكل نوع ملف
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					lua = { "stylua" },
				},

				-- تفعيل التنسيق عند الحفظ (Format On Save)
				format_on_save = {
					timeout_ms = 1000,
					lsp_fallback = true, -- استخدام LSP للتنسيق إذا لم يكن هناك منسق خارجي
				},
			})
		end,
	},
}
