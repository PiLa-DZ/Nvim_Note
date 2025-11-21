-- في ملف plugins/Tools/..lua أو ملف جديد
return {
	"gsuuon/cursor-chat.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("cursor-chat").setup({
			-- 💡 الإعداد الحاسم: توجيه الإضافة لاستخدام Ollama
			model = "ollama/codellama", -- استبدل codellama باسم النموذج الذي قمت بتنزيله
			-- التأكد من أن العنوان هو العنوان الافتراضي لـ Ollama
			host = "http://localhost:11434",
			-- يمكنك تحديد اختصار لفتح الدردشة (مثلاً <leader>ci)
			keymaps = {
				chat = "<leader>ci",
			},
		})
	end,
}
