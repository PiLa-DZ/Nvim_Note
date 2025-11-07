-- (Alpha-nvim) --> Welcome Screen
-- (Web-Devicons)
return {
      "goolord/alpha-nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" }, -- يعتمد على أيقونات الملفات
      config = function()
        -- استخدم الثيم الافتراضي، ثم سنخصص لاحقًا إذا أردت
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- تخصيص بسيط: نطلب من ألفا أن يفتح شجرة الملفات عند بدء التشغيل
        dashboard.section.buttons.val = {} -- إزالة الأزرار الافتراضية
        
        alpha.setup(dashboard.opts)
        
        -- إنشاء أمر تلقائي يفتح nvim-tree بدلاً من شاشة ألفا
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                if vim.fn.argc() == 0 then
                    vim.cmd.NvimTreeToggle() -- فتح nvim-tree إذا لم يتم فتح أي ملف
                end
            end,
        })
      end,
    }
