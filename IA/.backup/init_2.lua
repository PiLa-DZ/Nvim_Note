-- (nvim-tree)

-- init.lua في المسار ~/.config/nvim

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
vim.g.maplocalleader = "\\"

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
          ensure_installed = { "javascript", "typescript", "json", "lua", "css", "html" },
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
          -- الخيار sync_root_dir و auto_start تم حذفهما، سنستخدم Auto-Commands
          update_focused_file = {
              enable = true, -- تحديث شجرة الملفات لتشير إلى الملف الحالي
              update_root = false,
              ignore_list = {},
          },
        })

        -- تعيين اختصار (Keymap) لفتح/إغلاق nvim-tree
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
      end,
    },
  },

  -- الإعدادات العامة لـ lazy.nvim
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
