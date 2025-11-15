-- في الملف: ~/.config/nvim/lua/plugins/12_Diagnostics.lua

return {
	-- trouble.nvim: لعرض الأخطاء والتحذيرات في قائمة مرتبة
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,

		opts = {
			signs = {
				error = " ",
				warning = " ",
				hint = " ",
				information = " ",
			},
			use_diagnostic_signs = true,
		},

		-- الاختصارات الموثوقة والنهائية:
		keys = {
			-- 💡 الاختصار الرئيسي: يعرض الأخطاء ويخفيها
			{
				"<leader>dd",
				"<cmd>Trouble diagnostics toggle<CR>", -- الأمر الصحيح الذي يعمل
				desc = "Toggle Diagnostics List",
			},
		},
	},
}
