-- (neorg)
-- (nvim-lua/plenary.nvim)

-- تهيئة Lazy.nvim (Bootstrap lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- تعيين مفتاح القائد (Leader Key)
vim.g.mapleader = " "
vim.g.maplocalleader = ";"
-- vim.opt.conceallevel = 2
-- vim.opt.concealcursor = "nc"

-- إعداد Lazy.nvim وتحميل مخطط الألوان وشريط الحالة
require("lazy").setup({
  spec = {
    -- 1. مخطط الألوان (TokyoNight)
    {
      "folke/tokyonight.nvim",
      lazy = false, -- يتم تحميل الإضافة عند بدء التشغيل
      priority = 1000, -- تأكد من تحميله كأول إضافة
      config = function()
        vim.cmd.colorscheme("tokyonight-night") -- تطبيق مخطط الألوان
      end,
    },

    -- 2. تلوين بناء الجملة المتقدم (Treesitter)
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "javascript", "typescript", "json", "lua", "css", "html" , "norg"},
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
    },
    
    -- 3. شريط الحالة الجميل (lualine.nvim)
    {
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
    },
    -- 4. متصفح الملفات (nvim-tree)
-- 4. متصفح الملفات (nvim-tree)
-- 4. متصفح الملفات (nvim-tree)
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup({
          sort_by = "case_sensitive",
          view = {
            width = 30, -- عرض شجرة الملفات
            adaptive_size = true,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = false,
          },
        })

        -- تعيين اختصار (Keymap) لفتح/إغلاق nvim-tree
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
      end,
    },  
	-- 5. شاشة البداية (Alpha-nvim)
    {
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
    },
		-- 6. أداة Neorg لتدوين الملاحظات وإدارة المعرفة
    {
      "nvim-neorg/neorg",
      lazy = false, -- تحتاج للتكوين مبكراً للتعرف على نوع الملفات
      build = ":Neorg sync-parsers", -- يقوم بتثبيت المحللات اللغوية لـ Neorg
      dependencies = { "nvim-lua/plenary.nvim" }, -- اعتمادية أساسية
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {}, -- تحميل الإعدادات الافتراضية
            ["core.concealer"] = {}, -- تفعيل الإخفاء (Concealing) للنص لجعل المظهر أجمل
            ["core.dirman"] = { -- مدير المجلدات
              config = {
                workspace = {
                  notes = "~/notes", -- يمكنك تغيير هذا المسار إلى مجلد ملاحظاتك المفضل
                },
              },
            },
            -- يمكنك إضافة وحدات أخرى هنا لاحقاً (مثل core.completion، core.export)
          },
        }
      end,
    },
   },

  -- الإعدادات العامة لـ lazy.nvim
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
