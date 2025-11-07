-- (Tokyo-Night) --> Color Scheme
return {
      "folke/tokyonight.nvim",
      lazy = false, -- يتم تحميل الإضافة عند بدء التشغيل
      priority = 1000, -- تأكد من تحميله كأول إضافة
      opts = {}, -- يمكن تمرير خيارات الإضافة هنا
      config = function()
        -- نقوم باستدعاء الأمر الذي يغير مخطط الألوان
        vim.cmd.colorscheme("tokyonight-night") -- أو tokyonight-storm / tokyonight-moon
      end,
    }
