-- (GitSigns)
return {
	-- gitsigns.nvim: لإظهار حالة Git على الهامش
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			-- 1. تخصيص الرموز (Signs) لتبدو واضحة ومختلفة:
			signs = {
				add = { text = "+" }, -- رمز الإضافة (جديد)
				change = { text = "~" }, -- رمز التعديل
				delete = { text = "_" }, -- رمز الحذف (سطر مفقود)
				topdelete = { text = "‾" }, -- رمز الحذف (سطر مفقود في الأعلى)
				changedelete = { text = "!" }, -- رمز التعديل والحذف معاً
			},

			-- 2. تعطيل جميع ميزات "Blame" و "Line-blame"
			current_line_blame = false,

			-- 3. تعطيل جميع الاختصارات المخصصة
			on_attach = function(bufnr)
				-- لا يوجد أي اختصارات مُعَرَّفة هنا
			end,

			-- تعطيل أي ميزات أخرى غير ضرورية للرؤية
			numhl = false,
			word_diff = false,
		},
	},
}
