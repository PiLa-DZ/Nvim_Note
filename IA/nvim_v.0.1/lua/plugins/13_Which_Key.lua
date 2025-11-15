return {
	-- which-key.nvim: لعرض قائمة الاختصارات (Keymap Menu)
	{
		"folke/which-key.nvim",
		event = "VeryLazy", -- يمكن تأخير تحميله
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- نستخدمها لـ nvim-tree
			"echasnovski/mini.icons", -- الإضافة المطلوبة للأيقونات
		},
		init = function()
			-- يجب أن يتم تعريف مفتاح القائد هنا أيضاً للتأكد
			vim.o.timeout = true
			vim.o.timeoutlen = 300 -- المدة التي ينتظرها لظهور القائمة (300 مللي ثانية)
		end,

		config = function()
			-- require("which-key").setup({
			-- التكوين الافتراضي لـ which-key
			-- window = {
			-- border = "single", -- نوع الحدود (single, double, rounded)
			-- },
			-- يمكنك إضافة مجموعات الاختصارات المخصصة هنا
			-- })

			-- قم بتسجيل الاختصارات الخاصة بك مع وصفها لكي تظهر في القائمة
			-- local wk = require("which-key")

			-- تسجيل اختصارات الـ Leader Key (عادةً Space)
			-- wk.register({
			-- f = { name = "[F]ind / [G]rep", _ = "which_key_ignore" }, -- مجموعة Telescope
			-- d = { name = "[D]iagnostics / [D]ebug", _ = "which_key_ignore" }, -- مجموعة Diagnostics
			-- h = { name = "[H]unk / [R]eset", _ = "which_key_ignore" }, -- مجموعة Gitsigns
			-- n = { name = "[N]eorg / [O]ptions", _ = "which_key_ignore" }, -- مجموعة Neorg
			-- }, { prefix = "<leader>" })

			-- تسجيل اختصارات وضع (Visual Mode)
			-- wk.register({
			-- ["<leader>"] = { name = "Visual <Leader> Actions", _ = "which_key_ignore" },
			-- }, { mode = "v" })
		end,
	},
}
