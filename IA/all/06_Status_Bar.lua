-- (LuaLine) --> Status Bar
-- (Web-Devicons)
return {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- لضمان ظهور الأيقونات بشكل صحيح
        opts = {
            options = {
                icons_enabled = true,
                theme = "tokyonight", -- استخدام ثيم متوافق مع TokyoNight
                component_separators = { left = '', right = ''}, -- فواصل المكونات
                section_separators = { left = '', right = ''},   -- فواصل الأقسام
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                always_last_set = true,
                globalstatus = true, -- عرض شريط حالة واحد فقط في الأعلى (يشبه LazyVim)
            },
            sections = {
                lualine_a = {'mode'}, -- وضع التحرير (Insert/Normal)
                lualine_b = {'filename', 'branch'}, -- اسم الملف وفرع Git
                lualine_c = {'diff', 'diagnostics'}, -- عدد التغييرات في Git وأخطاء المترجم (Diagnostics)
                lualine_x = {'encoding', 'fileformat', 'filetype'}, -- الترميز وتنسيق الملف ونوع الملف
                lualine_y = {'progress'}, -- تقدم الملف
                lualine_z = {'location'}, -- الموقع الحالي (رقم السطر)
            },
        },
    }
