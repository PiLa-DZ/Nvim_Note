-- (TokyoNight)
-- (nvim-treesitter)

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

-- إعداد Lazy.nvim وتحميل مخطط الألوان (Colorscheme)
require("lazy").setup({
  spec = {
    -- مخطط الألوان (TokyoNight) للحصول على مظهر LazyVim
    {
      "folke/tokyonight.nvim",
      lazy = false, -- يتم تحميل الإضافة عند بدء التشغيل
      priority = 1000, -- تأكد من تحميله كأول إضافة
      opts = {}, -- يمكن تمرير خيارات الإضافة هنا
      config = function()
        -- نقوم باستدعاء الأمر الذي يغير مخطط الألوان
        vim.cmd.colorscheme("tokyonight-night") -- أو tokyonight-storm / tokyonight-moon
      end,
    },

    -- إضافة nvim-treesitter لتلوين بناء الجملة المتقدم
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate", -- يقوم بتثبيت المحللات اللغوية عند التثبيت
      config = function()
        require("nvim-treesitter.configs").setup({
          -- اللغات التي تريد Treesitter أن يقوم بتحليلها
          -- يمكنك إضافة المزيد من اللغات حسب حاجتك (مثل "lua", "css", "html", "python", etc.)
          ensure_installed = { "javascript", "typescript", "json", "lua", "css", "html" },

          -- تفعيل تلوين بناء الجملة بواسطة Treesitter
          highlight = {
            enable = true,
            -- هنا يمكنك تعيين اللغات التي لا تريد Treesitter تلوينها (اختياري)
            disable = {},
          },
          -- تفعيل الأقواس الذكية (اختياري، ولكن مفيد)
          indent = { enable = true, disable = { "python" } },
        })
      end,
    },
  },

  -- الإعدادات العامة لـ lazy.nvim
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
