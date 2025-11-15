-- في الملف: ~/.config/nvim/lua/plugins/15_Fidget.lua

return {
	{
		"j-hui/fidget.nvim",
		-- lazy = false لا نحتاج إليها هنا
		config = function()
			-- استدعاء setup فارغ لضمان استخدام جميع الإعدادات الافتراضية الجيدة
			require("fidget").setup({})
		end,
	},
}
